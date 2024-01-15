// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Lottery
{
  address public manager;
  address[] public players;

  function lottery () public
  {
    manager = msg.sender;
  }

function EnterPlayers() public payable //here player will pay something and participate
{
  require (msg.value > .1 ether); //participant has to pay 0.1 ether
  players.push(msg.sender);
}
function random() private view returns (uint)
{
  return uint(keccak256("players"));
}

function pickWinner() public restricted
{
  uint index = random();
  players[index].transfer(this.balance);
  players = new address[](0);
} 

modifier restricted()
{
  require(msg.sender==manager);
}

function ShowPlayers() public view returns( uint[] memory)
{  
  return players;
}
}
