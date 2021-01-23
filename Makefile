update-slides:
	sudo gem install reveal-ck
	reveal-ck generate
	cp -rf slides/ docs/