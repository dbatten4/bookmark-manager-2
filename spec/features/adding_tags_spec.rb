feature 'Adding tags' do 

  scenario 'I can add a single tag' do 
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end

  scenario 'No tag is created if I submit an empty tag' do
    visit 'links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: ''
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).not_to include('')
  end


end