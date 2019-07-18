require "open-uri"
require "yaml"

file = "https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/topflix/data/movies.yml"
sample = YAML.load(open(file).read)

puts 'Creating directors...'
directors = {}  # slug => Director
sample["directors"].each do |director|
  directors[director["slug"]] = Director.create! director.slice("first_name", "last_name")
end

puts 'Creating movies...'
sample["movies"].each do |movie|
  Movie.create! movie.slice(
    "title",
    "year",
    "synopsis",
    "theme_color",
    "rating",
    "genre",
    "cover",
    "video_src"
  ).merge(director: directors[movie["director_slug"]])
end

puts 'Creating series...'
sample["series"].each do |serie|
  Serie.create! serie
end

puts 'Finished!'
