require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before :all do
    User.destroy_all
    @user_test = User.create(
      name: 'Daniel',
      email: 'user1@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )
    @user_test1 = User.create(
      name: 'Edim',
      email: 'user2@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )
  end

  describe 'index page' do
    before(:each) do
      visit new_user_session_path
      page.fill_in 'Email', with: 'user1@gmail.com'
      page.fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content('Daniel')
    end

    it 'I can see the profile picture for each user.' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_on(@user_test.name)
      expect(page).to have_current_path user_path(@user_test)
    end
  end
end
