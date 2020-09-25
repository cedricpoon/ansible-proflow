galaxy.yml:
	cp ./vars/galaxy.src.yml ./galaxy.yml

build: clean galaxy.yml
	ansible-galaxy collection build -f

install: build
	ansible-galaxy collection install *.tar.gz --force

clean:
	rm -rf galaxy.yml *.tar.gz

lint:
	ansible-lint apply.yml