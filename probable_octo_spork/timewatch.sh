#!/usr/bin/env bash
# timewatch.sh - keeps track of time watching
source ./timeparse.sh

this_time=$(date +%s)
session_start=/tmp/.timewatch.txt
total_watch=~/.productivity/total_watch.txt

if [ ! -d ~/.productivity ]; then
  mkdir ~/.productivity
  echo "DEBUG: made ~/.productivity"
else
  :
fi
if [ ! -e $total_watch ]; then
  touch $total_watch
  echo "DEBUG: made $total_watch"
else
  :
fi

time_parse(){
  echo "Debug: time_parse $secs"
}

stop_timewatch(){
start_time=`cat $session_start`
total_time=`cat $total_watch`
(( time_elapsed = this_time - start_time ))
echo "DEBUG: time elapsed = $time_elapsed sec"
echo "DEBUG: stop the clock?"
read yn
if [[ "$yn" == "y" ]]; then
  echo "DEBUG: total watch time is $total_time"
  (( total_time = total_time + time_elapsed ))
  echo "DEBUG: new total time is: $total_time"
  echo $total_time > $total_watch
  echo "DEBUG: your total watch is: $total_time"
  rm $session_start
else
  echo "DEBUG: Timecheck! " + 
  displaytime "$total_time"
  exit
fi
}

start_timewatch(){
if [ ! -e $session_start ]; then
  touch $session_start
  echo "DEBUG: A new session! Created $session_start"
  echo $this_time > $session_start
  return 0
else
  # current session
  echo "DEBUG: .timewatch.txt does exist"
  stop_timewatch
fi
}

start_timewatch


