// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EncondingDecoding {
    function encodeString() public pure returns (bytes memory) {
        return abi.encode("Hello World!");
    }

    /* Output:  0x0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008
    000000000000000000000000000000000000000000000000000000000000000094d79206e616d653a200000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000000e4a6f6e617468616e204576616e2e000000000000000000000000000000000000 */

    function encodeInteger() public pure returns (bytes memory) {
        return abi.encode(1000);
    }

    // Output: 0x00000000000000000000000000000000000000000000000000000000000003e8

    function decodeString() public pure returns (string memory) {
        string memory newString = abi.decode(encodeString(), (string));
        return newString;
    }

    //  Output: Hello World!

    function decodeInteger() public pure returns (int16) {
        int16 newInteger = abi.decode(encodeInteger(), (int16));
        return newInteger;
    }
    // Output: 1000
}
