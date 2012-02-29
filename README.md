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

# Printing

All PDFs produced by Bookmaker are meant to be printed using a duplex printer with long-edge flip. Long-edge flip is (usually) the default for duplex printing as it is the setting for full (single) page duplex printing.

Use your favorite PDF reader to print the produced PDF.

# Usage

```
usage: bookmaker [-h] [--paper PAPER] [--type TYPE] input output

DIY Books from PDFs

positional arguments:
  input          PDF to convert into a book
  output         Where to store the new book

optional arguments:
  -h, --help     show this help message and exit
  --paper PAPER  a4 | letter (Default is a4)
  --type TYPE    auto | chapbook | perfect (Default is auto)
```

## Requirements and Dependencies

Requires Python 2.7

Relies on Ghostscript and TexLive 2011 (newer version may also work)

## Installation

Put bookmaker in your path.
