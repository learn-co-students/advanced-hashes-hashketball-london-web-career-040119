require 'pry'

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
        },
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
          number: 2,
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
        },
      }
    },
  }
end

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def get_team_data_by_name(team_name)
  game_hash.values.find { |team| team[:team_name] == team_name }
end

def num_points_scored(name)
  all_players.has_key?(name) ? all_players[name][:points] : nil
end

def shoe_size(name)
  all_players.has_key?(name) ? all_players[name][:shoe] : nil
end

def team_colors(team_name)
  get_team_data_by_name(team_name)[:colors]
end

def team_names
  game_hash.collect do |team, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  get_team_data_by_name(team_name)[:players].collect do |player, player_data|
    player_data[:number]
  end
end

def player_stats(name)
  all_players[name]
end

def big_shoe_rebounds
  player = all_players.max { |a,b| a[1][:shoe] <=> b[1][:shoe] }
  player[1][:rebounds]
end

def most_points_scored
  all_players.max_by { |player, stats| stats[:points] }[0]
end

def team_score(team_name)
  get_team_data_by_name(team_name)[:players].sum { |x| x[1][:points] }
end

def winning_team
  team_names.max_by { |team_name| team_score(team_name) }
end

def player_with_longest_name
  all_players.max_by { |player, player_data| player.length }[0]
end

def long_name_steals_a_ton?
  all_players.max_by { |player, player_data| player_data[:steals] }[0] == player_with_longest_name
end
