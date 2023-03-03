#! /bin/bash

# Date in format Day-Month-Year
date=$(date +%d-%m-%Y)

# Commit message
message="Commit for $date"
git add .
git commit -m"${message}"
status="$(git status --branch --porcelain)"
echo $status >> ~/gitBashScript/cron_echo.txt
if [ "$status" == "## master...origin/master" ]; then
  echo "IT IS CLEAN" >> ~/gitBashScript/cron_echo.txt
else
  echo "There is stuff to push" >> ~/gitBashScript/cron_echo.txt
  git push -u origin master
fi

echo "Today is: $date" >> ~/gitBashScript/cron_test.txt
