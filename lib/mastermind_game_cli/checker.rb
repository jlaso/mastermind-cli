module MastermindGameCli

  class Checker

    def self.check(st1, st2)
      ones = 0
      zeros = 0
      p1 = 0
      st1.each_char do |i1|
        p2 = 0
        st2.each_char do |i2|
          if i2 == i1
            if p1 == p2
              ones += 1
            else
              zeros += 1
            end
          end
          p2 += 1
        end
        p1 +=1
      end
      '1' * ones + '0' * zeros
    end

    def self.get_matches(st1, st2)
      result = []
      for i in 0..st1.length - 1
        if st1[i] == st2[i]
          result << st2[i]
        end
      end
      result
    end

    def self.only_digits?(st)
      Float(st) != nil rescue false
    end

    def self.repeated?(st)
      check(st, st) != '1' * st.length
    end

  end

end