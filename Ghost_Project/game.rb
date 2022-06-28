require_relative "dictionary"

class Game
    def initialize
        @players = players
        @fragment = fragment

    end
end

dict = DICTSTR.split("\n")

p dict.length
p dict[134]