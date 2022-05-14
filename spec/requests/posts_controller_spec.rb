require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /index' do
    it 'has a success status' do
      get '/users/767/posts'
      expect(response).to have_http_status(:ok)
    end

    context 'renders index template' do
      it 'renders correct template' do
        get '/users/767/posts'
        expect(response).to render_template(:index)
      end
      it "doesn't render other template" do
        get '/users/737/posts'
        expect(response).to_not render_template(:show)
      end
    end

    it 'has index placeholder' do
      get '/users/737/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'has a success status' do
      get '/users/737/posts/2'
      expect(response).to have_http_status(:ok)
    end

    context 'renders show template' do
      it 'renders correct template' do
        get '/users/737/posts/2'
        expect(response).to render_template(:show)
      end

      it "doesn't render other template" do
        get '/users/737/posts/2'
        expect(response).to_not render_template(:index)
      end
    end

    it 'contains show placeholder' do
      get '/users/737/posts/2'
      expect(response.body).to include('Here is a user post')
    end
  end
end
