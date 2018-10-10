#!/bin/bash

texcount -incbib -inc thesis.tex | \
    grep -A3 "total: thesis.tex" | \
    tail -n3 | \
    awk -F':' '{sum+=$2} END {print sum}'
