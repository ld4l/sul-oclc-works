#!/usr/bin/env ruby

OUTPUT_FORMAT='txt'
#OUTPUT_FORMAT='ttl'  # turtle
if OUTPUT_FORMAT == 'ttl'
  puts '@prefix schema: <http://schema.org/> .'
end

# Read command line file names or stdin to get a set of OCLC control numbers
# that are in a library catalog (e.g., extracted from marc:035$a).  For example,
# a marc value might be '(OCoLC-M)413408' and we need to extract '413408' (see
# SUL_OCLC035a_conversions.sh).  These control numbers are input one-per-line:
# cat SUL_OCLC_control_numbers_sorted.txt | ./SUL_OCLCcn2OCLCwn.rb
require 'set'
input_arr = ARGF.readlines.collect {|s| s.chomp };
library_oclc_cn = input_arr.to_set

# The CN2WORK_FILENAME is described in comments below this script.  It was
# downloaded from OCLC.  It's a very large file, so each line of it is read only
# once in this script.  Any line that contains a library_oclc_cn in the 1st or
# 2nd field constitutes a 'match'.  The output uses the 'current control number'
# from the 2nd field and the work identifier from the 3rd field.
#CN2WORK_FILENAME = 'oclcnum_workid_concordance_test.txt'
CN2WORK_FILENAME = 'oclcnum_workid_concordance.txt'
File.open(CN2WORK_FILENAME) do |io|
  io.each do |line|
    oclc_cn0, oclc_cn1, oclc_wn = line.chomp.split
    # If this line contains a control number from the input data, 
    # then output the current OCLC control number and work number.
    match = false
    match ||= library_oclc_cn.include? oclc_cn0
    match ||= library_oclc_cn.include? oclc_cn1
    if match
      if OUTPUT_FORMAT == 'ttl'
        formatStr = "<http://www.worldcat.org/oclc/%s> schema:exampleOfWork <http://worldcat.org/entity/work/id/%s> .\n"
      else
        formatStr = "%s,%s\n"  # CSV
      end
      printf formatStr, oclc_cn1, oclc_wn

      ## Download URL for control number data from OCLC
      #oclc_cn_url4turtle = "http://www.worldcat.org/oclc/#{oclc_cn1}.ttl"
      #oclc_cn_url4jsonld = "http://www.worldcat.org/oclc/#{oclc_cn1}.jsonld"

      ## Download URL for work data from OCLC
      ## The work data has all control numbers under the 'schema:workExample' predicate.
      #oclc_work_url4turtle = "http://experiment.worldcat.org/entity/work/data/#{oclc_wn}.ttl"
      #oclc_work_url4jsonld = "http://experiment.worldcat.org/entity/work/data/#{oclc_wn}.jsonld"

      # TODO: retrieve additional LOD, as required.

    end
  end
end


#From: <Washburn>, Bruce <washburb@oclc.org>
#Date: Thursday, September 4, 2014 at 9/4/14 • 3:47 PM
#To: Roy Tennant <tennantr@oclc.org>
#Subject: OCLC number to Work identifier Concordance
#
#    Roy,
#
#    I produced a Concordance dataset that has 3 columns with data extracted from
#    the most recent Research snapshot of WorldCat:
#
#    Column 1: every OCLC number found in a record from both 001 and 019
#    Column 2: the current OCLC number for the record, from 001
#    Column 3: the current Work ID associated with the record
#
#    That’s 343,661,766 rows
#
#    Bruce


