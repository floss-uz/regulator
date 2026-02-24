
## About

This is an assistant telegram bot for Floss Uzbekistan communtiy. It helps community members with various kind of tasks which you can check out in [features](#features) section!

> Also, this telegram bot is a complience for [Floss Uzbekistan](https://std.floss.uz)'s standartization.

## Features

These are features that was implemented within telegram bot. Features that are underdevelopment are marked `WIP`.

- [WIP] Greet newcomers of the community (it's a trigger)
- [WIP] Delete messages from Channel users (it's a trigger)
- [WIP] Serve rules list for members (via `/rules`)
- [WIP] Show other rust communities (via `/group`)
- [WIP] Roadmap for newbies (via `/roadmap`)
- [WIP] Share with more Rusty useful resources (via `/useful`)
- [WIP] Warn user about off-topic message and redirect (via `/warn`)

## Development

The project has `shell.nix` which has development environment preconfigured already for you. Just open your
terminal and at the root of this project:

```bash
# Open in bash by default
nix develop

# If you want other shell
nix develop -c $SHELL

# Upon entering development environment for the first
# time, you'll be asked for your development telegram
# bot token, it will be written to .env file for more
# convenient dev env startups. Token is saved at .env
# file at the root of this project. You can change it
# whenever you want!

# After entering development environment, inside the
# env, you can open your editor, so your editor will
# read all $PATH and environmental variables, also
# your terminal inside your editor will adopt all
# variables, so, you can close terminal.

# Vim
vim .

# VSCode
code .

# Zed Editor
zed .
```

The development environment has whatever you may need already, but feel free to add or remove whatever
inside `flake.nix`.

## Building

Well, there are two ways of building your project. You can either go with classic `cabal build` way, but before that, make sure to enter development environment to have cargo and all rust toolchain available in your PATH, you may do like that:

```bash
# Entering development environment
nix develop -c $SHELL

# Compile the project
cabal build
```

Or, you can build your project via nix which will do all the dirty work for you. Just, in your terminal:

```bash
# Build in nix environment
nix build

```

## Deploying (works only for flake based NixOS)

Deploying this project, telegram bot requires host machine to have its own flake based configuration.

### Activation

..

### Set up

..

### Available default options

..

## Working productions

..

## FAQ

..

### Why not use default.nix for devShell?

..

### Error when building or entering development environment

..
