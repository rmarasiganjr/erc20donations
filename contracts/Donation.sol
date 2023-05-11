pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Donation {
    IERC20 public token;

    event Donated(address indexed donor, uint256 amount);

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }

    function donate(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        token.transferFrom(msg.sender, address(this), amount);
        emit Donated(msg.sender, amount);
    }

    function withdraw(address to, uint256 amount) public {
        token.transfer(to, amount);
    }
}
