#!/bin/bash

ICON_INFO_FILE=iconInfo

rm -r out/qarbonIcons
mkdir -p out/qarbonIcons
cp -r index.theme out/qarbonIcons/index.theme
cp -r 16 out/qarbonIcons/16x16
cp -r 48 out/qarbonIcons/48x48
cp -r symbolic out/qarbonIcons/symbolic

for folder in out/qarbonIcons/*/; do
	if [ "${folder}" = 'out/qarbonIcons/symbolic/' ]; then continue; fi
	iconFileName=""
	iconFolderName=""
	while read line; do
		if [ "${line}" = '' ]; then continue
		elif [ "${line:0:1}" = '/' ]; then
			if [ "${line:0:2}" = '//' ]; then
				iconFolderName=${line:2}
			else
				iconFileName=${line:1}
			fi
		else
			ln -s ${iconFileName} ${folder}${iconFolderName}/${line}
		fi
	done < $ICON_INFO_FILE
done

