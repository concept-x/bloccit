require 'rails_helper'

RSpec.describe Post, type: :model do
  # #1 Create & name new instance of Post class
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  # #3 create parent topic for 'post'
    let(:topic) { Topic.create!(name: name, description: description) }
  # #4 associate post with topic via chained method call
    let(:post) { topic.posts.create!(title: title, body: body) }

    it { is_expected.to belong_to(:topic) }
    # #2 Test: does "Post" have attributes named "New Post Title" and "New Post Body"?
    describe "attributes" do
        it "has title and body attributes" do
                   expect(post).to have_attributes(title: title, body: body)
        end
    end
end
