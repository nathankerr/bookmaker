#!/bin/bash

if [ $# -ne 2 ]
then
	echo "USAGE: $0 input.pdf output.pdf"
	exit 65
fi

INPUT="$1"
OUTPUT="$2"

INTERMEDIATE=output
TMPDIR=`mktemp -d --tmpdir bookmaker-XXXXX`

cp "$INPUT" $TMPDIR/input.pdf
pushd $TMPDIR

PDFTRIMWHITE=/opt2/texlive-2011/texmf-dist/scripts/context/perl/pdftrimwhite.pl
#PDFTRIMWHITE=/usr/local/texlive/2011/texmf-dist/scripts/context/perl/pdftrimwhite.pl
PAGES=`gs -sDEVICE=bbox -dNOPAUSE -dBATCH input.pdf 2<&1|grep -c %%BoundingBox`
echo "$PAGES Pages"

# Book printing (glued)
# \setuparranging[2*2,doublesided]

# Chapbook printing (stiched)
# \setuparranging[2UP,doublesided]
cat > $INTERMEDIATE.tex <<HEAD
\setuppapersize[A5][A4,landscape]
\setuparranging[2*2,doublesided]
\setuplayout[header=0cm,footer=1mm,width=fit,height=fit,topspace=12.7mm,backspace=12.7mm]
\setuppagenumbering[location=inright,alternative=doublesided]
\starttext

HEAD

echo -n "Trimming page"
for i in `seq 1 $PAGES`
do
	echo -n " $i"
	perl $PDFTRIMWHITE --page=$i input.pdf
	mv pdftrimwhite.pdf pdftrimwhite-$i.pdf
	echo "\externalfigure[pdftrimwhite-$i][factor=fit]" >> $INTERMEDIATE.tex
done

cat >> $INTERMEDIATE.tex <<TAIL

\stoptext
TAIL

echo
echo "Imposing..."
context --batchmode --noconsole $INTERMEDIATE.tex

popd
mv $TMPDIR/output.pdf "$OUTPUT"
[ -d $TMPDIR ] && rm -rf $TMPDIR
