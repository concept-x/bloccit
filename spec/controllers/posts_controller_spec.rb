require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns [my_post] to @posts' do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  describe "GET show" do
  it "returns http success" do
# #16
    get :show, params: { id: my_post.id }
    expect(response).to have_http_status(:success)
  end
  it "renders the #show view" do
# #17
    get :show, params: { id: my_post.id }
    expect(response).to render_template :show
  end

  it "assigns my_post to @post" do
    get :show, params: { id: my_post.id }
# #18
    expect(assigns(:post)).to eq(my_post)
  end
end

  #'new' makes a new, unsaved Post object (see POST create) below
   describe 'GET new' do
     it 'returns http success' do
       get :new
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end

     it "instantiates @post" do
        get :new
        expect(assigns(:post)).not_to be_nil
      end
    end

#'create' persists the new Post (see above) to the database
    describe "POST create" do
      it "increases the number of Post by 1" do
        expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph} } }.to change(Post, :count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end
  end

  #edit posts tests
  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: my_post.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { id: my_post.id }
# #1
      expect(response).to render_template :edit
    end

# #2
    it "assigns post to be updated to @post" do
      get :edit, params: { id: my_post.id }

      post_instance = assigns(:post)

      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }

# #3 tests that post 'title' and 'body' were updated, but post id remains the same
      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

# #4 expect to be redirected to posts 'show' view after update
      put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
      expect(response).to redirect_to my_post
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, params: { id: my_post.id }
# #6
      count = Post.where({id: my_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, params: { id: my_post.id }
# #7
      expect(response).to redirect_to posts_path
    end
  end
end
