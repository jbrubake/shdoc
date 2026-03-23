#!/bin/bash
# @file test/testcases/@requires.test.sh
# @author Jeremy Brubaker <jbrubke@orionarts.io>
# @brief Test cases for @requires keyword.
# @requires foo
# @description
#   Test these @requires comportements:
#   - file-level @requires
#   - simple one line message.
#   - one line message with indentation and trailing spaces.
#   - indented two lines message.
#   - three lines message with trailing spaces.
#   - appears between @stdin and @stderr sections.

tests:put input <<EOF
# @name shdoc @requires tests
# @description Test @requires functionality.
# @requires foo
#  bar

# @description test_requires dummy function.
# @requires simple one line message.
# @requires         one line message with indentation and trailing spaces.    
    #   @requires   indented two lines message
    #         to test how indentation is trimmed.
    #   Message without sufficient indentation (ignored).
# @requires three line message    
#     with trailing spaces    
#  and random indentation.  
test_requires() {
}
EOF

tests:put expected <<EOF
# shdoc @requires tests

## Overview

Test @requires functionality.

## Requires

* foo
  bar

## Index

* [test_requires](#test_requires)

## test_requires

test_requires dummy function.

### Requires

* simple one line message.
* one line message with indentation and trailing spaces.
* indented two lines message
  to test how indentation is trimmed.
* three line message
  with trailing spaces
  and random indentation.

EOF

assert
