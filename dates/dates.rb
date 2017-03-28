# Prints the Monday and Friday of each week for NUM_WEEKS weeks.
# First Monday to be printed is a hardcoded value.
# Sample output for each week: "1: Sep 14 - Sep 18"

require 'date'

# TODO: parse parameters via command line
START_YEAR = 2015
START_MONTH = 9
START_DAY = 7
NUM_WEEKS = 14

current_week = 0
current_date = DateTime.new(START_YEAR, START_MONTH, START_DAY)
idx = 1

until idx > NUM_WEEKS do
	week_start = current_date.strftime("%b %e")
	week_end = (current_date+4).strftime("%b %e")

	puts "#{idx}: #{week_start} - #{week_end}" #eg. "1: Sep 14 - Sep 18"

	idx += 1
	current_date = current_date + 7
end
