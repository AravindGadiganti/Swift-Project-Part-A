//
//  Transaction.swift
//  Project_Banking_Sytem
//
//  Created by Aravind Gadiganti on 31/10/20.
//  Copyright © 2020 Aravind Gadiganti. All rights reserved.
//

import Foundation
  class Transactions{
    var userName:String
    var AccountNUmber:String
    var balance:String
    init(_ uName:String,_ accNumber:String,_ bal:String){
        AccountNUmber = accNumber
        userName = uName
        balance = bal
    }
        
        func chooseCustOption(_ userName:String,_ accountNumber:String,_ balance:String,_ acctoutArray:Array<String>) -> Array<String>{
            var acctArray = [String]()
                   print("Choose an option:")
                   print("1. Deposit Money")
                   print("2. WithDraw Money")
                   print("3. Transfer Money")
                   print("4. Display Balance")
                   print("5. Pay Utility")
                   print("0. Logout")
                   let choice:String = readLine()!
                   switch choice {
                   case "0":
                       print("Logged out successfully from the Application")
                       acctArray = acctoutArray
                   case "1":
                   deposit()
                   acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   case "2":
                   withdraw()
                    acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   case "3":
                     acctArray = tranferMoney(acctoutArray)
                   acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   case "4":
                       displayBal(accountNumber)
                   acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   case "5":
                   payUtility()
                   acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   default:
                        print("Choose correct option")
                       acctArray = chooseCustOption(userName,accountNumber,balance,acctoutArray)
                   }
            return acctArray;
               }
    
    func deposit(){
        print("Enter deposit amount:")
            let depositAmt = readLine()!
        balance = String((balance as NSString).doubleValue + (depositAmt as NSString).doubleValue)
        print("\(userName)'s Account After Deposit :  \(balance)")
       
    }
    
        func withdraw() {
        print("Enter withdraw amount:")
        let withdrawAmt = readLine()!
        if (balance as NSString).doubleValue >= (withdrawAmt as NSString).doubleValue{
            balance = String((balance as NSString).doubleValue - (withdrawAmt as NSString).doubleValue)
        print("\(userName)'s Account After Withdraw \(balance)")
        }
        else{
            print("Balance available in your account is \(balance)")
        }
           
        }
        
        func payUtility()
        {
            print("Enter Bill amount:")
                  let withdrawAmt = readLine()!
                  if (balance as NSString).doubleValue >= (withdrawAmt as NSString).doubleValue{
                    balance = String((balance as NSString).doubleValue - (withdrawAmt as NSString).doubleValue)
                  print("\(userName)'s Account After payig bill \(balance)")
                  }
                  else{
                      print("Balance available in your account after paying bill is \(balance)")
                  }
       
        }
    
        func displayBal(_ accountNumber:String){
            print("Available Balance for \(accountNumber) is \(balance)" )
        }
    func tranferMoney(_ arrayList:Array<String>) -> Array<String>{
        print("Enter amount to transfer:")
        let transferAmt = readLine()!
        var arrdata = arrayList
        if (balance as NSString).doubleValue >= (transferAmt as NSString).doubleValue{
            balance = String((balance as NSString).doubleValue - (transferAmt as NSString).doubleValue)
        print("\(userName)'s Account balance After transfer \(balance)")
            print("Enter Account Number to transfer:")
                  let accountNum = readLine()!
                  for (number,userData) in arrdata.enumerated(){
                  var data = userData.split(separator: "|").map(String.init)
                   if data[0] == userName{
                       data[3] = balance
                       let sendertext = data.joined(separator: "|")
                       arrdata[number] = sendertext
                   }
                      if data[4] == accountNum {
                      let accbalance = String((data[3] as NSString).doubleValue + (transferAmt as NSString).doubleValue)
                       print("\(data[0])'s Account balance After Deposit :  \(accbalance)")
                          data[3] = accbalance
                          let text = data.joined(separator: "|")
                          arrdata[number] = text
                        print(arrdata)
                      }
                      
                      
                  }
        }
        else{
            print("Balance available in your account is \(balance)")
        }
      
        return arrdata;
    }
}
