galaxy.yml:
	cp ./vars/galaxy.src.yml ./galaxy.yml

build: clean galaxy.yml
	ansible-galaxy collection build -f

clean:
	rm -rf galaxy.yml *.tar.gz

lint:
	ansible-lint