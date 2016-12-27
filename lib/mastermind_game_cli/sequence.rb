module MastermindGameCli
  DICTIONARY = '0123456789'

  class Sequence

    attr_reader :value

    def initialize(num_pos)
      @value = DICTIONARY.split('').shuffle.join[0, num_pos]
    end

  end
end
