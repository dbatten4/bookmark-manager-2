feature 'User sign up' do 

  before(:each) do
    visit '/users/new'
    fill_in :email, with: 'alice@example.com'
    fill_in :password, with: '12345678'
    fill_in :password_confirmation, with: '12345678'
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
    expect(page.status_code).to eq(200)
    click_button 'Sign up'
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching password' do 
    fill_in :password_confirmation, with: 'wrong!'
    expect { click_button('Sign up') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do 
    fill_in :password_confirmation, with: 'wrong!'
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation do not match'
  end

  scenario 'requires an email' do 
    fill_in :email, with: ''
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end





end