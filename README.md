# Multisig-Tx-Builder

A tool to build batched transactions with foundry script and create on Safe Multisig Wallets.

Implemented Github workflow to create batched tx on Safe when merged to main branch. Just add `PRIVATE_KEY` in your [repo secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) and also `ETH_RPC_URL`.

Uses [forge-safe](https://github.com/ind-igo/forge-safe) under the hood.



## Usage

1. First, clone the project and run forge install inside the project directory.


  ```bash
  $ git clone https://github.com/AlienFinance/multisig-tx-builder.git
  $ cd multisig-tx-builder
  $ forge install
  ```

2. In your `.envrc` file, Set `PRIVATE_KEY` to your private key as safe owner or delegate wallet and `ETH_RPC_URL`.

3. Copy `script/Example.s.sol` to `script/YourScript.s.sol` and modify it to your multisig script.

4. To run the script you just created:

```bash
forge script script/YourScript.s.sol --skip-simulation -vvvvv --ffi --rpc-url $ETH_RPC_URL
```

## Useful features

```js
function executeBatch(bool send_, uint256 nonce_)
```
- Set `send_` to `false` if you are testing the script locally but not create the batched tx on safe.
- Set `nonce_` to override pending tx on the queue. Use `function executeBatch(bool send_)` if you don't want to customize nonce.
