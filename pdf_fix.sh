#!/bin/bash

# Remove all metadata properties from all PDFs in this folder
exiftool -All="" -overwrite_original *

# Relinearize to properly remove original metadata
for f in *.pdf; do
	 qpdf --linearize --replace-input "$f";
done

# Add in new metadata
exiftool -Author="Thomas Robinson" -Title="Assignment from SolCol.ThomasR.me" -Creator="SolCol.ThomasR.me" -overwrite_original *

# Remove QPDF original files (it probably did an alright job)
rm *qpdf-orig
