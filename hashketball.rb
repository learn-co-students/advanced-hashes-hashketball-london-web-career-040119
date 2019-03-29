require "pry"


def game_hash 
  
hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
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
    },
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise","Purple"],
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
    },
  },
}

end 


def num_points_scored(player_name)

game_hash.each {|team, info|
  info.each {|info_type, data|
    if info_type == :players
      data.each {|player, stats|
        if player == player_name
          stats.each {|point_type, points|
            if point_type == :points
              return points
            end
          }
        end
      }
    end
  }
}
end


def shoe_size(player_name) 
  
  game_hash.each {|team, info|
  info.each {|info_type, data|
    if info_type == :players
      data.each {|player, stats|
        if player == player_name
          stats.each {|point_type, shoe_num|
            if point_type == :shoe
              return shoe_num
            end
          }
        end
      }
    end
  }
}
end 


def team_colors(teams)
  
  game_hash.each {|team, info|
    info.each {|info_type, data|
      if data == teams
         info.each {|info_type, data|
          if info_type == :colors
            return data
          end
         }
      end 
    }
  }
end


def team_names 
  
  new_array =[]
  game_hash.each {|team, info|
    info.each {|info_type, data|
      if info_type == :team_name
        new_array.push(data)
      end
    }
  }
  new_array
end 


def player_numbers(team_name)
  
  new_array = []
  game_hash.each {|team, info|
    info.each {|info_type, data|
     if data == team_name
       info.each {|info_type, data|
        if info_type == :players
          data.each {|names, stats|
            stats.each {|stats_type, points|
              if stats_type == :number
                new_array.push(points)
              end
            }
          }
        end
       }
     end 
    }
  }
  new_array
end 


def player_stats(player_name)

game_hash.each {|team, info|
  info.each {|info_type, data|
    if info_type == :players
      data.each {|names, stats|
        if names == player_name
          return stats
        end
      }
    end
    }
  }
  
end




def big_shoe_rebounds

all_shoe_sizes =[]

game_hash.each {|team, info|
  info.each {|info_type, data|
    if info_type == :players
      data.each {|player, stats|
          stats.each {|point_type, shoe_num|
            if point_type == :shoe
              all_shoe_sizes.push(shoe_num)  
        end
      }
    }
  end
  }
}

largest_shoe = all_shoe_sizes.sort[-1]

game_hash.each {|team, info|
  info.each {|info_type, data|
    if info_type == :players
      data.each {|names, stats|
        if stats[:shoe] == largest_shoe
          return stats[:rebounds]
        end
        
        
      }
    end
  }
}

end 







# def big_shoe_rebounds
  
#   temp_array = []
#   game_hash.each {|team, info|
#     info.each {|info_type, data|
#       if info_type == :players
#         data.each {|names, stats|
#           stats.each {|stats_type, points|
#             if stats_type == :shoe
#               temp_array.push(points)
#             end
#           }
#         }
#       end
#     }
#   }
  
# largest_shoe = temp_array.sort[-1]
 
# game_hash.each {|team, info|
#     info.each {|info_type, data|
#       if info_type == :players
#         data.each {|names, stats|
#           stats.each {|stats_type, points|
#             if stats_type == :shoe && points == largest_shoe
#               stats.each {|stats_type, points|
#                   if stats_type == :rebounds
#                     points
#                   end
#                 }
#               end
          
#           }
#         }
#       end
#     }
# }

# end 







