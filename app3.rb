require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

def launch_game
    # --- INTRO
    puts " --------------------"
    puts "| Commençons à jouer |"
    puts " --------------------"
    
    # CHOIX DU NOM + CREATION HUMAN_PLAYER
    print "Choisis ton nom --> "
    name = gets.chomp
    game1 = Game.new(name)

    # INITIALISATION DU COMBAT
    while game1.human_player.life_points > 0  && (game1.enemies[0].life_points > 0 || game1.enemies[1].life_points > 0 || game1.enemies[2].life_points > 0 || game1.enemies[3].life_points > 0)
        game1.kill_player(game1.enemies)
        game1.show_players
        game1.menu
        game1.menu_choice
        game1.enemies_attack
    end
    game1.end
end

launch_game

# game1 = Game.new("fff")

# puts game1.kill_player(game1.enemies)
# puts game1.enemies.length