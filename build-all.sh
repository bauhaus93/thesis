#!/bin/sh

make clean

make expose

make thesis
make glossary
make bibliography
make -B thesis
make -B thesis

make clean
