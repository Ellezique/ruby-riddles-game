#!/bin/bash
bundle install
 
echo "Please enter your name: "  
  
read  
  
echo "Name : $REPLY"

ruby index.rb $REPLY
