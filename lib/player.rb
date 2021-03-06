class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @life_points = 10
        @name = name
    end

    def show_state
        if @life_points < 0 
            puts "πππ #{@name} is dead πππ"
        else  
            puts "#{@name} - #{@life_points} pv" 
        end
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0
            puts ""
            puts "πππ le joueur #{@name} est mort πππ"
        end
    end

    def attacks(player_defend)
        puts "π« Le joueur #{@name} attaque le joueur #{player_defend.name}"
        degats = compute_damage
        puts "π₯ Il lui inflige #{degats} de dommages"
        player_defend.gets_damage(degats)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @weapon_level = 1
        @life_points = 100
      #super(name) #fait appel au initialize de la classe Player
    end

    def show_state
        if @life_points < 0
            puts "πππ Tu es dead πππ"
        else
            puts "π€ #{@name} Γ  #{@life_points} points de vie et Γ  une arme de niveau #{@weapon_level}" 
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        res = rand(1..6) 
        puts "π’ Tu as trouvΓ© une arme de niveau #{res}"
        if res > @weapon_level
            puts "ππ» Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = res
        else 
            puts "π Cette arme est pareil, laisse la"
        end
    end

    def search_health_pack
        res = rand(1..6)
        case res
        when 1 
            puts "π Tu n'as rien trouvΓ©"
        when 2..5
            puts "π₯ Bravo tu as trouvΓ© un pack de +50"
            @life_points += 50
            if @life_points > 100
                return @life_points = @life_points - (@life_points - 100)
            else
               return @life_points
            end
        when 6
            puts "π₯ Waow, tu as trouvΓ© un pack de +80 points de vie !"
            @life_points += 80
            if @life_points > 100
                return @life_points = @life_points - (@life_points - 100)
            else
               return @life_points
            end
        end
    end
end