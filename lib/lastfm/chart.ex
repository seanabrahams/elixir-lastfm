defmodule Lastfm.Chart do
  use HTTPoison.Base

  def get_top_artists(args \\ [page: 1, limit: 30]) do
    get!("?method=chart.gettopartists&page=#{args[:page]}&limit=#{args[:limit]}").body
  end

  ##
  # Override HTTPoison.Base
  def process_url(url) do
    api_key = Application.fetch_env!(:lastfm, :api_key)
    "http://ws.audioscrobbler.com/2.0/" <> url <> "&api_key=#{api_key}&format=json"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end
