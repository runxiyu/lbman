include config.mk

all: $(PAGES:=.txt) $(PAGES:=.html) links

.SUFFIXES: .7 .html .txt

.7.html:
	mandoc -K utf-8 -O man=./%N.html,style=./style.css -T html $< > $@

.7.txt:
	mandoc -K utf-8 -T utf8 $< | col -b > $@

clean:
	rm -f *.html

links:
	ln -sf $(shell pwd)/libreboot.html index.html
