class League
  attr_reader :name,
              :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    captains = @teams.map do |team|
      team.multiple_teams_captain_helper
    end
    captains
  end

  def players_by_team
    hash = {}

    @teams.each do |team|
      hash[team]
    end
  end

  def most_expensive_player
    most_expensive_players = []
    expensive = captains.max_by do |player|
      player.salary
    end

    most_expensive_players << expensive.name

    captains.find_all do |player|
      if player.salary == expensive.salary && player.name != expensive.name
      most_expensive_players << player.name
      end
    end
    most_expensive_players
  end
end
