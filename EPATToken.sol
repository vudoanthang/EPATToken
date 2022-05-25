pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EPATToken is ERC20 {
	constructor() ERC20("EPATToken", "EPAT") {
		_mint(msg.sender, 1000000000 * 10 ** decimals());
	}
	/*
	Users make mistake by transfering usdt/usdt ... to contract address. 
	This function allows contract owner to withdraw those tokens and send back to users.
	*/
	function rescueStuckErc20(address _token) external onlyOwner {
		uint256 _amount = ERC20(_token).balanceOf(address(this));
		ERC20(_token).transfer(owner(), _amount);
	}
}