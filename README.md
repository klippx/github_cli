# GithubCli

A cool tool to do some github stuff from the shell

## Configure .env file

In order to do stuff on github you need to create an API key that has access to managing repos.

Initialize .env: `cp .env.example .env`

Edit `.env` and paste your API key

Source .env into your shell: `source .env`

## Usage

### Create a new repo

Create a new empty repo

`./github_cli create_repo <name>`
