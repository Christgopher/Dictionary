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
  it('adds a definition to a word') do
    visit('/words')
    click_link('Book')
    fill_in('definition', :with => 'a thing that you read')
    click_button('Add Definition')
    click_link('Look at words')
    click_link('Book')
    expect(page).to have_content('a thing that you read')
  end
end
