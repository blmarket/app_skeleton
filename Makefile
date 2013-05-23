REPORTER = dot

test:
	@./node_modules/.bin/mocha \
	    -R $(REPORTER) --compilers coffee:coffee-script test/notest.coffee

test-all:
	@./node_modules/.bin/mocha \
	    -R $(REPORTER) --compilers coffee:coffee-script

test-cov:
	rm -rf lib-cov
	jscoverage --no-highlight lib lib-cov
	TEST_COV=1 $(MAKE) test-all REPORTER=html-cov > /tmp/coverage.html
	x-www-browser /tmp/coverage.html

clean:
	echo "do nothing yet"

.PHONY: test test-all clean
