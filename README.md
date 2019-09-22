## What is this
Get universal character names from font file

## Get universal character names

**Create ttx file**
pip install fonttools
ttx -t cmap <font file>

**Install gnu-sed** (if you don`t use gnu sed)
brew install gnu-sed

**Run script**
./getUCN.sh <ttx file>
