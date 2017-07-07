#!/bin/sh -ex

FLY_CLI=`find ./fly-cli -name "*linux-amd64*"`
chmod +x $FLY_CLI

$FLY_CLI -t cc login -u $CONCOURSE_USERNAME -p $CONCOURSE_PASSWD -n $BUILD_TEAM_NAME
$FLY_CLI -t cc set-pipeline -p $UPGRADE_PIPELINE_NAME -c concourse-vsphere/pipelines/upgrade-tile/pipeline.yml
$FLY_CLI -t cc unpause-pipeline -p $UPGRADE_PIPELINE_NAME
$FLY_CLI -t cc pause-pipeline -p $BUILD_PIPELINE_NAME