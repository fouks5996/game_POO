class Game 
    attr_accessor :human_player, :enemies

    @@res = []

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        joueur_1 = Player.new("Josianne")
        joueur_2 = Player.new("josé")
        joueur_3 = Player.new("Erika")
        joueur_4 = Player.new("Nathanaël")
        @enemies = [joueur_1, joueur_2, joueur_3, joueur_4]
    end
    
    def kill_player(arr_enemies)
        @@res = arr_enemies.reject{|joueur| joueur.life_points < 0}
        return @@res
    end

    def is_still_ongoing?
        if @@res.length > 0 || @human_player.life_points > 0
            return true
        else
            return false
        end
    end

    def show_players
        puts ""
        puts "----------------"
        @human_player.show_state
        puts "🔫 Il reste #{@@res.length} ennemies"
    end

    def menu
        puts "----------------"
        puts ""
        puts "Quelle action veux tu effectuer ?"
        puts "a - 💣💣💣 chercher une meilleure arme"
        puts "s - 🏥🏥🏥 chercher à se soigner"
        for n in 0..3
            print "#{n} - 🔫 tuer "
                enemies[n].show_state
        end
    end

    def menu_choice
        res = gets.chomp
        for n in 0..3
            case res 
            when "a"
                @human_player.search_weapon
                break
            when "s"
                @human_player.search_health_pack
                break
            when "#{n}"
                if enemies[n].life_points < 0
                    puts "🔴🔴🔴 On ne frappe un soldat à terre !! 🔴🔴🔴 "
                else
                    @human_player.attacks(enemies[n])
                end
            end
        end
        #kill_player(self.enemies)
    end

    def enemies_attack
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        puts "🔫🔫🔫 Les joueurs attaquent !!🔫🔫🔫"
        puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
        enemies.each do |enemmie|
            if enemmie.life_points > 0
                enemmie.attacks(@human_player)
            end
        end
    end

    def end
        if is_still_ongoing? == true
            puts ""
            puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
            puts "😎😎😎 La partie est finie, tu as gagné !!! 😎😎😎"
            puts "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
            puts ""
        else
            puts "bug"
        end
    end
end