# Multisig-Tx-Builder

## Usage

1. In your `.env` file, Set `PRIVATE_KEY` to your private key as safe owner or delegate wallet.

2. Copy `script/Example.s.sol` to `script/YourScript.s.sol` and modify it to your multisig script.

3. To build a multisig transaction, run:

```bash
forge script script/YourScript.s.sol --skip-simulation --chain-id 81457 --ffi -vvvvv --private-key $PRIVATE_KEY
```

## Useful features

```js
function executeBatch(bool send_, uint256 nonce_)
```
- Set `send_` to `false` if you are testing the script locally but not create the batched tx on safe.
- Set `nonce_` to override pending tx on the queue. Use `function executeBatch(bool send_)` if you don't want to customize nonce.
