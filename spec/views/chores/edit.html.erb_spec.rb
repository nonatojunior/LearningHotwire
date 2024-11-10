require 'rails_helper'

RSpec.describe "chores/edit", type: :view do
  let(:chore) {
    Chore.create!(
      title: "MyString",
      content: "MyText"
    )
  }

  before(:each) do
    assign(:chore, chore)
  end

  it "renders the edit chore form" do
    render

    assert_select "form[action=?][method=?]", chore_path(chore), "post" do

      assert_select "input[name=?]", "chore[title]"

      assert_select "textarea[name=?]", "chore[content]"
    end
  end
end
