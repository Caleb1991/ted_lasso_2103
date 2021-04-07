require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond).to be_an_instance_of(Team)
  end

  it 'has a name' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.name).to eq('AFC Richmond')
  end

  it 'has a coach' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.coach).to eq('Ted Lasso')
  end

  it 'has players' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])


    expect(richmond.players).to eq([roy, sam])
  end

  it 'has a total salary' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.total_salary).to eq(1600000)
  end

  it 'has a captain' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.captain).to eq('Roy Kent')
  end

  it 'returns the whole player class for captain' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.multiple_teams_captain_helper).to eq(roy)
  end


  it 'lists positions filled' do
    sam = Player.new({name: 'Sam Obisanya', position: 'Right-back Defender', salary: 600_000})
    roy = Player.new({name: 'Roy Kent', position: 'Center Midfielder' , salary: 1_000_000})
    richmond = Team.new('AFC Richmond', 'Ted Lasso', [roy, sam])

    expect(richmond.positions_filled).to eq(['Center Midfielder', 'Right-back Defender'])
  end
end
