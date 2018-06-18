require 'rails_helper'

RSpec.describe Topic, type: :model do
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:public) { true }
   let(:topic) { Topic.create!(name: name, description: description) }

   it { is_expected.to have_many(:posts) }

 # #1 confirm topic responds to have_attributes
   describe "attributes" do
     it "has name, description, and public attributes" do
       expect(topic).to have_attributes(name: name, description: description, public: public)
     end

 # #2 test public attribute is true by default
     it "is public by default" do
       expect(topic.public).to be(true)
     end
   end
end
