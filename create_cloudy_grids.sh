#!/bin/bash

# create a cloudy grid using the default assumptions

# synthesizer_dir="/Users/stephenwilkins/Dropbox/Research/data/synthesizer/"
synthesizer_dir="/research/astrodata/highz/synthesizer/" # apollo
machine="apollo"
c=$CLOUDY

cd ..
while IFS="" read -r p || [ -n "$p" ]
do
  arrIN=(${p// / })
  sps=${arrIN[0]}
  params=${arrIN[1]}
  printf '%s\n' "$sps"
  printf '%s\n' "$params"
  echo python3 create_cloudy_input_grid.py -synthesizer_data_dir $synthesizer_dir -machine $machine -sps_grid $sps  -cloudy_grid $params  -cloudy_path $c
  python3 create_cloudy_input_grid.py -synthesizer_data_dir $synthesizer_dir -machine $machine -sps_grid $sps  -cloudy_grid $params  -cloudy_path $c
done < synthesizer_grid_creation_scripts/spsparams.txt
