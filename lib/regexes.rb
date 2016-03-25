#file: regexes.rb
class Regexes
	@@list = []

	def initialize
		puts "regexes"
		File.readlines("lists/banned_regexes.txt").each {|line| @@list << Regexp.new(line.chomp)}
	end

	def list
		@@list
	end

	def refresh_list
		@@list = []
		File.readlines("lists/banned_regexes.txt").each {|line| @@list << Regexp.new(line.chomp)}
	end
end