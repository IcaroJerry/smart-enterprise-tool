require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get lock_screen" do
    get :lock_screen
    assert_response :success
  end

end
