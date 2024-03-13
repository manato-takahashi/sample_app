require "test_helper" # test_helper.rbを読み込む

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "Ruby on Rails Tutorial Sample App", full_title
    assert_equal "Help | Ruby on Rails Tutorial Sample App", full_title("Help")
  end
end