/// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.19;

// polygon entrypoint 0x5ff137d4b0fdcd49dca30c7cf57e578a026d2789

import "forge-std/Script.sol";
import "../src/Safe4337Module.sol";
import "forge-std/console.sol";

contract Deploy4337Module is Script {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    // Safe4337Module module = new Safe4337Module(0xbb544Ee3a9adb4a0e1441f29A88BA2ec0f866ccA); // addr for polygon
    Safe4337Module module = new Safe4337Module(0x76c41891Ca4524BbF116C141b7cFbf200dA3d63e); // addr for gnosis
  }
}
