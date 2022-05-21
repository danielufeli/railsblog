require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Daniel', bio: 'I am a Full-stack developer', post_counter: 0, photo: 'https://images.pexels.com/photos/12003167/pexels-photo-12003167.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260')
  post = Post.new(title: 'Post 1', text: 'Text...', commentsCounter: 0, likesCounter: 0, author_id: user.id)

  before(:each) { post.save }

  it 'validates the presence of the title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'validates the presence of the text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'validates the presence of the commentsCounter' do
    post.commentsCounter = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the commentsCounter' do
    post.commentsCounter= 'This is really good post!'
    expect(post).to_not be_valid
  end

  it 'validates the presence of the likes_counter' do
    post.likesCounter = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the likes_counter' do
    post.likesCounter = '1'
    expect(post).to_not be_valid
  end

  it 'validates the presence of the author_id' do
    post.author_id = nil
    expect(post).to_not be_valid
  end
end
