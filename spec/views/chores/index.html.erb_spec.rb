require 'rails_helper'

RSpec.describe "chores/index", type: :view do
  before(:each) do
    assign(:chores, [
      Chore.create!(
        title: "Title",
        content: "MyText"
      ),
      Chore.create!(
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of chores" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
