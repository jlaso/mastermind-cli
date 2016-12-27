module MastermindGameCli

  require_relative 'sequence'
  require_relative 'checker'
  require_relative 'guess'
  require 'colorize'

  class Game

    attr_reader :sequence
    attr_accessor :mark

    def initialize(num_pos)
      @mark = nil
      @hints = []
      @num_pos = num_pos
      @finish = false
      @guesses = []
      @sequence = Sequence.new(num_pos)
    end

    def finished?
      @finish
    end

    def guess(guess)
      raise "Bad try, I expect a combination of #{@num_pos} digits" unless guess.length.equal? @num_pos
      raise 'Bad try, I expect only digits' unless Checker.only_digits? guess
      raise 'Bad try, I expect a combination without repetitions' if Checker.repeated? guess
      raise 'Bad try, you already tried that one' if @guesses.include? guess
      result = Checker.check(@sequence.value, guess)
      @guesses << Guess.new(guess, result)
      @finish = (result == '1' * @num_pos)
    end

    def pretty_print
      printf "| %02s | %-#{@num_pos}s | %-#{@num_pos}s |\r\n", '#', 'try', 'res'
      printf "|%04s|%-#{@num_pos+2}s|%-#{@num_pos+2}s|\r\n", '-' * 4, '-'*(@num_pos+2), '-'*(@num_pos+2)
      line = 1
      @guesses.each do |guess|
        printf "| %02d | %-#{@num_pos}s | %-#{@num_pos}s |\r\n", line, pretty_print_string(guess.value, @mark), guess.response
        line += 1
      end
      printf "|%04s|%-#{@num_pos+2}s|%-#{@num_pos+2}s|\r\n", '-' * 4, '-'*(@num_pos+2), '-'*(@num_pos+2)
    end

    def add_hint
      hint = new_hint
      raise 'not enough info to give a hint' if hint.nil?
      @hints << hint
    end

    private
    def new_hint
      raise 'Hints are limited to 2' if @hints.length >= 2
      candidates = []
      @guesses.each do |guess|
        matches = Checker.get_matches(@sequence.value, guess.value)
        matches.each do |match|
          candidates << match unless candidates.include? match
        end
      end
      @hints.each do |hint|
        candidates.delete(hint)
      end
      candidates.length > 0 ? candidates[0] : nil
    end

    private
    def pretty_print_string(st, nb)
      result = ''
      nb = nb.to_i unless nb.nil?
      (0..st.length-1).each do |i|
        ch = st[i]
        if @hints.include? ch
          if @sequence.value[i].to_i.equal? ch.to_i
            result += ch.red
          else
            result += ch.yellow
          end
        else
          if ch.to_i.equal? nb
            result += ch.underline
          else
            result += ch
          end
        end
      end
      result
    end

  end

end