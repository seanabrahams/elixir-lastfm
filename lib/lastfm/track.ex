defmodule Lastfm.Track do
  use Lastfm.Base

  def get_similar(options \\ []) do
    mbid = Keyword.get(options, :mbid, nil)
    artist = Keyword.get(options, :artist, nil)
    track = Keyword.get(options, :track, nil)
    autocorrect = Keyword.get(options, :autocorrect, 1)
    limit = Keyword.get(options, :limit, 30)
    if mbid do
      get!("?method=track.getsimilar&mbid=#{mbid}&autocorrect=#{autocorrect}limit=#{limit}").body
    else
      get!("?method=track.getsimilar&artist=#{artist}&track=#{track}&autocorrect=#{autocorrect}limit=#{limit}").body
    end
  end

  def search(query, options \\ [page: 1, limit: 30]) do
    get!("?method=track.search&track=#{query}&artist=#{options[:artist]}&page=#{options[:page]}&limit=#{options[:limit]}").body
  end
end
