# Java
## IO
![以字节为单位的输入流和输出流关联的框架图](https://github.com/chehuizi/demo/blob/master/img/io_stream.jpg)
![以字符为单位的输入流和输出流关联的框架图](https://github.com/chehuizi/demo/blob/master/img/io_char.jpg)
![字节和字符的输入流对应关系](https://github.com/chehuizi/demo/blob/master/img/io_in_stream_char.jpg)
![字节和字符的输出流对应关系](https://github.com/chehuizi/demo/blob/master/img/io_out_stream_char.jpg)
------
[IO学习资料](http://www.cnblogs.com/skywang12345/p/io_01.html)

## NIO
[NIO 入门](https://www.ibm.com/developerworks/cn/education/java/j-nio/)
------
![阻塞式I/O](https://github.com/chehuizi/demo/blob/master/img/bio.png)
![非阻塞式I/O](https://github.com/chehuizi/demo/blob/master/img/nio.png)
![I/O复用（Java NIO就是这种模型）](https://github.com/chehuizi/demo/blob/master/img/nio_java.png)
![异步I/O](https://github.com/chehuizi/demo/blob/master/img/aio.png)
![Reactor模式简图](https://github.com/chehuizi/demo/blob/master/img/reactor.png)

## 多线程
![多线程主要知识点](https://github.com/chehuizi/demo/blob/master/img/thread.jpg)
------
[多线程学习资料](http://www.cnblogs.com/skywang12345/p/java_threads_category.html )

## 集合
![集合工具包框架图](https://github.com/chehuizi/demo/blob/master/img/collection.jpg)
------
[集合学习资料](http://www.cnblogs.com/skywang12345/p/3323085.html)

# 常用定位问题工具
## Linux命令类
### tail
最常用的tail -f  
tail -300f shopbase.log #倒数300行并进入实时监听文件写入模式  
### grep
grep forest f.txt   #文件查找  
grep forest f.txt cpf.txt #多文件查找  
grep 'log' /home/admin -r -n #目录下查找所有符合关键字的文件  
cat f.txt | grep -i shopbase  
grep 'shopbase' /home/admin -r -n --include *.{vm,java} #指定文件后缀  
grep 'shopbase' /home/admin -r -n --exclude *.{vm,java} #反匹配  
seq 10 | grep 5 -A 3    #上匹配  
seq 10 | grep 5 -B 3    #下匹配  
seq 10 | grep 5 -C 3    #上下匹配，平时用这个就妥了  
cat f.txt | grep -c 'SHOPBASE'  
### awk
* 基础命令  
awk '{print $4,$6}' f.txt  
awk '{print NR,$0}' f.txt cpf.txt     
awk '{print FNR,$0}' f.txt cpf.txt  
awk '{print FNR,FILENAME,$0}' f.txt cpf.txt  
awk '{print FILENAME,"NR="NR,"FNR="FNR,"$"NF"="$NF}' f.txt cpf.txt  
echo 1:2:3:4 | awk -F: '{print $1,$2,$3,$4}'  
* 匹配  
awk '/ldb/ {print}' f.txt   #匹配ldb  
awk '!/ldb/ {print}' f.txt  #不匹配ldb  
awk '/ldb/ && /LISTEN/ {print}' f.txt   #匹配ldb和LISTEN  
awk '$5 ~ /ldb/ {print}' f.txt #第五列匹配ldb  
* 内建变量  
NR:NR表示从awk开始执行后，按照记录分隔符读取的数据次数，默认的记录分隔符为换行符，因此默认的就是读取的数据行数，NR可以理解为Number of Record的缩写。  
FNR:在awk处理多个输入文件的时候，在处理完第一个文件后，NR并不会从1开始，而是继续累加，因此就出现了FNR，每当处理一个新文件的时候，FNR就从1开始计数，FNR可以理解为File Number of Record。  
NF: NF表示目前的记录被分割的字段的数目，NF可以理解为Number of Field。
### find
sudo -u admin find /home/admin /tmp /usr -name \*.log(多个目录去找)  
find . -iname \*.txt(大小写都匹配)  
find . -type d(当前目录下的所有子目录)  
find /usr -type l(当前目录下所有的符号链接)  
find /usr -type l -name "z*" -ls(符号链接的详细信息 eg:inode,目录)  
find /home/admin -size +250000k(超过250000k的文件，当然+改成-就是小于了)  
find /home/admin f -perm 777 -exec ls -l {} \; (按照权限查询文件)  
find /home/admin -atime -1  1天内访问过的文件  
find /home/admin -ctime -1  1天内状态改变过的文件   
find /home/admin -mtime -1  1天内修改过的文件  
find /home/admin -amin -1  1分钟内访问过的文件  
find /home/admin -cmin -1  1分钟内状态改变过的文件      
find /home/admin -mmin -1  1分钟内修改过的文件   
### pgm
批量查询vm-shopbase满足条件的日志  
pgm -A -f vm-shopbase 'cat /home/admin/shopbase/logs/shopbase.log.2017-01-17|grep 2069861630'  
### top
top除了看一些基本信息之外，剩下的就是配合来查询vm的各种问题了  
ps -ef | grep java  
top -H -p pid  
获得线程10进制转16进制后jstack去抓看这个线程到底在干啥
### netstat
netstat -nat|awk  '{print $6}'|sort|uniq -c|sort -rn   
#查看当前连接，注意close_wait偏高的情况，比如如下  
## CPU相关工具
### top (-H)
top可以实时的观察cpu的指标状况，尤其是每个core的指标状况，可以更有效的来帮助解决问题，-H则有助于看是什么线程造成的CPU消耗，这对解决一些简单的耗CPU的问题会有很大帮助。
### jstack
jstack可以用来查看Java进程里的线程都在干什么，这通常对于应用没反应，非常慢等等场景都有不小的帮助，jstack默认只能看到Java栈，而jstack -m则可以看到线程的Java栈和native栈，但如果Java方法被编译过，则看不到（然而大部分经常访问的Java方法其实都被编译过）。  
Java栈：jstack 2815  
Java+native栈：jstack -m 2815
### 如何查线程最耗费CPU的线程信息
1. ps –ef|grep java 或者 jps 查找出java进程ID。
2. top –Hp pid 查找最耗CPU 的线程PID
3. printf “%x\n” 4867 转换16进制
4. 使用jstack查找出堆栈信息，跟踪代码分析

## 内存相关工具
### jstat
jstat -gcutil或-gc等等有助于实时看gc的状况，不过我还是比较习惯看gc log。
### jmap
在需要dump内存看看内存里都是什么的时候，jmap -dump可以帮助你；在需要强制执行fgc的时候（在CMS GC这种一定会产生碎片化的GC中，总是会找到这样的理由的），jmap -histo:live可以帮助你（显然，不要随便执行）。
### gcore
相比jmap -dump，其实我更喜欢gcore，因为感觉就是更快，不过由于某些jdk版本貌似和gcore配合的不是那么好，所以那种时候还是要用jmap -dump的。
### mat
有了内存dump后，没有分析工具的话然并卵，mat是个非常赞的工具，好用的没什么可说的。 mat的问题需要自己有大内存的机器，否则不好分析，另外就是还得把文件传来传去，所以在内部当然是用zprofiler，可以不用自己传文件，还是web版的，现在的话连机器都不用登录，更是大赞。
### jps
jps -mlvV
### jinfo
jinfo -flags 2815
### jmap
jmap -heap 2815  
jmap -dump:live,format=b,file=/tmp/heap2.bin 2815  
jmap -dump:format=b,file=/tmp/heap3.bin 2815  
### jstat
jstat -gcutil 2815 1000
