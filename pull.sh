#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Type the commit comment!" &1>2
    exit 1
fi
git pull https://github.com/char-lie/dorogovtsev
git add pull.sh
git add common/*.tex common/*.bib common/*.bst
git add README.md
git add PT/*.tex PT/index.pdf PT/part*/*.tex MS/part*/README.md PT/*.latexmain
git add MS/*.tex MS/index.pdf MS/preface/*.tex MS/part*/*.tex MS/part*/README.md MS/*.latexmain
git add MS/tikz/*.tex
git add SP/*.tex SP/index.pdf SP/part*/*.tex SP/*.latexmain
git add MustKnow/*.tex MustKnow/index.pdf MustKnow/*.latexmain
git commit -m "$1"
git push https://char-lie@github.com/char-lie/dorogovtsev
