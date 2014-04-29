# Makefile for creating RNG schema files from WeGA ODD files

# add a file local.build.properties to current directory and specify
# ROMA = Path to local roma2.sh script (https://github.com/TEIC/Roma)
# TEI_SOURCE = Path to local TEI p5subset.xml (get the latest release from http://sourceforge.net/projects/tei/files/TEI-P5-all/)
# MEI_SOURCE = Path to local MEI driver.xml (get the latest release from https://code.google.com/p/music-encoding/downloads/list)
# TEI_XSL = Path to local installation of the TEI stylesheets (https://github.com/TEIC/Stylesheets)
include local.build.properties

# set the default language to english
# it can be overwritten with e.g. DOCLANG=de when calling make
ifndef DOCLANG
	DOCLANG=de
endif

# Options to be passed to roma2.sh (see roma2.sh --help)
ROMAOPTS=--nodtd --noxsd --doclang=${DOCLANG} --isoschematron

# the target directory for the created RNG schema files
TARGET_DIR=./schema/${DOCLANG}


all: letters persons var biblio news diaries writings places works

letters:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_letters.odd.xml ${TARGET_DIR}

persons:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_persons.odd.xml ${TARGET_DIR}

var:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_var.odd.xml ${TARGET_DIR}

biblio:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_biblio.odd.xml ${TARGET_DIR}

news:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_news.odd.xml ${TARGET_DIR}

diaries:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_diaries.odd.xml ${TARGET_DIR}

writings:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_writings.odd.xml ${TARGET_DIR}
	
places:
	${ROMA} --xsl=${TEI_XSL} --localsource=${TEI_SOURCE} ${ROMAOPTS} src/WeGA_places.odd.xml ${TARGET_DIR}
	
works:
	${ROMA} --xsl=${TEI_XSL} --localsource=${MEI_SOURCE} ${ROMAOPTS} src/WeGA_works.odd.xml ${TARGET_DIR}

clean:
	echo "cleaning up"
	#rm -rf ${TARGET_DIR}/src
	find ${TARGET_DIR}/../ -name '*.rnc' | xargs /bin/rm -f
	echo "... done"

.PHONY: letters persons var biblio news diaries writings places clean all
.SILENT: clean
