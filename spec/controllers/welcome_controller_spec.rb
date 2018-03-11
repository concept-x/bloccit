require 'rails_helper'

# #1 describe subject of spec, WelcomeController
RSpec.describe WelcomeController, type: :controller do
    describe "GET index" do
        it "renders the index template" do
    # #2 use 'get' to call 'index' method of WC
            get :index
    # #3 expect WC's reponse to render index template
            expect(response).to render_template("index")
        end
    end
    
    describe "GET about" do
        it "renders the about template" do
            get :about
            expect(response).to render_template("about")
        end
    end
    
    describe "GET faq" do
        it "renders the faq template" do
            get :faq
            expect(response).to render_template("faq")
        end
    end
end
