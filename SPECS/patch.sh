#!/bin/sh

ORIGSPEC="telegram-desktop.spec"
PATCHEDSPEC="telegram-desktop-patched.spec"

rm "$PATCHEDSPEC"
cp "$ORIGSPEC" "$PATCHEDSPEC"

sed -i 's/Name: telegram-desktop/Name: telegram-desktop-patched/g' $PATCHEDSPEC
sed -i 's/a new era of messaging/a new, dark era of messaging/g' $PATCHEDSPEC

sed -i 's/telegram.desktop/telegram-desktop-patched.desktop/g/' $PATCHEDSPEC

sed -i '/Patch1: fix_cmake.patch/a\
Patch2: about.diff\
Patch3: messageradius_3px.diff\
Patch4: maxmessagewidth_600px.diff\
Patch5: emojipanel_1920_1080.diff' $PATCHEDSPEC

sed -i '/patch -p1 -i %{PATCH1}/a\
patch -p1 -i %{PATCH2}\
#patch -p1 -i %{PATCH3}\
patch -p1 -i %{PATCH4}\
patch -p1 -i %{PATCH5}' $PATCHEDSPEC

sed -i /%changelog/Q $PATCHEDSPEC
