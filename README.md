WeGA ODD files
================

Files for documenting the Digital Edition of the [Carl-Maria-von-Weber-Gesamtausgabe](http://www.weber-gesamtausgabe.de) in the [ODD format](http://www.tei-c.org/Guidelines/Customization/odds.xml). 



Contents
--------

* `schema`: RelaxNG schemata, generated with the [TEI XSL Stylesheets](https://github.com/TEIC/Stylesheets) [1] from the ODD files below. For convenience, an  `ANT build file` is provided that documents the transformations. There are subfolders for English and German schemas which should only differ in the language of documentation (e.g. element and attribute descriptions)
* `src`: source ODD files
    * `Guidelines`: the WeGA Guidelines chapters. The main file is `guidelines-de.xml` which x-includes all chapters and schemaSpecs.   
    * `Specs`: the various schemaSpecs for the different document types. There are two special files: `common-specs.odd.xml` which provides all common specifications grouped into `specGrp`s (which are then referenced by the other schemaSpecs) and `schemaSpec-wega_all.odd.xml` which is a compiled super set of all the specific schemaSpecs.
* `compiled-ODD`:  the compiled (= processed with [`odd2odd.xsl`](https://github.com/TEIC/Stylesheets/blob/dev/odds/odd2odd.xsl)) ODDs that include the full specifications and can serve as a new source for the [_chaining of ODDs_](https://wiki.tei-c.org/index.php/ODD_chaining).

[1] As of 2017-06-30 there is an issue in the TEI XSL Stylesheets with multiple schemaSpecs which is used here. More details and a patch can be found at the [GitHub issue 249](https://github.com/TEIC/Stylesheets/issues/249).  

License
-------

This work is available under dual license: [BSD 2-Clause](http://opensource.org/licenses/BSD-2-Clause) and [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)