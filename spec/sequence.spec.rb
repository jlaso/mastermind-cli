require_relative '../lib/mastermind_game_cli'

describe 'Sequencer' do
  it 'Starts a new sequence' do
    num_pos = 5
    sequence = MastermindGameCli::Sequence.new(num_pos)
    expect(sequence.value.length).to eq(num_pos)
  end
end