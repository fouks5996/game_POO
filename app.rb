require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("Josianne")
player2 = Player.new("José")
player3 = HumanPlayer.new("foucauld")

player3.search_weapon
player3.attacks(player1)

# player3.search_health_pack
# puts player3.life_points
# while player3.life_points > 0 && player2.life_points > 0
#     puts "----------------"
#     player2.show_state
#     player3.show_state
#     puts "----------------"
#     puts "passons à la phase d'attaque :"
#     player3.attacks(player2)
#     if player2.life_points <= 0 
#         break
#     end
#     player2.attacks(player3)
# end


#binding.pry
