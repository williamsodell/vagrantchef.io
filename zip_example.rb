require 'rubygems'
 require 'zip'
 require "open-uri"
 
def export
  t = Tempfile.new("my-temp-filename-#{Time.now}")
  Zip::OutputStream.open(t.path) do |z|
    @list.items.each do |item|
      title = item.image_file_name
      z.put_next_entry("images/#{title}")
      url1 = item.image.url
      url1_data = open(url1)
      z.print IO.read(url1_data)
  end
end
 
send_file t.path, :type => 'application/zip',
                                 :disposition => 'attachment',
                                 :filename => "List.zip"
                                 
          t.close
end