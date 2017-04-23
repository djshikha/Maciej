require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get apps" do
    get index_apps_url
    assert_response :success
  end

end
