#!/bin/sh

make clean
make thesis
make glossary
make bibliography
make -B thesis
make -B thesis
make clean
