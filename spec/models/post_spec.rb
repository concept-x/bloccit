require 'rails_helper'

RSpec.describe Post, type: :model do
  # #1 Create & name new instance of Post class
    let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
    
    # #2 Test: does "Post" have attributes named "New Post Title" and "New Post Body"?
    describe "attributes" do
        it "has title and body attributes" do
            expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
        end
    end
end
