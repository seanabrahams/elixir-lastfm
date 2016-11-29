defmodule Lastfm.Base do
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        api_key = Application.fetch_env!(:lastfm, :api_key)
        "http://ws.audioscrobbler.com/2.0/" <> url <> "&api_key=#{api_key}&format=json"
      end
    end
  end
end
