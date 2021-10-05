#!/bin/bash
grep -ER "dumbpassword" | while read aline; do echo "${aline%%\:*}" | while read afile; do realpath $afile; done; done | while read afile; do sed -i s/dumbpassword/\[a_password\]/ $afile; done
