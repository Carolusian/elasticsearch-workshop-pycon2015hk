#!/bin/bash

cd "$(dirname "$0")"

# install dependencies
pip install --no-index --find-links=wheelhouse --pre --requirement requirements.txt
# remove DB
rm -f db.sqlite3
# remove index
curl -X DELETE localhost:9200/stack
# create DB
python manage.py migrate
# load DB
python manage.py load_dump coffee
