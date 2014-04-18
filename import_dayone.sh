#!/bin/bash

set -ex

cd ~/Dropbox/Apps/Day\ One/Journal.dayone/entries

for i in *.doentry; do echo $i; adb push $i /sdcard/DayJournal/temp; done;

cd ~/Dropbox/Apps/Day\ One/Journal.dayone/photos

for i in *.jpg; do echo $i; adb push $i /sdcard/DayJournal/images; done;
