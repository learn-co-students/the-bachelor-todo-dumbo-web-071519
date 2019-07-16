require 'pry'
require 'json'

data = JSON.parse(File.read('spec/fixtures/contestants.json'))


def array_of_seasons(data)
  #return array of seasons
  data.keys
end

def array_of_season_contestants(data,seasons)
  #return array of contestants for that season
  data[season]
end

def array_of_contestants_by_season(data,season)
  #return array of contestant hashs
  data[season]
  # data[season].each do |season, contestants|
  #   contestants.each do |contestant|
  #     contestantArray << contestant
  #   end
  # end
  # return contestantArray
end

def array_of_contestants(data)
  #return array of contestant hashs
  contestantArray = []
  data.each do |season, contestants|
    contestants.each do |contestant|
      contestantArray << contestant
    end
  end
  return contestantArray
end

def get_first_name_of_season_winner(data, season)
  # code here
  winner = data[season].select{|contestant| contestant["status"] == "Winner"}
  name = winner[0]["name"].split(' ')
  return name[0]
end

def get_contestant_by_occupation(data, occupation)
  array_of_contestants(data).select do |contestant| 
    contestant["occupation"] == occupation 
  end
end
def get_contestant_name(data, occupation)
  get_contestant_by_occupation(data,occupation).each do |contestant|
    name = contestant["name"]
    return name
  end
end

get_contestant_name(data, "Journalist")

def count_contestants_by_hometown(data, hometown)
  num = 0
  num = array_of_contestants(data).count{|contestant| contestant["hometown"]==hometown}
 # return num
end

def get_occupation(data, hometown)
  # code here
  persons = array_of_contestants(data).select{|contestant| contestant["hometown"]==hometown}
  persons.each do |person|
    return person["occupation"]
  end

end

def get_average_age_for_season(data, season)
  # code here
  sum = 0.0
  num = data[season].length.to_f
  data[season].each do |contestant|
    #contestants.each do |contestant|
    sum += contestant["age"].to_f
  end
  avg = (sum/num.to_f).round
  return avg
end