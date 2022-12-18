#!/bin/bash

context=$(kubectl config current-context)

if [ -z "$context" ]
then
  echo "<none>"
else
  echo "$context"
fi
