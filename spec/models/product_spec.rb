require 'rails_helper' # also requires spec_helper and adds other stuff - if didnt need Rails just use spec_helper but unlikely

describe Product do
  
  describe "#average_rating" do # - the '#' signifies that we are testing an instance method - describe the method you will be testing (which belongs to the Class)
    
    #context 1, test 1
    context "when the product has comments" do # create context
      before do # before running the test...
        @product = create(:product)
        @user = create(:user)
        @product.comments.create(:rating => 1, :user => @user, :body => "hello")
        @product.comments.create(:rating => 3, :user => @user, :body => "good")
        @product.comments.create(:rating => 5, :user => @user, :body => "night")
      end

      it 'returns the average rating of all comments' do
        expect(@product.average_rating).to eq 3
      end
    end
 
  end #end describe #average_rating     
  
end #end describe Product