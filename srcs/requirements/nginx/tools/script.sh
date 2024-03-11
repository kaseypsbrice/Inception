#!/bin/sh

if [ ! -f "kbrice.42.fr.key" ] || [ ! -f "kbrice.42.fr.crt" ]; then
	echo "Generating self-signed certificates..."
	openssl req -x509 -newkey rsa:4096 -keyout kbrice.42.fr.key -out kbrice.42.fr.crt -days 365 -nodes \
		-subj "/C=AU/ST=SA/L=Adelaide/O=42Adelaide/CN=kbrice.42.fr"
	if [ $? -ne 0 ]; then
		echo "Failed to generate certificates."
	fi
	echo "Successfully generated certificates."
fi
