#!/bin/bash

tests:put input <<EOF
# @description FUNCTION DESCRIPTION
#
# @deprecated this one is ignored
# @deprecated REASON
#  ignored line
func() {

EOF

tests:put expected <<EOF
## Index

* [func](#func)

## func

**DEPRECATED** REASON

FUNCTION DESCRIPTION
EOF

assert
