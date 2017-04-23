require 'test_helper'

class ModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get modules_index_url
    assert_response :success
  end

  test "should get show" do
    get modules_show_url
    assert_response :success
  end

end
