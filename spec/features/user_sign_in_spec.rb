feature 'User sign in' do

  scenario 'Clicking sign in takes me to the sign in page' do
    visit '/users/new'
    click_button('Sign in')
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'I am welcomed after signing in' do
    visit '/users/sign_in'
    user = build :user
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button('Sign in')
    expect(current_path).to eq('/links')
    expect(page).to have_content("Welcome," )
  end

end
