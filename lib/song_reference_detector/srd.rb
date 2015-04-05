class SongReferenceDetector
  
  
  def initialize
    @song_search_uri = "http://developer.echonest.com/api/v4/song/search?"
    @api_key         = "Z4NSWMKQZ8RDARXNX&"
    @title           = ""
    @song_search     = "#{@song_search_uri}api_key=#{@api_key}format=json&title=#{@title}&bucket=id:lyricfind-US&limit=true&bucket=tracks"
    
    @lyric_search = "http://api.lyricfind.com/lyric.do?apikey=#{@api_key}&trackid="
  end
  
  
  
  
end