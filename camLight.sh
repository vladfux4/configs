#!/bin/bash
light=$(~/.vim/camLight)
limit=10

if ((light > limit)); then
    echo light
else
    echo dark
fi
