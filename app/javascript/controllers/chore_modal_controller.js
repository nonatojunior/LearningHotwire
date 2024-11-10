import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chore-modal"
export default class extends Controller {
  connect() {
    console.log("Hi! we are in ChoreModalController from Stimulus")
  }

  // hide modal
  // action: "chore-modal#hideModal"
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  // hide modal on successful form submission
  // action: "turbo:submit-end->chore-modal#submitEnd"
  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

  // hide modal when clicking ESC
  // action: "keyup@window->chore-modal#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  // hide modal when clicking outside of modal
  // action: "click@window->chore-modal#closeBackground"
  closeBackground(e) {
    if (e && this.formTarget.contains(e.target)) { // check with user are clicking inside the form
      return
    }
    this.hideModal()
  }
}
