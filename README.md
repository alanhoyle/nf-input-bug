# nf-input-bug

When there are erroneous spaces in an input manifest parsed by .splitCsv(), the file existence detection does not work properly, and the working directory 

INSTRUCTIONS TO REPRODUCE:

1. clone this repo into /tmp/nf-input-bug
2. `cd ~`
3. `nextflow run /tmp/nf-input-bug/test.nf --input /tmp/nf-input-bug/manifest.txt`

Observe the output channel:

```
$ cd /home/username
$ nextflow run /tmp/nf-input-bug/test.nf  --input /tmp/nf-input-bug/manifest.txt
N E X T F L O W  ~  version 19.10.0
Launching `/tmp/nf-input-bug/test.nf` [chaotic_carlsson] - revision: 88a147f001
[BLAH0, /tmp/nf-input-bug/file-that-exists.txt]
[BLAH1, /home/username/ /tmp/nf-input-bug/file-that-exists.txt]
```


