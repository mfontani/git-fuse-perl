all:	test start-fuse

test:
	prove -vr tests/

start-fuse:
	@echo unpacking repos
	@rm -rf test-repos/
	@tar xf test-repos.tar
	@echo mounting test/
	@rm mountpoint/.keep && cd test-repos/ && script -t -c 'perl ../git-fuse ../mountpoint/' ../script-$$(date +%F-%T) && cd ..

stop-fuse:
	fusermount -u mountpoint/
	touch mountpoint/.keep
	rm -rf test-repos/

unpack:
	@rm -rf test-repos/
	@tar xf test-repos.tar

pushall:
	for r in $$(git remote); do git push --all $$r; done

scp:
	scp git-fuse darkpan:/var/www/files/git-fuse.txt
