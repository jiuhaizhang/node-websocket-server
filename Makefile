#test test  merge from server 1 bs1 bs1 bs11111111 bs000 master
release:
	node tools/release.js

publish: release
	npm publish .

test:
	@echo "Running Simple Tests"
	@find -f test/simple/test-*.js | xargs -n 1 -t node

test-all: test
	@echo "Running All Tests"
	@find -f test/pummel/test-*.js | xargs -n 1 -t node

benchmark: 
	@echo "Running Benchmarks"
	@find -f benchmark/simple/*.js | xargs -n 1 -t node

doc:
	node tools/doctool/doctool.js

GJSLINT = gjslint --unix_mode --strict --nojsdoc

lint:
	@$(GJSLINT) -r lib/

.PHONY: release publish test test-all benchmark doc lint
