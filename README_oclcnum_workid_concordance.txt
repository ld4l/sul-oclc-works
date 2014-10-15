
From: <Washburn>, Bruce <washburb@oclc.org>
Date: Thursday, September 4, 2014 at 9/4/14 • 3:47 PM
To: Roy Tennant <tennantr@oclc.org>
Subject: OCLC number to Work identifier Concordance

    Roy,
     
    I produced a Concordance dataset that has 3 columns with data extracted from
    the most recent Research snapshot of WorldCat:
     


    Column 1: Any OCLC number that is in use now or has been previously used for a
    manifestation record.  These are obtained from the 001 and 019 fields of the
    current WorldCat bibliographic record data.

    Column 2: The current OCLC number in 001 of the WorldCat record.  (So, many of
    the values in column 1 will exactly match the corresponding value in column 2)

    Column 3: The current WorldCat Work identifier associated with the manifestation
    OCLC number.  Between the values in column 2 and 3 there is potentially a many
    to one relationship.

    That’s 343,661,766 rows, and gzipped the file is 3,324,771,867 bytes
    (3.3GB).  So, it should still FTP-able, if you don’t mind waiting.
     
    Bruce



https://oclc.org/batchload/controlnumber.en.html



OCLC Control Numbers in MARC records

Bibliographic records output from OCLC systems, including Connexion, WorldCat
Cataloging Partners and CatExpress®, contain the OCLC Control Number. WorldCat
Local supports one custom OCLC Control Number prefix. The "ocm" or "ocn"
prefixes are considered a single prefix.

The OCLC Control Number can be found in fields 001, 019, and 035 as follows.

    On records created 12 November 2006 and before, field 001 contains the OCLC Control Number.
    On records created after 12 November 2006, field 035 contains the OCLC Control Number.
    Field 019 contains the OCLC Control Number of a deleted or merged record replaced by the current one.
    In Field 001, the OCLC Control Number is prefixed by "ocm" or "ocn" or "on."
    In Field 035, $a, the OCLC Control Number is prefixed by "OCoLC."



 
