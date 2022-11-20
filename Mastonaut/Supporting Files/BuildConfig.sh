#!/bin/sh

#  BuildConfig.sh
#  Mastonaut
#
#  Created by Sören Kuklau on 10.11.22.
#  Copyright © 2022 Bruno Philipe. All rights reserved.

# from https://medium.com/@hamdullahshah/generating-code-from-xcode-configurations-6fd203ec69ef

echo "//Generated file please do not edit"
printf "//\n//\n//generated by BuildConfig.sh\n"
printf "import Foundation\n\n"
echo "struct BuildConfig { "
echo "\tfileprivate init() {}"
echo ""

env |\
grep "^DEVELOPMENT_TEAM=" | \
sed -E 's/(.*)=(.*)/\tstatic let \1 = "\2"/'

env |\
grep "^MASTONAUT_BUNDLE_ID_BASE=" | \
sed -E 's/(.*)=(.*)/\tstatic let \1 = "\2"/'

env |\
grep "^CODE_SIGN_IDENTITY=" | \
sed -E 's/(.*)=(.*)/\tstatic let \1 = "\2"/'

echo "}"