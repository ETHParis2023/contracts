// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AABasic.sol";
import "forge-std/console.sol";

contract AABasicScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        // AABasic aa = new AABasic();
        // aa.addToWhitelist(0xeA5963C83b6E38d766EcF506f39A82E723Adc709);
        // aa.addToWhitelist(0xD470055c6189B921c4d44b3d277Ad868F79C0F75);
        AABasic aa = AABasic(payable(0x39Fa0171672765Abf9A645912dd31f76bD58f00A));
        // aa.addToWhitelist(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789);
        aa.execute(
            0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174,
            0,
            abi.encodeWithSelector(0xa9059cbb, 0x4ddda3C7fa1e9990fD3F3b35C30cBd859920aB44, 1)
        );
    }
}
