require 'pry' 

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_info|
    contestant_info.each do |attribute, value|
      if value == "Winner"
        return contestant_info["name"].split[0]
      end 
    end 
  end 
end

def get_contestant_name(data, occupation)
  data.each do |season, season_info|
    season_info.each do |contestant_info|
      contestant_info.each do |attribute, value|
        if value == occupation
          return contestant_info["name"]
        end 
      end 
    end 
  end   
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.each do |season, season_info|
    season_info.each do |contestant_info|
      contestant_info.each do |attribute, value|
        if value == hometown
          i += 1
        end 
      end 
    end 
  end 
  return i
end

def get_occupation(data, hometown)
  data.each do |season, season_info|
    season_info.each do |contestant_info|
      contestant_info.each do |attribute, value|
        if value == hometown 
          return contestant_info["occupation"]
        end 
      end
    end 
  end 
end

def get_average_age_for_season(data, season)
  ages = []
  data[season].each do |contestant_info|
    ages.push(contestant_info["age"].to_f)
  end 
  sum = 0
  ages.each { |a| sum+=a }
  average = (sum / ages.size).round
end
