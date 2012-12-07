require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test 'comments_count is not incremented like a counter cache' do
    post = Post.create
    post.comments.create
    assert_nil post.reload.comments_count
  end

  test 'comments_count is not incremented like a counter cache when shoveling' do
    post = Post.create
    comment = Comment.create
    post.comments << comment
    assert_nil post.reload.comments_count
  end

  test 'comments_count is not decremented like a counter cache when a comment is destroyed' do
    post = Post.create(:comments_count => 1)
    comment = post.comments.create
    comment.destroy
    assert_equal 1, post.reload.comments_count
  end

  test 'comments_count is not used to determine comments.size' do
    post = Post.create(:comments_count => 100)
    post.comments.create
    assert_equal 1, post.comments.size
  end

  test 'comments_count is not decremented when deleting comments' do
    post = Post.create(:comments_count => 100)
    post.comments.create
    post.comments.destroy_all
    assert_equal 100, post.reload.comments_count
  end
end
