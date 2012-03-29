Bookmaker takes any PDF and reformats it for printing as a DIY book. Each page of the input PDF is trimmed for exterior white space, and then resized to fit four pages on a single sheet of paper (both sides). The pages are ordered according to the type of book desired.

# Paper size

Bookmaker can produce PDFs for A4 or Letter size paper.

    bookmaker --paper letter input.pdf output.pdf

- *a4*: Fit the input PDF to A5 and then impose the A5 pages on A4 paper. Produces an A4 sized PDF. (DEFAULT)
- *letter*: Fit the input PDF to half letter (digest) and then impose the half letter pages on letter paper. Produces a letter sized PDF.

# Book types

Bookmaker can produce PDFs ready for creating two types of books: chapbooks and perfect bound books.

Bookmaker can automatically choose which type to make. If the input PDF has less than 24 pages, it will produce a PDF suitable for making a chapbook. Otherwise it will produce a PDF suitable for making a perfect bound book.

    bookmaker --type perfect input.pdf output.pdf

- *auto*: if (pagecount(input.pdf) <= 24) then chapbook else perfect (DEFAULT)
- *chapbook*: produce a PDF suitable for making a chapbook
- *perfect*: produce a PDF suitable for making a perfect bound book

## Chapbooks

Chapbooks are then simply folded in half. The best page length for chapbooks is 16 pages. Above 24 starts to become unweildly without trimming and securing the pages. Folded chapbooks can be stapled or sewn.

Hamish MacDonald made a video tutorial on how to make [a simple chapbook](http://www.hamishmacdonald.com/books/books/DIYbook_ep16.php)

## Perfect bound books

Books are designed to be perfect bound with 1 sheet signatures. To do this, fold each page in half, stack the pages together, and glue.

Hamish MacDonald made a tutorial on [perfect bound books.](http://www.hamishmacdonald.com/books/books/DIYbook_ep17.php)

# Trim

Exterior whitespace (margins) are automatically trimmed from the input PDF pages. Different trimming schemes produce different results.

    bookmaker --trim even-odd input.pdf output.pdf

- *even-odd*: Creates document-wide trim setting for both even and odd pages
- *document*: Creates a document-wide trim setting from all pages
- *per-page*: Creates a trim setting for every page 

# Printing

All PDFs produced by Bookmaker are meant to be printed using a duplex printer with long-edge flip. Long-edge flip is (usually) the default for duplex printing as it is the setting for full (single) page duplex printing.

Running

    bookmaker --print input.pdf

will send the result to your default printer (using lp).

You can also set the printer to send the output to by

    bookmaker --printer printername input.pdf

Your favorite PDF reader can also print the produced PDF.

# Usage

```
usage: bookmaker [-h] [--paper PAPER] [--type TYPE] [--trim TRIM] [--print]
                 [--printer PRINTER]
                 input [output]

DIY Books from PDFs

positional arguments:
  input              PDF to convert into a book
  output             Where to store the new book

optional arguments:
  -h, --help         show this help message and exit
  --paper PAPER      a4 | letter (Default is a4)
  --type TYPE        auto | chapbook | perfect (Default is auto)
  --trim TRIM        even-odd | document | per-page (Default is even-odd)
  --print            send result to default printer
  --printer PRINTER  print result to specific printer (implies --print)

```

## Requirements and Dependencies

Relies on Ghostscript, TexLive 2011 (newer version may also work), Python, and CUPS (for printing).

If you have a python older than 2.7, you will need a copy of argparse. You can get a copy from the [latest python standard library]:(http://hg.python.org/cpython/file/2.7/Lib/argparse.py). Put argparse.py in the same directory as the bookmaker script. This method has been tested on RHEL6 which uses python 2.6.6.

Seems to work using Python 2.6.6, 2.7.2, and 3.2.2

## Installation

Put bookmaker in your path.
