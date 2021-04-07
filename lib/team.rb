class Team
  attr_reader :name,
              :coach,
              :players

  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = players
    @captain = nil
  end

  def total_salary
    total = @players.map do |player|
      player.salary
    end
    total.sum
  end

  def captain
    max_salary = @players.max_by do |player|
      player.salary
    end
    max_salary.name
  end

  def multiple_teams_captain_helper
    max_salary = @players.max_by do |player|
      player.salary
    end
    max_salary
  end

  def positions_filled
    @players.map do |player|
      player.position
    end
  end
end
