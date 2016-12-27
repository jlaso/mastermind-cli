module MastermindGameCli

  class Guess

    attr_reader :value
    attr_reader :response

    def initialize(value, response)
      @value = value
      @response = response
    end

  end

end