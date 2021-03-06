defmodule GithubCli.CLI do
  def main(args) do
    parse_args(args)
    |> process
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _}
        -> :help
      {_, [command|args], _}
        -> {command, args}
    end
  end

  def process({command, args}) do
    GithubCli.CommandParser.parse_command(command, args)
    |> IO.puts
  end

  def process(:help) do
    IO.puts """
    Github CLI
    — — — — —
    usage: github_cli <command> <args>
    supported commands: [add_repo]
    example: github_cli add_repo my_new_repo
    """
  end
end
