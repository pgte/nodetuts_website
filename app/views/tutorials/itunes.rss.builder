xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:itunes' => "http://www.itunes.com/dtds/podcast-1.0.dtd", 'xmlns:dc' => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title "Node Tuts"
    xml.language "en"
    xml.tag! 'itunes:author', "Pedro Teixeira"
    xml.tag! 'itunes:summary', "Node.js Free screencast tutorials"
    xml.tag! 'itunes:keywords', "Node.js, screencast, tutorials, javascript, programming"
    xml.link 'http://nodetuts.com'
    xml.tag! 'itunes:owner' do |xml|
      xml.tag! 'itunes:name', 'Pedro Teixeira'
      xml.tag! 'itunes:email', 'pedro.teixeira@gmail.com'
    end
    xml.tag! 'itunes:image', :href => "http://nodetuts.com/images/nodetuts_logo.png"
    xml.tag! 'itunes:category', :text => "Technology"

    for tutorial in @tutorials
      xml.item do
        xml.title "Episode #{tutorial.number}"
        xml.tag! 'itunes:subtitle', tutorial.title
        xml.tag! 'itunes:author', tutorial.author.name
        xml.tag! 'itunes:summary', tutorial.body
        xml.description tutorial.body
        xml.pubDate tutorial.created_at.to_s(:rfc822)
        xml.link tutorial_url("#{tutorial.id}-#{tutorial.slug}", :host => 'nodetuts.com')
        xml.tag! 'enclosure', :url => tutorial.video_url, :type => "#{video_type_from_filename(tutorial.video_url)}", :length => tutorial.duration
        xml.tag! 'guid', tutorial_url("#{tutorial.id}-#{tutorial.slug}", :host => 'nodetuts.com')
        xml.tag! 'itunes:keywords', "Node.js, screencast, tutorials, javascript, programming"
      end
    end
  end
end