WeGA Odd files
================

Files for documenting the Digital Edition of the [Carl-Maria-von-Weber-Gesamtausgabe](http://www.weber-gesamtausgabe.de) in the [ODD format](http://www.tei-c.org/Guidelines/Customization/odds.xml). 



Contents
--------

* `schema`: RelaxNG schemata, generated with the [roma cli](http://www.tei-c.org/Guidelines/Customization/odds.xml#romacommandline) from the ODD files below. For convenience, have a look at the `Makefile`. There are subfolders for English and German schemas which should only differ in the language of documentation (e.g. element and attribute descriptions)
* `src`: source ODD files
	* `WeGA_biblio.odd.xml`: WeGA ODD file for bibliographic documents 
	* `WeGA_common.odd.xml`: common macros and definitions for global use in the WeGA Digital Edition
	* `WeGA_diaries.odd.xml`: WeGA ODD file for the encoding of diary entries
	* `WeGA_letters.odd.xml`: WeGA ODD file for the encoding of correspondence material
	* `WeGA_news.odd.xml`: WeGA ODD file for the encoding of website news
	* `WeGA_persons.odd.xml`: WeGA ODD file for the encoding of (short) biographies
	* `WeGA_places.odd.xml`: WeGA ODD file for the encoding of places
	* `WeGA_var.odd.xml`: WeGA ODD file for the encoding of various  documents 
	* `WeGA_works.odd.xml`: WeGA ODD file for the encoding of musical works
	* `WeGA_writings.odd.xml`: WeGA ODD file for the encoding of writings


License
-------

This work is available under dual license: [BSD 2-Clause](http://opensource.org/licenses/BSD-2-Clause) and [Creative Commons Attribution 3.0 Unported License (CC BY 3.0)](http://creativecommons.org/licenses/by/3.0/)