#!/bin/bash

#要查找的内容
GREP_STRING="$1"

#要搜索的文件名前缀
GREP_PATH="/home/admin/output/logs/user/"

#文件名及文件路径，系统会校验
GREP_FILE_NAME=${GREP_PATH}"$2"


#如果没有指定要查找那台机器，将会搜索下面的列表
DEFAUL_MACHINE_LIST="machine.list"

FIXED_STRING=""

function getMachineGrep() {
        maichine_name=$1
        start_with=`echo ${maichine_name:0:1}`
        if [ ${start_with} = "#" ]; then
                echo "忽略 `echo ${maichine_name##*\#}`"
        else
                echo  ssh ${maichine_name} grep -i $FIXED_STRING  \"${GREP_STRING}\" \"${GREP_FILE_NAME}\"
                ssh ${maichine_name} grep -i $FIXED_STRING  \"${GREP_STRING}\" \"${GREP_FILE_NAME}\"
        fi
}

function getLog() {
        echo "机器列表文件是${DEFAUL_MACHINE_LIST}"
        echo "GREP_FILE_NAME=${GREP_FILE_NAME}"
        echo "GREP_STRING=${GREP_STRING}"

        if [ -f ${DEFAUL_MACHINE_LIST} ]
        then
                for machine in `cat ${DEFAUL_MACHINE_LIST} `
                do
                        echo -e "\e[1;33;40m${machine}\e[0m"
                        getMachineGrep "$machine"
                done
        else
                echo "请将需要查找的机器列表配置到${DEFAUL_MACHINE_LIST}中"
        fi
}

function printBandage(){
        echo -e "\e[1;33;40m==============================================================================\e[0m"
        echo -e "\e[1;33;40m机器列表文件=$DEFAUL_MACHINE_LIST;  GREP_STRING=$GREP_STRING;  GREP_FILE_NAME=$GREP_FILE_NAME\e[0m"
        echo -e "\e[1;33;40m==============================================================================\e[0m"
}

function main() {
        printBandage
        getLog
}

#脚本从这里开始
main

