defmodule GithubCli.Repo do
  defmodule Repository do
    @derive [Poison.Encoder]
    defstruct [:name]
  end

  def create(name) do
    "https://api.github.com/user/repos"
    |> GithubCli.API.post(%Repository{name: name})
    |> handle_response
  end

  def handle_response({:ok, _}) do
    "Repository created!"
  end

  def handle_response({:error, message}) do
    "Error! #{message}"
  end
end
