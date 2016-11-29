defmodule Lastfm.Track do
  use Lastfm.Base

  def get_similar(args \\ [autocorrect: 1, limit: 30])
  def get_similar([mbid: mbid] = args) do
    get!("?method=track.getsimilar&mbid=#{args[:mbid]}&autocorrect=#{args[:autocorrect]}limit=#{args[:limit]}").body
  end
  def get_similar([track: track, artist: artist] = args) do
    get!("?method=track.getsimilar&artist=#{args[:artist]}&track=#{args[:track]}&autocorrect=#{args[:autocorrect]}limit=#{args[:limit]}").body
  end

  def search(query, args \\ [page: 1, limit: 30]) do
    get!("?method=track.search&track=#{query}&artist=#{args[:artist]}&page=#{args[:page]}&limit=#{args[:limit]}").body
  end
end
