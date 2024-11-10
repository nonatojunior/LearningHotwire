require 'rails_helper'

RSpec.describe "chores/new", type: :view do
  before(:each) do
    assign(:chore, Chore.new(
      title: "MyString",
      content: "MyText"
    ))
  end

  it "renders new chore form" do
    render

    assert_select "form[action=?][method=?]", chores_path, "post" do

      assert_select "input[name=?]", "chore[title]"

      assert_select "textarea[name=?]", "chore[content]"
    end
  end
end
