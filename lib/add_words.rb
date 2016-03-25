msg = ""
character_subs = {'a' => '4@', 'e' => '3', 'i' => '1', 'l' => '1\|', 'o' => '0', 'q' => '2', 's' => '5', 't' => '7+', 'z' => '2'}
@character_map = Hash.new

('a'..'z').each do |c|
	puts "in the range!"
	puts c
	result = "[#{c}#{c.upcase}#{character_subs[c] or ''}]"
	@character_map[c] = result
	@character_map[c.upcase] = result
end

def regexify(str)
	puts "in regexify"
	puts str
	str.chars.map {|char| "#{@character_map.keys.include? char ? @character_map[char] : char}[-\s_]*" }.join
end

while msg != "exit"
	puts "hi"
	msg = gets.chomp
	puts "hello"
	File.open("banned-regexes.txt", 'a') {|file| file.puts regexify msg} unless msg == 'exit' or msg.nil?
	puts "see ya"
end
