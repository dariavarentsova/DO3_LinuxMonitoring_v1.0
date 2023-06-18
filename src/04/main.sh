#!/bin/bash

param=$(bash ./check_config.sh)


colors=$(bash ./colors.sh ${param[@]:0:7})

bash ./print.sh $colors

bash ./print_color.sh $param