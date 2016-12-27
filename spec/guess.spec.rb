require_relative '../lib/mastermind_game_cli/guess'

describe 'Guess' do
  it 'Dumb test' do
    guess = MastermindGameCli::Guess.new('1234','1100')
    expect(guess.value).to eq('1234')
    expect(guess.response).to eq('1100')
  end
end