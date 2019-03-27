def game_hash
    game_hash = {
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



def num_points_scored(player_name)
    game_hash.each do |origin, team|
      stats = team[:players][player_name]
      if stats
          return stats[:points]
      end
    end
end

num_points_scored("Brendan Haywood")


def shoe_size(name)
  game_hash.each do | _, team |
      if team[:players][name]
        return team[:players][name][:shoe]
      end
  end
end

shoe_size("Brendan Haywood")


def team_colors(team)
  answer = []
  game_hash.each do | key, value |
      if value[:team_name] == team
        answer << value[:colors]
      end
  end
  answer.flatten
end
      
team_colors("Brooklyn Nets")


def team_names
  array = []
  game_hash.each do | team_origin, team |
      array << team[:team_name]
  end
  array
end
  
team_names
  
  
def player_numbers(team)
  array = []
  game_hash.each do | origin, data |
    data[:players].each do | name, stats |
      if data[:team_name] == team
        array << data[:players][name][:number]
      end
    end
  end
  return array
end

player_numbers("Brooklyn Nets")


def player_stats(name)
  game_hash.each do | origin, data |
    stats = data[:players][name]
    if stats
      return stats
    end
  end
end
  
  
player_stats("Alan Anderson")


def player_names(team)
  names = []
  game_hash.each do | origin, data |
    data[:players].each do | name, stats |
      if data[:team_name] == team
        names << name
      end
    end
  end
  return names
end
  
  

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  player = ""
  game_hash.each do | origin, data |
    data[:players].each do | name, stats |
      if biggest_shoe < shoe_size(name)
        biggest_shoe = shoe_size(name)
        player = name
      end
    end
  end
  return player_stats(player)[:rebounds]
end
    
big_shoe_rebounds
  
