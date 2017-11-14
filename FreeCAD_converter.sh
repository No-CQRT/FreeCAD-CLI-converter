#!/bin/bash
# ---------------------------------------------------------------------------
# FreeCAD command line Convertere

# Copyright 2017, Luca Perencin <info@nolabs.it>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.

# Usage: ./FreeCAD_converter.sh [inputfile] [outputfile] [destinationpath] 


if [ $# -eq 0 ]; then
	echo "";
	echo "Usage: ./FreeCAD_converter.sh [inputfile] [outputfile] [destinationpath]";
	echo "";
	echo "inputfile = file to be converted";
	echo "outputfile = destination file":
	echo "destinationpath = full path of the destination file";
	echo "if not provided, default path will be used";
	exit 1;
fi

#variables
inputfile=$1
outputfile=$2
destinationdir=$3
#destination dir is mandatory due FreeCAD bug

#testing 2 or 3 parameters

if [ $# -eq 2 ]; then
	echo "";
	echo "using default (home) path" $HOME;
	echo "";
	echo "converting...";
	echo "";
	freecad --hidden --output=$HOME/$outputfile $inputfile > /dev/null
	echo "done, check for" $2 "in" $HOME;
	echo "";
	exit 1;
fi

# 3 parameters

echo "converting...";
freecad --hidden --output=$destinationdir/$outputfile $inputfile > /dev/null 
echo "";
echo "done, check for" $2 "in" $3;
echo "";

