#!/usr/bin/env bash

# Combines all individual PySCF and QA JSON files.
# Uses the `combine-qcjsons.py` script from 
# https://github.com/keithgroup/qcjson
# Note: will overwrite the current cumulative JSON file.
combine-qcjsons.py ./data -rop --name atom-pyscf.qa-data.posthf