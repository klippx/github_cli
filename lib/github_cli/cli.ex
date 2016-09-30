defmodule GithubCli.CLI do
  def main(args) do
    parse_args(args)
    |> IO.puts
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _}
        -> :help
      {_, [command|args], _}
        -> GithubCli.CommandParser.parse_command(command, args)
    end
  end

  def process(:help) do
    IO.puts """
    Github CLI
    — — — — —
    usage: github_cli <command> <args>
    example: github_cli add_repo my_new_repo
    """
  end
end
