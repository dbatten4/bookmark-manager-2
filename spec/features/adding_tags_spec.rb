feature 'Adding tags' do 

  scenario 'I can add a single tag' do 
    visit '/links/new'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tag', with: 'education'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end


end