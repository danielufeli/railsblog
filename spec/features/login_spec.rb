require 'rails_helper'

RSpec.describe 'Sign in process', type: :feature do
  before :all do
    User.destroy_all
    User.create(
      name: 'Gaby',
      email: 'user@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )
  end

  before :each do
    visit new_user_session_path
  end

  context '#GET' do
    it `should validate if there are username and password inputs and the "Log in" button` do
      email_field = find_field('user[email]')
      password_field = find_field('user[password]')
      submit_button = find_field('Log in')
      expect(email_field).to_not be_nil
      expect(password_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end
end