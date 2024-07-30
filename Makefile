include config.mk

all: txt html links

txt: $(PAGES:=.txt)
html: $(PAGES:=.html)
ps: $(PAGES:=.ps)
pdf: $(PAGES:=.pdf)

.SUFFIXES: .7 .html .txt .ps .pdf

.7.txt:
	mandoc -K utf-8 -T utf8 $< | ./colb.c > $@
.7.html:
	mandoc -K utf-8 -O man=./%N.html -T html $< > $@
.7.ps:
	mandoc -T ps $< > $@
.7.pdf:
	mandoc -T ps $< > $@

clean:
	rm -f *.html

links:
	ln -sf $(shell pwd)/libreboot.html index.html
