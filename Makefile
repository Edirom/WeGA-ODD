# Makefile for creating RNG schema files from WeGA ODD files

# Path to local roma2.sh script (https://github.com/TEIC/Roma)
ROMA=/Users/pstadler/WeGA/TEI-Entwicklung/roma-current/roma2.sh

# Path to local p5subset.xml (get the latest release from http://sourceforge.net/projects/tei/files/TEI-P5-all/)
TEI_SOURCE=/Users/pstadler/WeGA/TEI-Entwicklung/tei-current/xml/tei/odd/p5subset.xml

# Path to local installation of the TEI stylesheets (https://github.com/TEIC/Stylesheets)
TEI_XSL=/Users/pstadler/WeGA/TEI-Entwicklung/xsl-current/xml/tei/stylesheet

# Options to be passed to roma2.sh (see roma2.sh --help)
ROMAOPTS=--nodtd --noxsd

# the target directory for the created RNG schema files
TARGET_DIR=./schema


all: letters persons var biblio news diaries writings

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

clean:
	echo "cleaning up"
	rm -rf ${TARGET_DIR}/src
	find ${TARGET_DIR} -name '*.rnc' | xargs /bin/rm -f
	echo "... done"

.PHONY: letters persons var biblio news diaries writings clean all
.SILENT: clean