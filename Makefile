galaxy.yml:
	cp ./vars/galaxy.yml .

artifact: galaxy.yml
	ansible-galaxy collection build -f

clean:
	rm -rf galaxy.yml *.tar.gz
	