FactoryGirl.define do 

  factory :user do 
    email 'dom@example.com'
    username 'dom'
    password '123'
    password_confirmation '123'
  end

end