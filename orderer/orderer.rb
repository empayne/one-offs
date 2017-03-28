# orderer.rb
# While running, renames all files newly copied to IN_DIR.
# These files will be named output_0.jpg, output_1.jpg, etc. in the order that they were copied in.
# Sample use case: drag/drop files into IN_DIR via explorer.

require 'listen'

# Adjust parameters as needed. If I ever update this script, I might read these as command line parameters,
# but this script currently fulfills its purpose without doing so.
FORCE_POLLING = true			# Required for Vagrant filesystem
IN_DIR = "in"				# eg. renames files in /vagrant/in
LISTEN_PATH = "#{Dir.pwd}/#{IN_DIR}"
FILE_PREFIX = "output_"			# eg. files renamed to output_0.jpg, output_1.txt, etc.
ignore_regex = /#{FILE_PREFIX}/		# Ignore files we have already renamed.
file_count = 0

if !File.directory?(LISTEN_PATH)
	Dir.mkdir(LISTEN_PATH)
end

listener = Listen.to(LISTEN_PATH, ignore: ignore_regex, force_polling: FORCE_POLLING) do |modified, added, removed|
	added.each do |file|
		new_file_name = "#{FILE_PREFIX}#{file_count}.#{file.split('.').last}" # eg. "output_1.jpg"
		File.rename(file, "#{LISTEN_PATH}/#{new_file_name}")
		file_count += 1
	end
end

puts "Starting execution of orderer.rb."
listener.start
sleep
