include config.mk

all: $(PAGES:=.html)

.SUFFIXES: .7 .html

.7.html:
	mandoc -K utf-8 -O man=./%N.html -T html $< > $@

clean:
	rm -f *.html
