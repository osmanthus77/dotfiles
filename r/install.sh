#!/bin/bash

BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

hash Rscript 2>/dev/null || {
    brew install r
}

cd ${BASE_DIR}

Rscript packages.R

cat <<EOF > .Rprofile
# set R mirror
local({
    # Bioconductor mirror
    options("BioC_mirror"="https://mirrors.ustc.edu.cn/bioc")

    # CRAN mirror
    r <- getOption("repos")
    r["CRAN"] <- "https://mirrors.ustc.edu.cn/CRAN"
    options(repos=r)
})

EOF

Rscript extrafont.R

rm .Rprofile
