require './spec/factories/user'

feature 'User sign up' do 

  # before(:each) do
  #   visit '/users/new'
      # user = build :user
  #   fill_in :email,    with: user.email
  #   fill_in :username, with: user.username
  #   fill_in :password, with: user.password
  #   fill_in :password_confirmation, with: user.password_confirmation
  # end


  # def sign_up_as(user)
  #   visit '/users/new'
  #   fill_in :email,    with: user.email
  #   fill_in :username, with: user.username
  #   fill_in :password, with: user.password
  #   fill_in :password_confirmation, with: user.password_confirmation
  #   click_button 'Sign up'
  # end

  scenario 'I can sign up as a new user' do
    user = build :user
    sign_up_as(user)
    click_button 'Sign up'
    expect(page).to have_content('Welcome, dom')
    expect(User.first.email).to eq('dom@example.com')
  end

  scenario 'with a password that does not match' do 
    user = build :user
    sign_up_as(user)
    fill_in :password_confirmation, with: 'wrong!'
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requires an email' do 
    user = build :user
    sign_up_as(user)
    fill_in :email, with: ''
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'I cannot sign up with an existing email' do 
    user = build :user
    sign_up_as(user)
    click_button 'Sign up'
    sign_up_as(user)
    expect { click_button('Sign up') }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end





end