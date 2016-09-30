defmodule GithubCli.CommandParser do
  defmodule Repository do
    @derive [Poison.Encoder]
    defstruct [:name]
  end

  def parse_command("create_repo", args) do
    "https://api.github.com/user/repos"
    |> HTTPoison.post!(Poison.encode!(%Repository{name: List.first(args)}), headers)
    |> handle_json
    |> handle_response
  end

  def parse_command(command, args) do
    "You invoked me with command: #{command} and single arg: #{args}"
  end

  def headers do
    [ "Content-Type": "application/json", "Authorization": "token #{Application.get_env(:github_cli, :api_key)}" ]
  end

  def handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_json({_, %{status_code: _, body: _}}) do
    {:error, "Something went wrong. Please check your internet connection!"}
  end

  def handle_json(%{status_code: _, body: body}) do
    {:error, Poison.Parser.parse!(body)}
  end

  def handle_response({:ok, _}) do
    body
  end

  def handle_response({:error, message}) do
    get_in(message, ["message"])
    |> IO.puts
  end

end
