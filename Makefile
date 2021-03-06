unit-test:
	clojure -A:test -e integration

integration-test:
	clojure -A:test -i integration

lint:
	clojure -A:kibit
	clojure -A:eastwood

uberjar:
	clojure -A:uberjar

check-urls:
	clojure -m fast-url-check.core $(file-name)

benchmark:
	clojure -A:dev -m fast-url-check.benchmark $(file-name)

build-graal-url-checker:
	docker build --target builder -f Dockerfile -t fast-url-checker .
	docker rm build || true
	docker create --name build fast-url-checker
	docker cp build:/usr/src/app/url-checker url-checker
	docker cp build:/usr/src/app/libsunec.so libsunec.so
