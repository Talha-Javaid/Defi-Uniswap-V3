// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/uniSwap.sol";

contract swapCrypto {

    address private constant UNISWAP_V2_ROUTER = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;
    address private constant WETH = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;

    function swap (
    address _tokenIn,
    address _tokenOut,
    uint _amountIn,
    uint _amountOutMin,
    address _to
  ) external {
    IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
    IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER, _amountIn);

    address[] memory path;
    path = new address[] (3);
    path[0] = _tokenIn;
    path[1] = WETH;
    path[2] = _tokenOut;

    IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
      _amountIn, 
      _amountOutMin, 
      path, 
      _to, 
      block.timestamp
      
    );
    
  
  }


  
}