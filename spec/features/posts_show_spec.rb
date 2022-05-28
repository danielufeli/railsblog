require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'show page' do
    before :all do
    User.destroy_all
    @user_test = User.create(
      name: 'Daniel',
      email: 'user@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )
  end

    before(:each) do
      @first_post = Post.create!(
      author_id: @user_test.id,
      title: 'First Post',
      text: 'Hello'
    )
    @first_comment = Comment.create!(
      post_id: @first_post.id,
      author_id: @user_test.id,
      text: 'First comment'
    )
    @first_like = Like.create!(
      post_id: @first_post.id,
      author_id: @user_test.id
    )
     @second_like = Like.create!(
      post_id: @first_post.id,
      author_id: @user_test.id
    )
      visit new_user_session_path
      page.fill_in 'Email', with: 'user@gmail.com'
      page.fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_on(@user_test.name)
      click_on('All Posts')
      click_on(@first_post.title)
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content(@first_post.user.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content('Likes: 2')
    end

    it 'I can see the post body.' do
      expect(page).to have_content(@first_post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@first_comment.user.name)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@first_comment.text)
    end
  end
end
