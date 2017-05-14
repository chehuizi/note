# Table of Contents
* <a href="#what-is-it">What is it?</a>
* <a href="#architecture">Architecture</a>
* <a href="#network">Network</a>
* <a href="#dns">DNS</a>
* <a href="#cdn">CDN</a>
* <a href="#lb">LB</a>
  * <a href="#负载均衡原理">负载均衡原理</a>
  * <a href="#常用组件">常用组件</a>
    * <a href="#Nginx">Nginx</a>
* <a href="#webapp">WebApp</a>
* <a href="#soa">SOA</a>
  * <a href="#开源rpc框架">开源RPC框架</a>
    * <a href="#dubbo">dubbo</a>
* <a href="#mq">MQ</a>
  * <a href="#应用场景">应用场景</a>
  * <a href="#开源消息中间件">开源消息中间件</a>
    * <a href="#kafka">kafka</a>
* <a href="#cache">Cache</a>
* <a href="#storage">Storage</a>
* <a href="#search">Search</a>
  * <a href="#搜索引擎原理">搜索引擎原理</a>
  * <a href="#开源工具">开源工具</a>
    * <a href="#lucene">lucene</a>
* <a href="#分布式数据管理">分布式数据管理</a>
  * <a href="#zookeeper">zookeeper</a>
    
* <a href="#appendix">Appendix</a>
  * <a href="#sql">SQL</a>
    * <a href="#join">join</a>
    * <a href="#inner-join">inner join</a>
    * <a href="#left-join">left join</a>
    * <a href="#right-join">right join</a>
    * <a href="#full-join">full join</a>
    
# What is it?


# Architecture


# Network


# DNS


# CDN


# LB
## 负载均衡原理
## 常用组件
### Nginx

# WebApp


# SOA
![客户端与服务端建立连接基本原理](https://github.com/chehuizi/demo/blob/master/img/rpc_1.gif)
![客户端与服务端建立连接流程](https://github.com/chehuizi/demo/blob/master/img/rpc_2.gif)
## RPC框架
* 序列化协议
* 远程通信报文协议
* 协议报文处理实现
### dubbo

## 服务治理

# MQ
## 应用场景
**异步**  
  关键主流程无需等待下游非关键流程的返回才能进行同步操作。  
**解耦**  
  把关键主流程和非关键流程解开，从而让整个系统更高效、更可靠。  

## 关键特性
**消息顺序**  
消息的顺序无法完全保证，如果要绝对保证消息的顺序，那么就会丢失消息处理的吞吐量。  
**常用做法**  
1.采用局部有序的消息中间件：MetaQ。顺序的弊端是导致了单点，无序就不存在单点。  
2.不关心消息的顺序：业务上设计正向状态机，只能按照正向状态机的方向进行变更。这是推荐做法，业务上做到**幂等性**。  
**消息重复**  
消息没有反馈（丢失），这时候最好的选择是重发消息。   
**常用做法**  
1.逻辑去重：在mysql中创建一张去重表，msgId唯一性。  
2.业务规避：利用**等幂性**去设计业务逻辑。    
**事务消息**  
保证数据库操作和消息发送是一致的。  

## 消息服务的模型
### 点对点或队列模型
生产者发送一条消息到Queue，一个queue可以有很多消费者，但是一个消息只能被一个消费者接收，当没有消费者可用时，这个消息会被保存直到有一个可用的消费者，所以Queue实现了一个可靠的负载均衡。  
如果只有一个消费者，可以保证Queue是被有序消费的。  
消息不能被重复消费。  
### 发布者/订阅者模型(publish/subscribe)
发布者发送到topic的消息，只有订阅了topic的订阅者才会收到消息。topic实现了发布和订阅，当你发布一个消息，所有订阅这个topic的服务都能得到这个消息，所以从1到N个订阅者都能得到这个消息的拷贝。  
消息可以被重复消费。  

## 开源消息中间件
### kafka
![kafka core apis](https://github.com/chehuizi/demo/blob/master/img/kafka-apis.png)
### ActiveMQ
### RabbitMQ

# Cache


# Storage


# Search
## 搜索引擎原理
## 开源工具
### lucene
## ELK
### Elasticsearch
index  
type  
id  
### Logstash
### Kibana


# 分布式数据管理
## zookeeper

------

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

# http
无连接  
无状态

------

# Appendix
## SQL
### join
### inner join
### left join
### right join
### full join

## 锁
### 悲观锁
正如其名，它指的是对数据被外界（包括本系统当前的其他事务，以及来自外部系统的事务处理）修改持保守态度，因此，在整个数据处理过程中，将数据处于锁定 状态。悲观锁的实现，往往依靠数据库提供的锁机制（也只有数据库层提供的锁机制才能真正保证数据访问的排他性，否则，即使在本系统中实现了加锁机制，也无法保证外部系统不会修改数据）。比如在使用select字句的时候加上for update，那么直到字句的事务结束为止，任何应用都无修改select出来的记录。  
### 乐观锁
大多是基于数据版本（Version）记录机制实现[jdk lock CAS]  
何谓数据版本？即为数据增加一个版本标识，在基于数据库表的版本解决方案中，一般是通过为数据库表增加一个“version”字段来实现。读取出数据时，将此版本号一同读出，之后更新时，对此版本号加一。此时，将提交数据的版本数据与数据库表对应记录的当前版本信息进行比对，如果提交的数据版本号大于数据库表当前版本号，则予以更新，否则认为是过期数据。  

## CAP
C: Consistency 一致性  
A: Availability 可用性  
P: Partition Tolerance分区容错性  
CAP理论的核心是：一个分布式系统不可能同时很好的满足一致性，可用性和分区容错性这三个需求，最多只能同时较好的满足两个。

## Reactor模型
## Paxos协议
## Zab协议

------

# Case
## 如何生成唯一ID
## 秒杀系统如何设计
