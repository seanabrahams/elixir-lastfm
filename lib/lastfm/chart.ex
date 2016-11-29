defmodule Lastfm.Chart do
  use Lastfm.Base

  def get_top_artists(args \\ [page: 1, limit: 30]) do
    get!("?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}").body
  end

  def get_top_tracks(args \\ [page: 1, limit: 30]) do
    get!("?method=chart.gettoptracks&page=#{args[:page]}&limit=#{args[:limit]}").body
  end
end
