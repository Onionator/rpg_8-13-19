Item.destroy_all

25.times do
  item = Item.create!(
    :name => Faker::TvShows::RickAndMorty.character,
    :description => Faker::TvShows::RickAndMorty.quote,
    :attack => rand(1...10),
    :defense => rand(1...10),
    :hit_points => 0)
end
