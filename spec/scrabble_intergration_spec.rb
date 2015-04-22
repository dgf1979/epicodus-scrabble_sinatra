require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('scrabble', {:type => :feature}) do
  it('returns a scrabble score for a letter.') do
    visit('/')
    fill_in('scrabble_box', :with => 'a')
    click_button('Send')
    expect(page).to have_content('1')
  end
  it('returns a scrabble score for a word.') do
    visit('/')
    fill_in('scrabble_box', :with => 'aaaaazzzzz')
    click_button('Send')
    expect(page).to have_content('55')
  end
  it('returns a scrabble score for a wordwith a capital letter.') do
    visit('/')
    fill_in('scrabble_box', :with => 'Aaaaazzzzz')
    click_button('Send')
    expect(page).to have_content('55')
  end
end
