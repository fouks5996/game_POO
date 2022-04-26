class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @life_points = 10
        @name = name
    end

    def show_state
        if @life_points < 0 
            puts "💀💀💀 #{@name} is dead 💀💀💀"
        else  
            puts "#{@name} - #{@life_points} pv" 
        end
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0
            puts ""
            puts "💀💀💀 le joueur #{@name} est mort 💀💀💀"
        end
    end

    def attacks(player_defend)
        puts "🔫 Le joueur #{@name} attaque le joueur #{player_defend.name}"
        degats = compute_damage
        puts "💥 Il lui inflige #{degats} de dommages"
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
            puts "💀💀💀 Tu es dead 💀💀💀"
        else
            puts "🤒 #{@name} à #{@life_points} points de vie et à une arme de niveau #{@weapon_level}" 
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        res = rand(1..6) 
        puts "📢 Tu as trouvé une arme de niveau #{res}"
        if res > @weapon_level
            puts "👏🏻 Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = res
        else 
            puts "😒 Cette arme est pareil, laisse la"
        end
    end

    def search_health_pack
        res = rand(1..6)
        case res
        when 1 
            puts "😒 Tu n'as rien trouvé"
        when 2..5
            puts "🏥 Bravo tu as trouvé un pack de +50"
            @life_points += 50
            if @life_points > 100
                return @life_points = @life_points - (@life_points - 100)
            else
               return @life_points
            end
        when 6
            puts "🏥 Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
            if @life_points > 100
                return @life_points = @life_points - (@life_points - 100)
            else
               return @life_points
            end
        end
    end
end