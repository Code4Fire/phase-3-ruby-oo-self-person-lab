require 'pry'
class Person 
    attr_accessor :bank_account
#
    attr_reader :name, :happiness, :hygiene
# these values cannot change OR we created our own  method structure to edit the prompts based on value

    @@names = []
#instance scope
    def initialize(name)
        @name = name 
        @hygiene = 8
        @bank_account =25
        @happiness = 8

        @@names << self
    end

# class method
    def self.names
        @@names
    end

    def happiness= (value)
        if value > 10
            # puts "REJECTED"
            @happiness = 10
        elsif value < 0
            # puts "CRYBABY"
            @happiness = 0
        else
            @happiness =value
        end
    end 

    def hygiene= (value)
        if value > 10
            # puts "TOO CLOSE TO GODLINESS"
            @hygiene = 10
        elsif value < 0
            # puts "TOO FAR FROM GODLINESS"
            @hygiene = 0
        else
            @hygiene =value
        end
    end


    def clean?
        hygiene > 7
    end 

    def happy?
        happiness > 7
    end

    def get_paid(amount)
        self.bank_account += amount
        "all about the benjamins"
    end 

    def take_bath
        # if hygiene < = 6
            self.hygiene += 4
             "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        puts "♪ another one bites the dust ♫"
    end 

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        puts "Hi #{friend.name}! It's #{self.name}. How are you?"
    end


    def start_conversation(friend, topic)
        if topic == "politics"
            self.happiness -= 2
            friend.happiness -= 2
            "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness += 1
            friend.happiness += 1
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end

# we use self instead of "@" to avoid infinite loops. 
end  


dom = Person.new('Dom')
reese = Person.new('Reese')
dom.call_friend(reese)
binding.pry


