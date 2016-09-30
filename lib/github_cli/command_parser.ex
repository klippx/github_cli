defmodule GithubCli.CommandParser do
  def parse_command("create_repo", args) do
    GithubCli.Actions.CreateRepository.execute(List.first(args))
  end

  def parse_command(command, _args) do
    "You invoked me with command: #{command}. This does not do anything."
  end
end
