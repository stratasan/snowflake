product:
	cp constants_product_track.js constants.js
	yarn export
	mv out static/product
	sed -i'' 's/\/_next/\.\/_next/g' static/product/index.html

engineering:
	cp constants_engineering_track.js constants.js
	yarn export
	mv out static/engineering
	sed -i'' 's/\/_next/\.\/_next/g' static/engineering/index.html

.PHONY : build
build: clean engineering product

.PHONY : deploy
deploy: build
	aws s3 sync --acl public-read static s3://oneup.stratasan.com/


.PHONY : clean
clean:
	rm -rf static/engineering static/product
