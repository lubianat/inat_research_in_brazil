require "test_helper"

class ResearchArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get research_articles_index_url
    assert_response :success
  end
end
