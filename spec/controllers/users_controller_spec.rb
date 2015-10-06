require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = create(:user)
  end
    
  describe "GET #show" do

    context "user is logged in" do
      before do
        sign_in @user
      end
      
      it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    
    end
    
    context "user is not logged in" do
      before do
        sign_out @user
      end
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end
  
  end #end describe get show
  
    before do
      @user2 = User.create!(:email => "abc@123.com", :password => "12345678")
    end
    
    context "GET #show user2" do
      before do
        sign_in @user #sign in user1
      end
      
      it "user1 cannot access user2 #show" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end
    
    end
    
  
end #end describe Users Controller

