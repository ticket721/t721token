pragma solidity 0.5.15;

import "@openzeppelin/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract T721Token is ERC20, ERC20Detailed, Ownable {

    constructor() public ERC20Detailed("T721 Token", "T721T", 18) {}

    function mintFor(address _recipient, uint256 _amount) public onlyOwner {
        ERC20._mint(_recipient, _amount);
    }

    function burn(uint256 _amount) public {
        require(ERC20.balanceOf(msg.sender) >= _amount, "T721Token::burn | insufficient balance for burn");
        ERC20._burn(msg.sender, _amount);
    }

}
