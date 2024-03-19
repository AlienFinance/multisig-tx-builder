// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import { BatchScript } from "forge-safe/BatchScript.sol";
import { IERC20 } from "forge-std/interfaces/IERC20.sol";

contract ExampleScript is BatchScript {

    address multisig = 0x309440cB9900f958392cdec04421AcBCE9f2FAA9;
    address alien = 0xCa84812E477eE5a96a92328689D8Ce2589aB6FfD;

    address receiver = 0x6f4fE843e549447D68C1287974385DC4D08E60bc;

    function run(bool send) public isBatch(multisig) {
        // fetch data before execution
        uint256 receiver_balance_before = IERC20(alien).balanceOf(receiver);

        // build tx
        bytes memory txn;

        // transfer 1 alien token to receiver
        uint256 amount = 1 * 1e18;
        txn = abi.encodeWithSelector(IERC20.transfer.selector, receiver, amount);
        addToBatch(alien, txn);

        vm.startBroadcast();

        executeBatch(send);

        vm.stopBroadcast();

        // assertion
        assert ((IERC20(alien).balanceOf(receiver) - receiver_balance_before) == amount);
    }

    function run() external {
        run(false);
    }
}
