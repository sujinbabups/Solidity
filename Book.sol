// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Book {
 
    struct MyBook{
    uint   price;
    string   title;
    address  owner;
  

    }
    MyBook public  b1;
    

    address [] public buyers;
     mapping(uint=>MyBook)public Books;

    
     function setBook(uint _id,uint _price,string memory _title)public  {
      Books[_id]=MyBook(_price,_title,msg.sender);
      
    }
 
    function toWei(uint amt)public pure returns(uint) {
         return (amt*1000000000000000000);

    }
  
    function buyBook()public  payable {
          require(toWei(b1.price)<=msg.value,"Incorrect Amount");  //if the condition is false reveret the transation
        //  if(toWei(price)<=msg.value){
            b1.owner=msg.sender;
            buyers.push(b1.owner);
            
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
