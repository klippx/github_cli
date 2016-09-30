defmodule GithubCli.CommandParser do
  def parse_command("add_repo", args) do
    "Ha! You invoked me with command: add_repo and args: #{args}"
  end

  def parse_command(command, args) do
    "You invoked me with command: #{command} and args: #{args}"
  end
end
