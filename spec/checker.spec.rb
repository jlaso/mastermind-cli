require_relative '../lib/mastermind_game_cli'

describe 'Checker.check' do

  it 'Check the same sequences' do
    sequence1 = '12345'
    sequence2 = '12345'
    result = MastermindGameCli::Checker.check(sequence1, sequence2)
    expect(result.length).to eq(5)
    expect(result).to eq('11111')
  end

  it 'Check totally different sequences' do
    sequence1 = '12345'
    sequence2 = '67890'
    result = MastermindGameCli::Checker.check(sequence1, sequence2)
    expect(result.length).to eq(0)
    expect(result).to eq('')
  end

  it 'Check inverse sequences' do
    sequence1 = '12345'
    sequence2 = '54321'
    result = MastermindGameCli::Checker.check(sequence1, sequence2)
    expect(result.length).to eq(5)
    expect(result).to eq('10000')
  end

end


describe 'Checker.only_digits' do

  it 'check only digits string' do
    expect(MastermindGameCli::Checker.only_digits?('12345')).to eq(true)
  end

  it 'check digits with one vowel string' do
    expect(MastermindGameCli::Checker.only_digits?('a1234')).to eq(false)
  end

  it 'check all alpha chars string' do
    expect(MastermindGameCli::Checker.only_digits?('abcde')).to eq(false)
  end

end


describe 'Checker.non_repeated' do

  it 'check valid sequence' do
    expect(MastermindGameCli::Checker.repeated?('12345')).to eq(false)
  end

  it 'check repeated' do
    expect(MastermindGameCli::Checker.repeated?('12222')).to eq(true)
  end

  it 'check repeated 2' do
    expect(MastermindGameCli::Checker.repeated?('012341')).to eq(true)
  end

end


describe 'Checker.get_matches' do

  it 'Check the same sequences' do
    sequence1 = '12345'
    sequence2 = '12345'
    result = MastermindGameCli::Checker.get_matches(sequence1, sequence2)
    expect(result).to eq(%w(1 2 3 4 5))
  end

  it 'Check totally different sequences' do
    sequence1 = '12345'
    sequence2 = '67890'
    result = MastermindGameCli::Checker.get_matches(sequence1, sequence2)
    expect(result).to eq([])
  end

  it 'Check inverse sequences' do
    sequence1 = '12345'
    sequence2 = '54321'
    result = MastermindGameCli::Checker.get_matches(sequence1, sequence2)
    expect(result).to eq(%w(3))
  end

end