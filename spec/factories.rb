FactoryGirl.define do
  factory :user do
    first_name "Dave"
    id 2
    email "email@email.com"
    password "12345678"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    admin true
  end
  
  factory :product do
    name "Ball"
  end
  
  factory :comment do
    user
    product
  end
  
end