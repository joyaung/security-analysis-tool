#/bin/bash

project=$1
config_file=$2


cp -r ../configs ../notebooks ../dashboards ./dabs_template/template/tmp

databricks bundle init ./dabs_template --config-file $config_file
rm -rf $config_file
cd $project
databricks bundle deploy --force-lock
cd ../
rm -rf $project
rm -rf ./dabs_template/template/tmp/configs ./dabs_template/template/tmp/dashboards ./dabs_template/template/tmp/notebooks

