// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract Book{
 
    struct MyBook{
    uint   price;
    string   title;
    address  owner;
    bool sold;

    }
    MyBook public  b1;
    

    address [] public buyers;
     
    
     function setBook(string memory _title,uint _price)public  {
        b1.title=_title;
       b1.price=_price;
    }
    function getBook()public  view  returns (string memory,uint){
        return (b1.title,b1.price);
    }
    function toWei(uint amt)public pure returns(uint) {
         return (amt*1000000000000000000);

    }
  
    function buyBook()public  payable {
          require(toWei(b1.price)<=msg.value,"Incorrect Amount");  //if the condition is false reveret the transation
        //  if(toWei(price)<=msg.value){
            b1.owner=msg.sender;
            buyers.push(b1.owner);
            b1.sold=true;
            uint bal=msg.value-toWei(b1.price);
            if(bal>0){
                payable (msg.sender).transfer(bal);
            }

    // }

}
    function buyersCount() public view returns (uint)
    {
        return (buyers.length);
    }
}