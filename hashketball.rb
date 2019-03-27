require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number:2 ,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end


def num_points_scored(player_name)
  game_hash.each do |team, stats|
    stats[:players].each do |name, specs|
      if name == player_name
        return specs[:points]
      end
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |team, player|
    player[:players].each do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end


def team_colors(name_of_team)
  game_hash.each do |team, stats|
    if stats[:team_name] == name_of_team
      return stats[:colors]
    end
  end
end


def team_names
  team_names = []
  game_hash.each {|team, specs| team_names << specs[:team_name]}
  team_names
end
    

def player_numbers(name_of_team)
  team_jerseys = []
  game_hash.each do |team, specs|
    if game_hash[team][:team_name] == name_of_team
      game_hash[team][:players].each do |name, stats|
        team_jerseys << stats[:number]
      end
    end
  end
  team_jerseys
end


def player_stats(player_name)
  player_stats = []
  game_hash.collect do |team, specs|
    if game_hash[team][:players][player_name]
      player_stats = game_hash[team][:players][player_name]
    end
  end
  player_stats
end


def big_shoe_rebounds
  players_and_shoe_sizes = {}
  player_with_largest_shoe = ""
  game_hash.each do |team, specs|
    specs.each do |key, value|
      if key == :players
        value.each do |player, stats|
          players_and_shoe_sizes[player] = stats[:shoe]
          binding.pry
        end
      end
    end
  end
  player_with_largest_shoe = (players_and_shoe_sizes.sort_by {|player, shoe| shoe})[-1][0]
  no_rebounds = 0
  game_hash.each do |team, specs|
    if game_hash[team][:players][player_with_largest_shoe]
      no_rebounds = game_hash[team][:players][player_with_largest_shoe][:rebounds]
    end
  end
  no_rebounds
end


def most_points_scored
  players_and_points = {}
  player_with_most_points = ""
  game_hash.each do |team, specs|
    specs.each do |key, value|
      if key == :players
        value.each do |player, stats|
          players_and_points[player] = stats[:points]
        end
      end
    end
  end
  player_with_most_points = (players_and_points.sort_by {|player, points| points})[-1][0]
  player_with_most_point
end


def winning_team
  home_team_points = 0
  away_team_points = 0
  game_hash[:home][:players].each do |player, stats|
    home_team_points = home_team_points + stats[:points]
  end
  game_hash[:away][:players].each do |player, stats|
    away_team_points = away_team_points + stats[:points]
  end
  if home_team_points > away_team_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  players = []
  player_with_longest_name = ""
  game_hash.each {|team, specs| players << specs[:players].keys}
  player_with_longest_name = players.flatten.max_by(:length)
  player_with_longest_name
end


def long_name_steals_a_ton?
player = player_with_longest_name
player_with_most_steals = ""
players_and_steals = {}
game_hash.each do |team, specs|
  specs.each do |key, value|
    if key == :players
      value.each do |player, stats|
        players_and_steals[player] = stats[:steals]
      end
    end
  end
end


player_with_most_steals = (players_and_steals.sort_by {|player, steals| steals})[-1][0]
if player == player_with_most_steals
  true
else
  false
end
end