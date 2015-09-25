describe User do

 let!(:user) do
   User.create(email: 'test@test.com', password: 'secret1234', username: 'dom',
               password_confirmation: 'secret1234')
 end

 it 'authenticates when given a valid email address and password' do
   authenticated_user = User.authenticate(user.email, user.password)
   expect(authenticated_user).to eq user
   p authenticated_user
   p user
 end

end
