# Router-Swift
一个轻量级以及可扩展的界面Route方案，用Swift编写。
## 导入
导入十分简单，将Router.swift文件拖入项目即可
#### 默认URL扩展支持（可选)
导入RoutableURL.swift,RouteNodeMapper.swift，这俩个文件主要对URL默认扩展了Router支持，协议为Router://class?launchParams，具体查看文件源码
## 使用
Router使用十分简单,在默认扩展了URL支持的情况下打开对应的页面只需要一句话
<pre><code>if let url = URL.init(string: "Router://test?a=123&b=321"）{
    Router.default.open(url)
}</code></pre>
### 添加自定义对象的Router支持
Router-Swift支持对自定义对象的扩展，比如项目有个对象User,我们希望Router可以直接对这个对象识别并且打开UserInfo界面
