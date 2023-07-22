// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/AABasic.sol";
import "forge-std/console.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";


contract AABasicTest is Test {
    IERC20 USDC = IERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
    address USDC_HOLDER = 0xe7804c37c13166fF0b37F5aE0BB07A3aEbb6e245;

    event Executed(address indexed dest, uint256 value, bytes func);
    AABasic public aa;
    event ggg(bytes data);

    function setUp() external {
        vm.createSelectFork('https://polygon.llamarpc.com');
        aa = new AABasic();
        vm.deal(address(aa), 100 ether);
        vm.prank(USDC_HOLDER);
        USDC.transfer(address(aa), 1000e6);
    }

    function testEvent() external {
        uint256 balance = USDC.balanceOf(address(aa));
        console.log("balance: %s", balance);
        vm.expectEmit(true, false, false, true);
        bytes4 func = bytes4(keccak256("transfer(address,uint256)"));
        bytes memory data = abi.encodeWithSelector(func, USDC_HOLDER, 1);
        emit ggg(data);
        // emit Executed(address(USDC), 0, data);
        // aa.execute(address(USDC), 0, data);
        // balance = USDC.balanceOf(address(aa));
        // console.log("balance: %s", balance);
    }
}
