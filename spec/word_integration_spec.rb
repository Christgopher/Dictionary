require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the dictionary website paths', :type => :feature) do
  it('adds a word to the list') do
    visit('/')
    click_link('Add a new word!')
    fill_in('word', :with => 'Book')
    click_button('Add Word')
    click_link('Look at words')
    expect(page).to have_content('Book')
  end
end
