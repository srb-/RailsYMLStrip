#!/usr/bin/env coffee


ARGV = process.argv[1..]  # Drop 'coffee' interpreter from arguments.
ARGC = ARGV.length


if ARGC isnt 2
  process.stdout.write """

    NAME
      CustomerTranslate.coffee - Prepare Rails locale files for customer translation

    SYNOPSIS
      coffee CustomerTranslate.coffee en.YML > spanish.txt

    DESCRIPTION
      Strips out english translations and adds instructions for user to translate. 


    """
  return


fs = require 'fs'
input = fs.readFileSync(ARGV[1], 'utf8')

process.stdout.write """

#------------------------------------------------------
#   WebRentalTracking.com  - Language Localization File
#------------------------------------------------------
#
#  Instructions: For each English phrase on the left, type the correct word/phrase 
#  in your language on the right, between the empty ("") quotation marks. 
#
#  Note: The most important words to translate come first, so start there first. 
#
#  Thank you!!!


"""

rows = input.split('\n')

for r, index in rows

  if index < 7 then continue # Don't pass along my rails yml comments
  rowPair = r.split(':')
  if rowPair.length is 2
    process.stdout.write rowPair[0] + ': \"\"\n' if rowPair.length is 2 # get rid of english translation so they don't have to delete it manually
  else
    process.stdout.write r + '\n' # Not a pair... so just pass it through
