import json
import nimcrypto
import std/tables

var variable = %*{
    "index": 1,
    "timestamp": 1506057125.900785,
    "transactions": [
        {
            "sender": "8527147fe1f5426f9dd545de4b27ee00",
            "recipient": "a77f5cdfa2934df3954a5c7c7da5df1f",
            "amount": 5,
        }
    ],
    "proof": 324984774000,
    "previous_hash": "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
}

var previous_hash=1
var proof=100

type Blockchain = object                
  chain: array                          
  current_transactions: array                  

func initChain(chain): Blockchain =                         
  result.chain = []                  
  result.current_transactions = []
  result.new_block(previous_hash, proof)       

var link = initChain()            

proc new_block(argument: object proof: int previous_hash: string): object
    let block = %*{
    "index": len() + 1,
    "timestamp": time(),
    "transactions": argument.current_transactions,
    "proof":proof,
    "previous_hash": previous_hash or argument.hash(argument.chain[-1])
    }
    argument.current_transactions=[]
    argument.chain.append(block)
    return block

proc last_block(argument: object): object {.property.}
        return argument.chain[-1]

proc new_transaction(argument: object sender: string recipient: string amount: int): object
    var sendj = %*{
    "sender": sender,
    "recipient": recipient,
    "amount": amount}
    argument.current_transactions.add(sendj)
    return argument.last_block["index"]+1
    
proc hash(block: object): object {.staticmethod.}

    let block_string = parseJson(block)
    return $sha256.digest(block string)
