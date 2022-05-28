require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  # before :all do
  #   User.destroy_all
  #   @user_test = User.create(
  #     name: 'James',
  #     photo: 'url/photo',
  #     email: 'user@gmail.com',
  #     bio: 'James biography',
  #     password: 'password',
  #     post_counter: 0,
  #     confirmed_at: Time.now,
  #   )
  # end

  # before(:each) do
  #   visit new_user_session_path

  #   @post_test = Post.create(
  #     user: @user_test,
  #     title: 'Harry Potter versus Tom Riddle',
  #     text: 'Harry Potter first post content name',
  #     commentsCounter: 0,
  #     likesCounter: 0,
  #     author_id: 1,
  #   )
  # end

  # describe 'GET#index' do
  #   before { get user_posts_path(1) }

  #   it 'renders index template' do
  #     expect(response).to render_template(:index)
  #   end

  #   it 'includes the posts list' do
  #     expect(response.body).to include('Harry Potter first post name')
  #   end

  #   it 'is a success' do
  #     expect(response).to have_http_status(:ok)
  #   end
  # end

  # describe 'GET#show' do
  #   before { get user_post_path(@user_test.id, @post_test.id) }

  #   it 'renders show template' do
  #     expect(response).to render_template(:show)
  #   end

  #   it 'includes the posts detail info' do
  #     expect(response.body).to include('Harry Potter first post name')
  #   end

  #   it 'is a success' do
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
