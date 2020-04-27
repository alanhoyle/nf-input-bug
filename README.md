# nf-input-bug

When there are erroneous spaces in an input manifest parsed by .splitCsv(), the file existence detection does not work properly, and the current working directory is appended to the beginning of the entry in the input channel.  

INSTRUCTIONS TO REPRODUCE:

1. clone this repo into `/tmp/nf-input-bug`:
    `$ git clone git@github.com:alanhoyle/nf-input-bug.git /tmp/nf-input-bug`
2.  change to literally any directory (I use $HOME in the examples below...)
3. `nextflow run /tmp/nf-input-bug/test.nf --input /tmp/nf-input-bug/manifest.txt`

Observe the output channel:

```
$ cd $HOME
$ nextflow run /tmp/nf-input-bug/test.nf  --input /tmp/nf-input-bug/manifest.txt
N E X T F L O W  ~  version 19.10.0
Launching `/tmp/nf-input-bug/test.nf` [chaotic_carlsson] - revision: 88a147f001
[BLAH0, /tmp/nf-input-bug/file-that-exists.txt]
[BLAH1, /home/username/ /tmp/nf-input-bug/file-that-exists.txt]
[BLAH2, /home/username/ /tmp/nf-input-bug/file-that-is-missing.txt]
[BLAH3, /home/username/more bad input /tmp/nf-input-bug/file-that-is-missing.txt]

```

Also tested on the latest release on macOS:

```
$ nextflow run /tmp/nf-input-bug/test.nf --input /tmp/nf-input-bug/manifest.txt
N E X T F L O W  ~  version 20.01.0
Launching `/tmp/nf-input-bug/test.nf` [stupefied_fermat] - revision: 88a147f001
[BLAH0, /tmp/nf-input-bug/file-that-exists.txt]
[BLAH1, /private/tmp/nf-input-bug/ /tmp/nf-input-bug/file-that-exists.txt]
[BLAH2, /private/tmp/nf-input-bug/ /tmp/nf-input-bug/file-that-is-missing.txt]
[BLAH3, /private/tmp/nf-input-bug/more bad input /tmp/nf-input-bug/file-that-is-missing.txt]

```
