feature 'User sign in' do

  scenario 'Clicking sign in takes me to the sign in page' do
    visit '/users/new'
    click_button('Sign in')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Sign In')
  end

  scenario 'I am welcomed after signing in' do
    visit 'sessions/new'
    user = build :user
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button('Sign in')
    expect(page).to have_content("Welcome, dom")
  end

end
