defmodule GithubCli.Actions.CreateRepository do
  def execute(name) do
    "https://api.github.com/user/repos"
    |> GithubCli.Client.post(%GithubCli.Models.Repository{name: name})
    |> handle_response
  end

  def handle_response({:ok, _}) do
    "Repository created!"
  end

  def handle_response({:error, message}) do
    "Error! #{message}"
  end
end
