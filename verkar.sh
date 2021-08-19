jotta-cli.exe ls -l archive/Felles/Video/alle > jotta.txt

for f in ./*.mts; do md5sum $f | perl -ple 's/ .*//' | if ! grep -q -f - jotta.txt; then echo $f; fi; done

for f in ./*.mts; do md5sum $f | perl -ple 's/ .*//' | if ! grep -q -f - jotta.txt; then jotta-cli.exe archive $f --remote=Archive/Felles/Video/alle/$f --nogui; fi; done


find . -type f -exec md5sum {} >> eth.txt \;
perl -ple 's/ .*//' eth.txt > eth2.txt
for f in $(cat eth2.txt); do if ! grep -q $f md5litteratur.txt; then grep $f eth.txt; fi;done
