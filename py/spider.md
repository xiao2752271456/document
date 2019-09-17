# REF

https://piaosanlang.gitbooks.io/spiders/content/01day/section1.9.html

# WEB

## HTTP

[HTTP_w3c](https://www.w3cschool.cn/http/a96bxfml.html)

### HTTP 原理

HTTP通信分成两部分:客户端请求消息, 服务器响应消息.

HTTP协议工作于客户端-服务端架构为上。浏览器作为HTTP客户端通过URL向HTTP服务端即WEB服务器发送所有请求。Web服务器根据接收到的请求后，向客户端发送响应信息。

![](pic_spider/190815-002959.png)

HTTP协议定义Web客户端如何从Web服务器请求Web页面，以及服务器如何把Web页面传送给客户端。HTTP协议采用了请求/响应模型。客户端向服务器发送一个请求报文，请求报文包含请求的方法、URL、协议版本、请求头部和请求数据。服务器以一个状态行作为响应，响应的内容包括协议的版本、成功或者错误代码、服务器信息、响应头部和响应数据。

1.	建立TCP连接

    用户在浏览器输入URL并回车.浏览器，与Web服务器的HTTP端口（默认为80）建立一个TCP套接字连接.

2.	发送HTTP请求

    通过TCP套接字，客户端向Web服务器发送一个文本的Request请求报文。

3.	服务器接受请求并返回HTTP响应
    
    Web服务器解析请求，定位请求资源。服务器将资源复本写到TCP套接字，由客户端读取。

4.	释放连接TCP连接
    
    若connection 模式为close，则服务器主动关闭TCP连接，客户端被动关闭连接，释放TCP连接;若connection 模式为keepalive，则该连接会保持一段时间，在该时间内可以继续接收请求;

5.	客户端浏览器解析HTML内容

    客户端浏览器首先解析状态行，查看表明请求是否成功的状态代码。然后解析每一个响应头，响应头告知以下为若干字节的HTML文档和文档的字符集。客户端浏览器读取响应数据HTML，根据HTML的语法对其进行格式化，并在浏览器窗口中显示。

    浏览器分析HTML, 发现其中引用了其他文件, 比如Images文件, CSS文件, JS文件, 浏览器就会自动再次发送Request去获取对应的文件并解析.

例如：在浏览器地址栏键入URL，按下回车之后会经历以下流程：


1.	浏览器向 DNS 服务器请求解析该 URL 中的域名所对应的 IP 地址;
2.	解析出 IP 地址后，根据该 IP 地址和默认端口 80，和服务器建立TCP连接;
3.	浏览器发出读取文件(URL 中域名后面部分对应的文件)的HTTP 请求，该请求报文作为 TCP 三次握手的第三个报文的数据发送给服务器;
4.	服务器对浏览器请求作出响应，并把对应的 html 文本发送给浏览器;
5.	释放 TCP连接;
6.	浏览器将该 html 文本并显示内容; 　　

### GET & POST 区别

ref: https://www.cnblogs.com/logsharing/p/8448446.html

1.	GET在浏览器回退时是无害的，而POST会再次提交请求。
2.	GET产生的URL地址可以被Bookmark，而POST不可以。
3.	GET请求会被浏览器主动cache，而POST不会，除非手动设置。
4.	GET请求只能进行url编码，而POST支持多种编码方式。
5.	GET请求参数会被完整保留在浏览器历史记录里，而POST中的参数不会被保留。
6.	GET请求在URL中传送的参数是有长度限制的，而POST么有。
7.	对参数的数据类型，GET只接受ASCII字符，而POST没有限制。
8.	GET比POST更不安全，因为参数直接暴露在URL上，所以不能用来传递敏感信息。
9.	GET参数通过URL传递，POST放在Request body中。

在我大万维网世界中，TCP就像汽车，我们用TCP来运输数据，它很可靠，从来不会发生丢件少件的现象。但是如果路上跑的全是看起来一模一样的汽车，那这个世界看起来是一团混乱，送急件的汽车可能被前面满载货物的汽车拦堵在路上，整个交通系统一定会瘫痪。为了避免这种情况发生，交通规则HTTP诞生了。HTTP给汽车运输设定了好几个服务类别，有GET, POST, PUT, DELETE等等，HTTP规定，当执行GET请求的时候，要给汽车贴上GET的标签（设置method为GET），而且要求把传送的数据放在车顶上（url中）以方便记录。如果是POST请求，就要在车上贴上POST的标签，并把货物放在车厢里。当然，你也可以在GET的时候往车厢内偷偷藏点货物，但是这是很不光彩；也可以在POST的时候在车顶上也放一些数据，让人觉得傻乎乎的。HTTP只是个行为准则，而TCP才是GET和POST怎么实现的基本。

在我大万维网世界中，还有另一个重要的角色：运输公司。不同的浏览器（发起http请求）和服务器（接受http请求）就是不同的运输公司。 虽然理论上，你可以在车顶上无限的堆货物（url中无限加参数）。但是运输公司可不傻，装货和卸货也是有很大成本的，他们会限制单次运输量来控制风险，数据量太大对浏览器和服务器都是很大负担。业界不成文的规定是，（大多数）浏览器通常都会限制url长度在2K个字节，而（大多数）服务器最多处理64K大小的url。超过的部分，恕不处理。如果你用GET服务，在request body偷偷藏了数据，不同服务器的处理方式也是不同的，有些服务器会帮你卸货，读出数据，有些服务器直接忽略，所以，虽然GET可以带request body，也不能保证一定能被接收到哦。

GET和POST还有一个重大区别:

简单的说：
GET产生一个TCP数据包；POST产生两个TCP数据包。

长的说：
对于GET方式的请求，浏览器会把http header和data一并发送出去，服务器响应200（返回数据）；
而对于POST，浏览器先发送header，服务器响应100 continue，浏览器再发送data，服务器响应200 ok（返回数据）。

也就是说，GET只需要汽车跑一趟就把货送到了，而POST得跑两趟，第一趟，先去和服务器打个招呼“嗨，我等下要送一批货来，你们打开门迎接我”，然后再回头把货送过去。

因为POST需要两步，时间上消耗的要多一点，看起来GET比POST更有效。因此Yahoo团队有推荐用GET替换POST来优化网站性能。但这是一个坑！跳入需谨慎。为什么？

1. GET与POST都有自己的语义，不能随便混用。
2. 据研究，在网络环境好的情况下，发一次包的时间和发两次包的时间差别基本可以无视。而在网络环境差的情况下，两次包的TCP在验证数据包完整性上，有非常大的优点。
3. 并不是所有浏览器都会在POST中发送两次包，Firefox就只发送一次。


## JQUERY

[jQuery 教程](https://www.runoob.com/jquery/jquery-tutorial.html)

[jQuery 选择器](https://www.runoob.com/jquery/jquery-ref-selectors.html)

# requests

[用户指南](http://cn.python-requests.org/zh_CN/latest/#id3)

[API](http://cn.python-requests.org/zh_CN/latest/index.html#api)

## get 请求

### 二进制数据 content

- download `.ico`

    ```py
    import requests

    r = requests.get("https://github.com/favicon.icon")

    with open('favicon.ico','wb') as f:
        f.write(r.content)
    ```

## post 请求

https://blog.csdn.net/qiye_/article/details/80380955


# pyquery

> 用 `requests` 请求源文件, 用 `pyquery` 解析内容

[document](https://pythonhosted.org/pyquery/)

ref:

https://segmentfault.com/a/1190000005182997

https://www.jianshu.com/p/770c0cdef481

## 选择器

[jQuery 选择器](https://www.runoob.com/jquery/jquery-ref-selectors.html)

- 多条件筛选

    ```py
    # method1
    py('condition1')('condition2')

    # method2
    py('condition1 > condition2')
    # 这种方式 不能断层, 即便中间的选择器只有一个
    ```