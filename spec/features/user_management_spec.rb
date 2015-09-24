feature 'User sign up' do 

  before(:each) do
    visit '/users/new'
    fill_in :email, with: 'alice@example.com'
    fill_in :password, with: '12345678'
  end

  # def sign_up(email: 'alice@example.com',
  #             password: '12345678',
  #             password_confirmation: '12345678')
  #   visit '/users/new'
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   fill_in :password_confirmation, with: password_confirmation
  #   click_button 'Sign up'
  # end

  scenario 'I can sign up as a new user' do 
    # visit '/users/new'
    expect(page.status_code).to eq(200)
    # fill_in :email, with: 'alice@example.com'
    # fill_in :password, with: 'oranges!'
    fill_in :password_confirmation, with: '12345678'
    click_button 'Sign up'
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching password' do 
    # visit '/users/new'
    fill_in :password_confirmation, with: 'wrong!'
    expect { click_button('Sign up') }.not_to change(User, :count)
  end





end