Дороговцев. Конспекты лекций
============================

Конспекты лекций Дороговцева Андрея Анатольевича: Теория Вероятности, Математическая Статистика, Случайные Процессы

Requirements
------------

###TeXLive 2013

Why? I needed `mdframed`
(http://mirror.unl.edu/ctan/macros/latex/contrib/mdframed/mdframed.pdf,
https://github.com/marcodaniel/mdframed)
to make pretty borders.

Quick install: https://www.tug.org/texlive/quickinstall.html

Full install: https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#installation

Don't forget to write following strings in ~/.bashrc!
```bash
PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2013/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2013/texmf-dist/doc/info:$INFOPATH; export INFOPATH
```

###VIM LaTeX Suite

Not required, but recommended http://vim-latex.sourceforge.net/

Tips and Tricks
---------------

###Cyrillic index

####Working solution
```bash
texindy -L russian -C cp1251 index.idx
```

####Dealing with unicode
UTF-8 has problems:
http://en.wikibooks.org/wiki/LaTeX/Indexing#International_indices

We have to create utf8.xdy file. At first, locate the `tex/inputenc/` folder and
go there
```bash
cd `locate tex/inputenc | head -n 1`
```

Then encode, for example, `latin2.xdy` to UTF-8
```bash
iconv -f cp1251 -t utf8 cp1251.xdy | sudo tee utf8.xdy > /dev/null
```

Go back to the folder with `index.idx`
```bash
cd -
```

And rerun indexing using UTF-8. Should work.
```bash
texindy -L russian -C utf8 index.idx
```

####Editing VIM configuration file to run `texindy` instead of `mkindex`

Just make new line
```let g:Tex_MakeIndexFlavor = 'texindy -L russian -C utf8 $*.idx'```
to your `.vimrc`
```bash
echo let g:Tex_MakeIndexFlavor = 'texindy -L russian -C utf8 $*.idx' >> ~/.vimrc
```
