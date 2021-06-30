pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./DsPain.sol";

contract DsPainTest is DSTest {
    DsPain pain;

    function setUp() public {
        pain = new DsPain();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
