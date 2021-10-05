#!/usr/bin/env bash

secs_time=$1

function displaytime {
  local Y=$((secs_time/60/60/24/365))
  local D=$((secs_time/60/60/24%365))
  local H=$((secs_time/60/60%24))
  local M=$((secs_time/60%60))
  local S=$((secs_time%60))
  (( $Y > 0 )) && printf '%d years ' $Y
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S
}
displaytime $secs_time
