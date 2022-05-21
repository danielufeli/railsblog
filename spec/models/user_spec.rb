require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Daniel', bio: 'I am a Full-stack developer', post_counter: 0, photo: 'https://images.pexels.com/photos/12003167/pexels-photo-12003167.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260')

  before(:each) { user.save }

  it 'validates the presence of the name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the post_counter' do
    user.post_counter = nil
    expect(user).to_not be_valid
  end

  it 'validates the numericality of the post_counter' do
    user.post_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'validates the presence of the bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the photo' do
    user.photo = nil
    expect(user).to_not be_valid
  end
end