#!/bin/bash
first=grep -o '"firstName": ".*"' book.json | cut -d " " -f2 | tr -d '\"'
last=grep -o '"lastName": ".*"' book.json | cut -d " " -f2 | tr -d '\"'
echo " $first " + " " + " $last " 
