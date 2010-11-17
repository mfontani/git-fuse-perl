all:	start-fuse

start-fuse:
	@echo unpacking repos
	@rm -rf test-repos/
	@tar xf test-repos.tar
	@echo mounting test/
	@rm test/.keep && cd test-repos/ && perl ../git-fuse ../test/ && cd ..

stop-fuse:
	fusermount -u test/
	touch test/.keep
	rm -rf test-repos/

pushall:
	for r in $$(git remote); do git push --all $$r; done

scp:
	scp git-fuse darkpan:/var/www/files/git-fuse.txt
