#!/bin/sh

#  inject.sh
#  WeChatPlugin
#
#  Created by huakucha on 21/12/2017.
#  Copyright © 2017 tk. All rights reserved.

#增加脚本  $PROJECT_DIR/$PRODUCT_NAME/inject.sh

app_name="iMazing"
framework_name="huakuchaaa"
app_bundle_path="/Applications/${app_name}.app/Contents/MacOS"
app_executable_path="${app_bundle_path}/${app_name}"
app_executable_backup_path="${app_executable_path}_backup"
framework_path="${app_bundle_path}/${framework_name}.framework"
# 备份二进制原始可执行文件
if [ ! -f "$app_executable_backup_path" ]
then
cp "$app_executable_path" "$app_executable_backup_path"
fi
cp -r "${BUILT_PRODUCTS_DIR}/${framework_name}.framework" ${app_bundle_path}
echo ${BUILT_PRODUCTS_DIR}/${framework_name}.framework
echo ${app_bundle_path}
./insert_dylib --all-yes "${framework_path}/${framework_name}" "$app_executable_backup_path" "$app_executable_path"

