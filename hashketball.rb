require "pry"

def game_hash
	{
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1, 
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
				}
			}
		}, 
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
					:number => 4, 
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0 
				},
				"Brendan Haywood" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12 
				}
		    }
		}
	}
end

def num_points_scored(names)

point_information = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
      	  if player == names
      	    data_item.each do |key, value|
      		  if key == :points 
      		   point_information = value
      		  end
      		end
      	  end
        end
      end
    end
  end 

point_information

end  		

def shoe_size(names)

shoe_size_information = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
      	  if player == names
      	    data_item.each do |key, value|
      		  if key == :shoe
      		    shoe_size_information = value
      		  end
      		end
      	  end
        end
      end
    end
  end 

shoe_size_information

end  		

def team_colors(the_team_name)
	if the_team_name == "Brooklyn Nets"
		game_hash[:home][:colors]
	elsif the_team_name == "Charlotte Hornets" 
		game_hash[:away][:colors]
	end
end

def team_names
	teams = []
	teams << game_hash[:home][:team_name]
	teams << game_hash[:away][:team_name]
	teams
end

def player_numbers(name)
jersey_numbers = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      team_data[:players].each do |player, information|
        information.each do |key, value|
          if key == :number
            jersey_numbers << value
      	  end
      	end
       end
     end
   end

jersey_numbers

end

def player_stats(names)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
      	  if player == names
      	    return data_item
      	  end
      	end
      end
    end
  end
end

def big_shoe_rebounds

biggest_shoe = 0
rebounds = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
      	    data_item.each do |key, value|
      		  if key == :shoe 
      		   shoe_size = value
      		   if biggest_shoe == 0 || value > biggest_shoe
      		   	biggest_shoe = value
      		   	rebounds = data_item[:rebounds]
      		   end
      		  end
      		end
      	  end
        end
      end
    end
rebounds 
end
