xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Node Tuts"
    xml.author "Pedro Teixeira"
    xml.description "Node.js Free screencast tutorials"
    xml.keywords "Node.js, screencast, tutorials, javascript, programming"
    xml.link tutorials_url(:host => 'nodetuts.com')

    for tutorial in @tutorials
      xml.item do
        xml.title tutorial.title
        xml.description tutorial.body
        xml.pubDate tutorial.created_at.to_s(:rfc822)
        xml.link tutorial_url("#{tutorial.id}-#{tutorial.slug}", :host => 'nodetuts.com', :format => 'html')
        xml.tag! 'guid', tutorial_url("#{tutorial.id}-#{tutorial.slug}", :host => 'nodetuts.com', :format => 'html')
      end
    end
  end
end