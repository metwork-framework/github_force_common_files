all: ../local/bin/metwork_repos.py ../local/bin/metwork_topics.py ../local/bin/_force.sh ../local/bin/force.sh ../local/bin/force_experimental.sh ../local/bin/force_one_repo.sh ../local/bin/metwork_valid_merge_logic_status.py ../local/bin/gh-md-toc ../local/bin/improve_readme.sh

../local/bin/metwork_repos.py:
	mkdir -p ../local/bin
	wget -O $@ "https://raw.githubusercontent.com/metwork-framework/resources/master/scripts/metwork_repos.py"
	chmod +x $@

../local/bin/gh-md-toc: gh-md-toc
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@

../local/bin/improve_readme.sh: improve_readme.sh
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@

../local/bin/metwork_valid_merge_logic_status.py:
	mkdir -p ../local/bin
	wget -O $@ "https://raw.githubusercontent.com/metwork-framework/resources/master/scripts/metwork_valid_merge_logic_status.py"
	chmod +x $@

../local/bin/metwork_topics.py:
	mkdir -p ../local/bin
	wget -O $@ "https://raw.githubusercontent.com/metwork-framework/resources/master/scripts/metwork_topics.py"
	chmod +x $@

../local/bin/_force.sh: _force.sh
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@

../local/bin/force.sh: force.sh
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@

../local/bin/force_experimental.sh: force_experimental.sh
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@

../local/bin/force_one_repo.sh: force_one_repo.sh
	mkdir -p ../local/bin
	cp -f $< $@
	chmod +x $@
