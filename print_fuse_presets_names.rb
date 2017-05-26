require 'nokogiri'

res = Dir["*.fuse"].map do |fuse|
	doc = File.open(fuse) do |f|
		  Nokogiri::XML(f)
	end
	doc.css('Info').first['name']
end.reverse
puts res
