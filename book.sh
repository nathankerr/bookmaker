#!/bin/bash

if [ $# -ne 2 ]
then
	echo "USAGE: $0 input.pdf output.pdf"
	exit 65
fi

INPUT=$1
INTERMEDIATE=output
OUTPUT=$2

PDFTRIMWHITE=/usr/local/texlive/2011/texmf-dist/scripts/context/perl/pdftrimwhite.pl
PAGES=`gs -sDEVICE=bbox -dNOPAUSE -dBATCH $INPUT 2<&1|grep -c %%BoundingBox`
echo "$PAGES Pages"

# Book printing (glued)
# \setuparranging[2*2]

# Chapbook printing (stiched)
# \setuparranging[2UP]
cat > $INTERMEDIATE.tex <<HEAD
\setuppapersize[A5][A4,landscape]
\setuparranging[2*2]
\setuplayout[header=0cm,footer=1mm,width=fit,height=fit,topspace=12.7mm,backspace=12.7mm]
\setuppagenumbering[location=inright]
\starttext

HEAD

echo -n "Trimming page"
for i in `seq 1 $PAGES`
do
	echo -n " $i"
	perl $PDFTRIMWHITE --page=$i $INPUT
	mv pdftrimwhite.pdf pdftrimwhite-$i.pdf
	echo "\externalfigure[pdftrimwhite-$i][factor=fit]" >> $INTERMEDIATE.tex
done

cat >> $INTERMEDIATE.tex <<TAIL

\stoptext
TAIL

echo
echo "Imposing..."
context --batchmode --noconsole $INTERMEDIATE.tex

mv $INTERMEDIATE.pdf $OUTPUT

rm -f pdftrimwhite* $INTERMEDIATE*