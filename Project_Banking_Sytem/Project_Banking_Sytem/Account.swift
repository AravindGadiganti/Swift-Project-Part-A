//
//  Account.swift
//  Project_Banking_Sytem
//
//  Created by Aravind Gadiganti on 31/10/20.
//  Copyright © 2020 Aravind Gadiganti. All rights reserved.
//

import Foundation
class Account{
    
    var acctoutArray = [String]()
    
    func createUser(){
        print("Enter UserName:")
               let userName:String = readLine()!
               print("Enter Password:")
               let password:String = readLine()!
               print("Enter Account Type:")
               let account:String = readLine()!
               print("Enter Initial Balance:")
               let balance:String = readLine()!
        print("Enter Account Number:")
        let accNumber:String = readLine()!
                acctoutArray.append(userName+"|"+password+"|"+account+"|"+balance+"|"+accNumber)
    print(acctoutArray)
    }
   func login(){
       print("---------** Welcome to Swift Bank **-----------")
       print("")
        print("Enter UserName:")
        let userName:String = readLine()!
        print("Enter Password:")
        let password:String = readLine()!
        for (number,userData) in acctoutArray.enumerated(){
            var data = userData.split(separator: "|").map(String.init)
            let transactions = Transactions(String(data[0]),String(data[4]),String(data[3]))
            if (userName == String(data[0]) && password == String(data[1])){
                acctoutArray = transactions.chooseCustOption(String(data[0]),String(data[4]),String(data[3]),acctoutArray)
                data[3] = transactions.balance
               let text = data.joined(separator: "|")
               acctoutArray[number] = text
               login()
            }
         }
       if (userName == "Employee" && password == "Employee"){
           print("Choose an option:")
            print("1. Create an User")
            print("0. Logout")
             let choice:String = readLine()!
            switch choice {
            case "0":
            print("Successfully loged out from Application")
                login()
            case "1":
            createUser()
            login()
            default:
                print("Choose an Option")
            }}
            else {
            print("Invalid Credentials")
            self.login()
        }
}
}
