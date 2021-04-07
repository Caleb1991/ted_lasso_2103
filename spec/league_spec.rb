require './lib/league'
require './lib/team'
require './lib/player'

RSpec.describe League do
  it 'exists' do
    premier = League.new('Premier League')

    expect(premier).to be_an_instance_of(League)
  end

  it 'has a name' do
    premier = League.new('Premier League')

    expect(premier.name).to eq('Premier League')
  end

  it 'has an empty array of teams' do
    premier = League.new('Premier League')

    expect(premier.teams).to eq([])
  end

  it 'can add teams' do
    premier = League.new('Premier League')
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])
    jamie = Player.new({name: 'Jamie Tartt', position: 'Striker', salary: 1_500_000})
    fernandinho = Player.new({name: 'Fernandinho', position: 'Midfielder', salary: 5_200_000})
    manchester = Team.new('Manchester City FC', 'Pep Guardiola', [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.teams).to eq([richmond, manchester])
  end

  it 'can return the captains' do
    premier = League.new('Premier League')
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])
    jamie = Player.new({name: 'Jamie Tartt', position: 'Striker', salary: 1_500_000})
    fernandinho = Player.new({name: 'Fernandinho', position: 'Midfielder', salary: 5_200_000})
    manchester = Team.new('Manchester City FC', 'Pep Guardiola', [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.captains).to eq([roy, fernandinho])
  end

  it 'can return the players by team' do
    premier = League.new('Premier League')
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])
    jamie = Player.new({name: 'Jamie Tartt', position: 'Striker', salary: 1_500_000})
    fernandinho = Player.new({name: 'Fernandinho', position: 'Midfielder', salary: 5_200_000})
    manchester = Team.new('Manchester City FC', 'Pep Guardiola', [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expected = {
      richmond => ['Roy Kent', 'Sam Obisanya'],
      manchester => ['Jamie Tartt', 'Fernandinho']
    }

    expect(premier.players_by_team).to eq(expected)
  end

  it 'can return the most expensive player' do
    premier = League.new('Premier League')
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])
    jamie = Player.new({name: 'Jamie Tartt', position: 'Striker', salary: 1_500_000})
    fernandinho = Player.new({name: 'Fernandinho', position: 'Midfielder', salary: 5_200_000})
    manchester = Team.new('Manchester City FC', 'Pep Guardiola', [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq(['Fernandinho'])
  end

  it 'can return multiple expensive players if there is a tie' do
    premier = League.new('Premier League')
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 5_200_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])
    jamie = Player.new({name: 'Jamie Tartt', position: 'Striker', salary: 1_500_000})
    fernandinho = Player.new({name: 'Fernandinho', position: 'Midfielder', salary: 5_200_000})
    manchester = Team.new('Manchester City FC', 'Pep Guardiola', [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq([ 'Roy Kent', 'Fernandinho'])
  end
end
