#! /bin/bash

if pgrep -x "wf-recorder" > /dev/null; then 
    pkill -SIGINT wf-recorder
else
    wf-recorder -g "$(slurp)" -f ~/Videos/recording-$(date +'%Y-%m-%d_%H-%M-%S').mp4
fi
