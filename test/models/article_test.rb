require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create article" do
    art = Article.new(:one)
    assert art, true
  end
  
end
