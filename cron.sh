#!/bin/bash
# @Author: haodaquan
# @Date:   2017-01-04 17:44:45
# @Last Modified by:   haodaquan
# @Last Modified time: 2017-01-12 15:29:35

cronPath=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
cronFile="${cronPath}/cron"
cronBak="${cronPath}/cronbak"
datetime=$(date +%Y%m%d%H%M%S) 
newcronFile="${cronPath}""/history/""${datetime}"

#查看cron文件是否存在
if [ -f "${cronFile}" ]; then

	crontab -l > "${cronBak}"
	start=`grep -n 'channel start' ${cronBak} | cut -d \: -f 1`
	end=`grep -n 'channel end' ${cronBak} | cut -d \: -f 1`

	#linux
	#sed -i ${start},${end}d" "${cronBak}"
	
	#mac
	sed -i ".bak" "${start},${end}d" "${cronBak}"
	
	new=`cat "${cronFile}"`
	echo "${new}" >> "${cronBak}"
	
	mv "${cronFile}" "${newcronFile}"
	# cat "${cronBak}"
	crontab "${cronBak}"
fi