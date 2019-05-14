require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  film_array_of_hashes = []
  response_hash["results"].each do |characters|
    characters["name"]
    if characters["name"] == character_name
      film_array = characters["films"]
      
      film_array.each do |film|
        film.to_s
        film_info = RestClient.get(film)
        film_array_of_hashes << JSON.parse(film_info)
      end
    end
  end
  film_array_of_hashes
end

# get_character_movies_from_api("R5-D4")



def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  i = 0
 while i < films.count
  puts films[i]["title"] 
  i += 1
 end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)

  print_movies(films)
end

show_character_movies("Darth Vader")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
