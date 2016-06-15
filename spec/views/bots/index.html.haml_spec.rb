require 'rails_helper'

RSpec.describe "bots/index", type: :view do
  before(:each) do
    assign(:bots, [
      Bot.create!(
        :name => "Name"
      ),
      Bot.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of bots" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
