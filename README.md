# crontabManage
crontab定时管理
##功能
实现web管理crontab。web管理界面没有提供，自行解决
##思路
crontab中运行定时任务cron.sh，每一分钟检查cron文件是否存在,<br/>
如果存在cron文件，则将crontab中的所有内容存储到cronbak文件中，并将cron中的文件也追加到cronbak中<br/>
然后cronbak中的文件加载到crontab中，最后将cron文件移动到history文件夹中。<br/>
##安装
1.拷贝全部文件到服务器目录下<br/>
2.crontab -e 添加主任务到crontab中 */1 * * * *  {当前路径}/cron.sh<br/>
3.将要修改的定时任务存储到cron文件中<br/>
4.等待执行<br/>
注意：.sh文件要有可执行权限
