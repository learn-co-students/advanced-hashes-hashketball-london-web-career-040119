

def game_hash
  {
    home: {
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
    away: {
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


#Points scored
#Build a method, `num_points_scored` that takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(name) 
  hash = game_hash
  game_hash.each do |teams_playing, data| 
    data[:players].each do |player_name, player_data|
      if  player_name == name
        return hash[teams_playing][:players][name][:points]
      end 
    end 
  end 
end

      

num_points_scored("Brendon Haywood")
#outputs the whole hash
      

#Shoe Size
#Build a method, `shoe_size`, that takes in an argument of a player's name and returns the shoe size for that player.
def shoe_size(name) #takes name as argument and returns the shoe size
  game_hash.each do |teams_playing, data|
    data[:players].each do |player_name, player_data|
      if player_name == name
        return game_hash[teams_playing][:players][name][:shoe_size]
      end 
    end 
  end 
end

shoe_size("Brendon Haywood")
#outputs the whole hash




#Team Colors
# Build a method, `team_colors`, that takes in an argument of the team name and returns an array of that teams colors.

def team_colors(team) #takes in an argument of the team name and returns an array of that teams colors.
	game_hash.each do |teams_playing, data|
		data.each do |attribute, value| 
			if attribute == :colors
				return game_hash[teams_playing][:colors]
			end 
		end 
	end 
end 

team_colors("Brooklyn Nets") #correct output

#Team Names
#Build a method, `team_names`, that operates on the game hash to return an array of the team names.

def team_names #operates on the hash to to return an array of team names
	array = []
	game_hash.each do |team_playing, data|
		data.each do |key, value|
			if key == :team_name 
				array.push(value)
			end 
		end 
	end
	return array
end

team_names #correct output

#Player Numbers
#Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.
def player_numbers(teamname) #takes argument of the team name and returns an array of jersey numbers

  array = []
	game_hash.each do |team_playing, data|
		data[:team_name].each do |key, value|
      if value == teamname
        array.push(game_hash[team_playing][:players][:number])
      end 
    end
  end
  return array 
end

player_numbers("Charlotte Hornets")
##undefined method `each' for "Brooklyn Nets":String
#(repl):123:in `block in player_numbers'
#(repl):122:in `each'
#(repl):122:in `player_numbers'
#(repl):131:in `<main>'



#Player stats
#Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(name) #takes argument of player name and returns hash of players stats
  hash = game_hash
  hash.each do |teams_playing, data|
    data[:players].each do |player_name, player_data|
      if player_name == name
        return hash[teams_playing][:players][name]
      end 
    end 
  end 
end
#returns the whole hash as the output
player_stats("Brendon Haywood")



#big shoe rebounds
#Build a method, `big_shoe_rebounds`, that will return the number of rebounds associated with the player that has the largest shoe size
##return the player with the biggest shoe size with the players rebounds from the hash

def big_shoe_rebounds(game_teams)
  biggest_shoes = game_teams.values.flat_map{ |team| team.fetch(:players).values }.max_by { |player| player.fetch(:shoe) }


  game_teams.each do |teams, data|
    data[:players].each do |player, player_data|
      if player_data == biggest_shoes

        puts biggest_shoes[:rebounds]
        puts player
      end 
    end
  end
end

big_shoe_rebounds(game_hash) #correct output


#Most points scored

	
def most_points_scored(game_teams)
   most_points = game_teams.values.flat_map{ |team| team.fetch(:players).values }.max_by { |player| player.fetch(:points) }

   puts most_points

  game_teams.each do |teams, data|
    data[:players].each do |player, player_data|
      if player_data == most_points
        return player 
      end 
    end
  end
  
  
end 


most_points_scored(game_hash) #correct output

#winning teams method

def winning_teams(data)
  score_1 = data[:home][:players].sum { |_, h| h[:points] }
  #=> 96
  score_2 = data[:away][:players].sum { |k, v| v[:points] }
  #=> 85
  if score_1 > score_2 
    puts "Brooklyn Nets won the game, their score was #{score_1} points"
  else 
    puts "Charlotte Hornets won the game, their score was #{score_2} points"
  end
end

winning_teams(game_hash) #correct output

#player with the longest name
#iterates through the data to return the player with the longest name
def player_with_longest_name(data)
  data.each do |team_playing, info|
    info[:players].each do |key, value|
      key.max_by{|x| x.length}
    end 
  end
end

player_with_longest_name(game_hash)

##ERROR
##undefined method `max_by' for "Alan Anderson":String
#(repl):124:in `block (2 levels) in player_with_longest_name'
#(repl):123:in `each'
#(repl):123:in `block in player_with_longest_name'
#(repl):122:in `each'
#(repl):122:in `player_with_longest_name'
#(repl):129:in `<main>'