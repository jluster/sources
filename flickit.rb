require 'rubygems'
require 'flickraw'

FlickRaw.api_key = "";
FlickRaw.shared_secret = ""

auth = flickr.auth.checkToken :auth_token => ""

id = flickr.people.findByUsername(:username => "jluster").id
page = 1
1.upto(100).each { |i| 
  puts "## Page: #{i}\n"
  flickr.photos.search(:user_id => id, :per_page => 100, :page => i).each do |p|
    info = flickr.photos.getInfo(:photo_id => p.id)
    print "wget "
    print FlickRaw.url_o(info)
    print "\n"    
  end
}
