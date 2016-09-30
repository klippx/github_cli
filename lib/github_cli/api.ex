defmodule GithubCli.API do
  def post(url, payload) do
    HTTPoison.post!(url, Poison.encode!(payload), headers)
    |> handle_json
  end

  def headers do
    [ "Content-Type": "application/json", "Authorization": "token #{Application.get_env(:github_cli, :api_key)}" ]
  end

  def handle_json(%{status_code: 201, body: body}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_json(%{status_code: status_code, body: body}) do
    IO.puts "error, #{status_code}"
    IO.puts body
    {:error, get_in(Poison.Parser.parse!(body), ["message"])}
  end
end
