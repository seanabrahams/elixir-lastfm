defmodule Lastfm.Artist do
  use HTTPoison.Base
  # {
  #   "results": {
  #     "opensearch:Query": {
  #       "#text": "",
  #       "role": "request",
  #       "searchTerms": "cher",
  #       "startPage": "1"
  #     },
  #     "opensearch:totalResults": "54642",
  #     "opensearch:startIndex": "0",
  #     "opensearch:itemsPerPage": "30",
  #     "artistmatches": {
  #       "artist": [
  #         {
  #           "name": "Cher",
  #           "listeners": "981321",
  #           "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
  #           "url": "http://www.last.fm/music/Cher",
  #           "streamable": "0",
  #           "image": [
  #             {
  #               "#text": "http://img2-ak.lst.fm/i/u/34s/3e83572a4f1f4f9770b93dfc2e6f7c9b.png",
  #               "size": "small"
  #             },
  #             {
  #               "#text": "http://img2-ak.lst.fm/i/u/64s/3e83572a4f1f4f9770b93dfc2e6f7c9b.png",
  #               "size": "medium"
  #             },
  #             {
  #               "#text": "http://img2-ak.lst.fm/i/u/174s/3e83572a4f1f4f9770b93dfc2e6f7c9b.png",
  #               "size": "large"
  #             },
  #             {
  #               "#text": "http://img2-ak.lst.fm/i/u/300x300/3e83572a4f1f4f9770b93dfc2e6f7c9b.png",
  #               "size": "extralarge"
  #             },
  #             {
  #               "#text": "http://img2-ak.lst.fm/i/u/3e83572a4f1f4f9770b93dfc2e6f7c9b.png",
  #               "size": "mega"
  #             }
  #           ]
  #         }
  #       ]
  #     }
  #   }
  # }
  def search(query, args \\ [page: 1, limit: 30]) do
    get!("?method=artist.search&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}").body
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
