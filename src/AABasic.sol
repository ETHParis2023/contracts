// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AABasic is Ownable {
    struct UserOperation {

        address sender;
        uint256 nonce;
        bytes initCode;
        bytes callData;
        uint256 callGasLimit;
        uint256 verificationGasLimit;
        uint256 preVerificationGas;
        uint256 maxFeePerGas;
        uint256 maxPriorityFeePerGas;
        bytes paymasterAndData;
        bytes signature;
    }

    event Executed(address indexed dest, uint256 value, bytes func);

    mapping(address => bool) public whitelist;

    constructor() {
        whitelist[msg.sender] = true;
    }

    modifier onlyWhitelist() {
        require(whitelist[msg.sender], "not in whitelist");
        _;
    }

    function addToWhitelist(address addr) external onlyWhitelist {
        whitelist[addr] = true;
    }

    function execute(address dest, uint256 value, bytes calldata func) external onlyWhitelist() {
        emit Executed(dest, value, func);
        (bool success, bytes memory returndata) = dest.call{value: value}(func);
        require(success, string(returndata));
    }

    function validateUserOp(UserOperation calldata userOp, bytes32 userOpHash, uint256 missingAccountFunds) external returns (uint256 validationData) {
        return 0;
    }

    receive() external payable {}
}
