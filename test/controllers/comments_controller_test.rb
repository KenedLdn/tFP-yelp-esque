require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "create" do
    user = FactoryGirl.create(:user)
    place = FactoryGirl.create(:place)
    sign_in user

    assert_difference 'Comment.count' do
      post :create, :place_id => place.id, :comment => {
        :rating => '★★★★☆',
        :message => 'Good place will try again.'
      }
    end

    assert_equal 1, Comment.count
    assert_redirected_to place_path(place.slug)
  end
end
