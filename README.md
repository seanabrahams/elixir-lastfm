# Lastfm

An Elixir library for accessing the Last.fm API

## Installation

1. Add `lastfm` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:lastfm, git: "https://github.com/seanabrahams/elixir-lastfm.git"}]
  end
  ```

2. Configure your Last.fm API key

  ```elixir
    config :lastfm, api_key: "<your API key>"
  ```
