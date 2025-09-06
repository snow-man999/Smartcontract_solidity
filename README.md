# Ethereum Smart Contract Template

This development quick start template is heavily inspired by [Georgios's template](https://github.com/gakonst/dapptools-template). Over time it was migrated to use [foundry](https://github.com/gakonst/foundry) since dapptools was deprecated.

It requires [Foundry](https://github.com/gakonst/foundry) installed to run. You can find instructions here [Foundry installation](https://github.com/gakonst/foundry#installation).

## Installation

### GitHub template

It's easiest to start a new project by clicking the ["Use this template"](https://github.com/cleanunicorn/ethereum-smartcontract-template/generate).

### Manual installation

If you want to create your project manually, clone the template in a new folder and `cd` into it.

Clone the template, install dependencies and make sure tests work:

```sh
mkdir cool-dapp
cd cool-dapp
forge init --template https://github.com/cleanunicorn/ethereum-smartcontract-template 
# Install the project's dependencies (libs and yarn packages)
make 
# Run tests
make test 
```

## Features

For Foundry specific features, refer to:

- [repository](https://github.com/foundry-rs/foundry)
- [cheat codes](https://github.com/foundry-rs/foundry/blob/master/forge/README.md#cheat-codes)
- [Foundry book](https://book.getfoundry.sh/)

This template comes with an additional set of features explained below.

### Solidity libraries

Included libraries in [`lib`](lib/):

- [ds-test](https://github.com/dapphub/ds-test) - Test framework for DappTools
- [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) - OpenZeppelin contracts library
- [mockprovider](https://github.com/cleanunicorn/mockprovider) - Mocking library

### GitHub Actions

The template already comes with GitHub actions configured, which means that the project will be tested on every `push` and `pull request`.

Check the [project's actions](https://github.com/cleanunicorn/ethereum-smartcontract-template/actions) for an example.

Actions are defined in [.github/workflows/ci.yml](.github/workflows/ci.yml).

### GitHub templates

The template comes with a list of templates:

- [feature](.github/ISSUE_TEMPLATE/feature.md)
- [bug](.github/ISSUE_TEMPLATE/bug.md)
- [pull request](.github/pull_request_template.md)

## Commands

- `make setup` - initialize libraries and yarn packages
- `make build` - build your project
- `make xclean` - remove compiled files
- `make lint` - lint files
- [`make test`](#testing) - run tests
- `make test-gasreport` - run tests and show gas report
- `make watch` - watch files and re-run tests

## Testing

Normally you would run your tests on the local evm engine.

```sh
$ make test
forge test --gas-report
[⠊] Compiling...
[⠑] Compiling 19 files with 0.8.13
Compiler run successful

Running 2 tests for OnlyAuthorizedTest.json:OnlyAuthorizedTest
[PASS] testCanChangeOwner() (gas: 11542)
[PASS] testOtherUsersCannotChangeOwner() (gas: 156817)
╭─────────────────┬─────────────────┬──────┬────────┬──────┬─────────╮
│ Caller contract ┆                 ┆      ┆        ┆      ┆         │
╞═════════════════╪═════════════════╪══════╪════════╪══════╪═════════╡
│ Deployment Cost ┆ Deployment Size ┆      ┆        ┆      ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 114159          ┆ 602             ┆      ┆        ┆      ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name   ┆ min             ┆ avg  ┆ median ┆ max  ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ externalCall    ┆ 6419            ┆ 6419 ┆ 6419   ┆ 6419 ┆ 1       │
╰─────────────────┴─────────────────┴──────┴────────┴──────┴─────────╯
╭─────────────────────────┬─────────────────┬──────┬────────┬──────┬─────────╮
│ OnlyAuthorized contract ┆                 ┆      ┆        ┆      ┆         │
╞═════════════════════════╪═════════════════╪══════╪════════╪══════╪═════════╡
│ Deployment Cost         ┆ Deployment Size ┆      ┆        ┆      ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 133694                  ┆ 607             ┆      ┆        ┆      ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name           ┆ min             ┆ avg  ┆ median ┆ max  ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ changeOwner             ┆ 2504            ┆ 3980 ┆ 3980   ┆ 5457 ┆ 2       │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ owner                   ┆ 335             ┆ 335  ┆ 335    ┆ 335  ┆ 1       │
╰─────────────────────────┴─────────────────┴──────┴────────┴──────┴─────────╯
╭─────────────────────────────┬─────────────────┬────────┬────────┬────────┬─────────╮
│ OnlyAuthorizedTest contract ┆                 ┆        ┆        ┆        ┆         │
╞═════════════════════════════╪═════════════════╪════════╪════════╪════════╪═════════╡
│ Deployment Cost             ┆ Deployment Size ┆        ┆        ┆        ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 741677                      ┆ 3639            ┆        ┆        ┆        ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name               ┆ min             ┆ avg    ┆ median ┆ max    ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ setUp                       ┆ 171174          ┆ 171174 ┆ 171174 ┆ 171174 ┆ 2       │
╰─────────────────────────────┴─────────────────┴────────┴────────┴────────┴─────────╯

```

### Changes

Listed in the [CHANGELOG.md](./CHANGELOG.md) file which follows the https://keepachangelog.com/en/1.0.0/ format. 

### Testing forked chain

Work in progress...

<!-- ### Testing forked chain

You can also fork a chain by providing an RPC url to something like [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/).

To enable blockchain forking, you need to copy `.env.example` to `.env` and change `RPC_ON` and `ETH_NODE` to match your environment.

```sh
export RPC_ON=yes
export ETH_NODE=https://eth-mainnet.alchemyapi.io/v2/ALCHEMY_API_KEY
```

After adding the variables to your `.env` you can run `make test` normally

You need to add the RPC url to your GitHub secrets as `ETH_NODE` to enable fork testing in GitHub Actions. Also make sure to uncomment these lines in [`.github/workflows/ci.yml`](.github/workflows/ci.yml).

```yaml
# Enable this if using forking tests
env:
    ETH_NODE: ${{ secrets.ETH_NODE }}
    RPC_ON: yes
``` -->


# FAQ
    1. What is the Smartcontract?
        A smart contract is a self-executing program stored on a blockchain.
        It automatically enforces rules or agreements without the need for a central authority.
    2. What is the solidity?
        Solidity is a programming language specifically designed to write smart contracts on the Ethereum blockchain.
    3. What is the connections between smartcontract and solidity?
        Solidity is the main language used to write smart contracts on Ethereum and other EVM-compatible blockchains (like BNB Chain, Polygon, etc.).
    4. If you have any question with this project, feel free to reach out.
    5. This project protected by S.Team from 2022@com
