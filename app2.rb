require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josianne")
player2 = Player.new("José")
array_players = []
array_players << player1 << player2

def launch_game(bots)
    # --- INTRO
    puts " --------------------"
    puts "| Commençons à jouer |"
    puts " --------------------"
    
    # CHOIX DU NOM + CREATION HUMAN_PLAYER
    print "Choisis ton nom --> "
    name = gets.chomp
    user = HumanPlayer.new(name)
    puts ""
    puts "Bienvenue #{user.name} !"

    # RAPPELLE DES PARTICIPANTS
    puts "#{bots[0].name} et #{bots[1].name} sont de la partie !!!"
    puts ""

    # INITIALISATION DU COMBAT
    while user.life_points > 0 && (bots[0].life_points > 0 || bots[1].life_points > 0)
        puts ""
        puts "----------------"
        #bots[0].show_state
        #bots[1].show_state
        user.show_state
        puts "----------------"
        puts ""
        #bots[0].attacks(user)
        puts "Quelle action veux tu effectuer ?"
        puts "a - 💣💣💣 chercher une meilleure arme"
        puts "s - 🏥🏥🏥 chercher à se soigner"
        print "0 - 🔫 tuer "
        bots[0].show_state
        print "1 - 🔫 tuer "
        bots[1].show_state
        res = gets.chomp
        case res 
        when "a"
            user.search_weapon
        when "s"
            user.search_health_pack
        when "0"
            if bots[0].life_points < 0
                puts "🔴🔴🔴 On ne frappe un soldat à terre !! 🔴🔴🔴 "
            else
                user.attacks(bots[0])
            end
        when "1"
            if bots[1].life_points < 0
                puts "🔴🔴🔴 On ne frappe un soldat à terre !! 🔴🔴🔴 "
            else
                user.attacks(bots[1])
            end
        end
        if bots[0].life_points <= 0 && bots[1].life_points <= 0
            break
        end
        puts ""
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        puts "🔫🔫🔫 Les joueurs attaquent !!🔫🔫🔫"
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        bots.each do |bot|
            if bot.life_points < 0

            else  
                bot.attacks(user)
            end
        end
    end
    puts "Bravo tu as gagné"
end

launch_game(array_players)