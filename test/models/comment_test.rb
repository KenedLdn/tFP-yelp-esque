require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "humanized_rating" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment, :user => user)

    expected = '★★★★☆'
    actual = comment.humanized_rating
    assert_equal expected, actual
  end
end
