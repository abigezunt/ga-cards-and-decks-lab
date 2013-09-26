class Deck
  attr_accessor :cards

		def initialize
			@cards = []
		end

		def first_card
			@cards[0].name
    end

		def add_card(card)
			@cards.push(card)
		end
    
    def draw_card
    	@cards[rand(@cards.length)].name
    end

    def chaos_orb
    	dead_card_id = rand(@cards.length)
    	puts "You destroyed the #{@cards[dead_card_id].name}"
    	@cards.delete_at(dead_card_id)
    	# draws a card, removes it from the Deck
    end

    def shuffle
    	puts "Shuffling!! Pfffffftttt!!!"
    	@cards.shuffle!
    end

    def length
    	@cards.length
    end

    def tell_length	
    	puts "You now have #{@cards.length} cards in your deck."
    end

end

class Card
	attr_reader :suit, :value, :color, :name

	def initialize
		randomize_suit
		randomize_value
		@name = name
    puts @name
	end

	def name
		"#{@value} of #{@suit}"
	end

	def randomize_suit
	  suits = ["clubs", "spades", "hearts", "diamonds"]
	  @suit = suits[rand(3)]
	end

	def randomize_value
		@num = rand(12)+1
		if @num == 13
			@value = "King"
		elsif @num == 12
			@value = "Queen"
		elsif @num == 11
			@value = "Jack"
		elsif @num == 1
			@value = "Ace"
		else @value = @num
		end
	end

  def value
  	@num
  end

	def color
		if suit == "clubs" || suit == "spades"
		@color = "black"
		elsif suit == "hearts" || suit == "diamonds"
	  @color = "red"
	  else 
	  	"error: suit not recognized"
	  end
	end

end

my_deck = Deck.new


52.times do |x|
	my_deck.add_card(Card.new)
	my_deck.tell_length
end


x = my_deck.first_card
puts "The first card in the deck is the #{x}."
my_deck.shuffle
x = my_deck.first_card
puts "The first card in the deck is the #{x}."

puts "You drew the #{my_deck.draw_card}."

my_deck.tell_length
my_deck.chaos_orb
my_deck.tell_length





