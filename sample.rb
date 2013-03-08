require 'gdshowsdb'

Gdshowsdb.init()
Gdshowsdb.load()

puts "Sample Application"

show = Show.find_by_year_and_month_and_day(1995,7,8)

puts "#{show.year}/#{show.month}/#{show.day} @ #{show.venue}"

show.show_sets.each do |set|
	puts "Set #{set.order}"
	set.songs.each do |song|		
		song_string = "#{song.order} #{song.song_ref.name}"
		song_string << " >" if song.segued
		puts song_string
	end
end

jack_straw_shows = SongRef.find_by_name('Jack Straw').shows

jack_straw_shows.each do |show|
	puts show.title
end