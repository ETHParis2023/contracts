// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract AABasic {
    event Executed(address indexed dest, uint256 value, bytes func);

    function execute(address dest, uint256 value, bytes calldata func) external {
        emit Executed(dest, value, func);
        // call
        (bool success, bytes memory returndata) = dest.call{value: value}(func);
        require(success, string(returndata));
    }

    receive() external payable {}
}
