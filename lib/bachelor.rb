require 'pry'

def get_first_name_of_season_winner(data, season)
  # code here
  person = nil
  data[season].each do |(person_obj)|
    if person_obj["status"] == "Winner"
       person = person_obj["name"]
    end
  end
  name_array = person.split(' ') 
  return name_array[0]
end

def get_contestant_name(data, occupation)
  # code here
  person = nil
  data.each do |(season, contestant_array)|
    contestant_array.each do |(contestant_obj)|
      if contestant_obj["occupation"] == occupation
        person = contestant_obj["name"]
      end
    end
  end
  person
end

def count_contestants_by_hometown(data, hometown)
  # code here
  counter = 0
  data.each do |(season, contestant_array)|
    contestant_array.each do |(contestant_obj)|
      if contestant_obj["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  # code here
  occupation = nil
  data.each do |(season, contestant_array)|
    contestant_array.each do |(contestant_obj)|
      if contestant_obj["hometown"] == hometown
        occupation = contestant_obj["occupation"]
        return occupation
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  age_accumulator = 0
  count_accumulator = 0.0
  data[season].each do |(person_obj)|
      age = person_obj["age"].to_f
      age_accumulator += age
      count_accumulator += 1.0
  end
  return (age_accumulator/count_accumulator).round
end
