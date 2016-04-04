<html>
<head>
<meta charset="utf-8">
<title>设计模式</title>
</head>
<body>
<div id="wmd-preview" class="wmd-preview"><div class="md-section-divider"></div><div class="md-section-divider"></div><h1 data-anchor-id="cxtu" id="设计模式">设计模式</h1><p data-anchor-id="0fsx">单例 工厂 迭代器 装饰者 观察者</p><hr><div class="md-section-divider"></div><h2 data-anchor-id="shn2" id="单例">单例</h2><ul data-anchor-id="vmem">
<li><p>构造</p>

<ol><li>构造函数修饰符必须为私有，不可在外部实例化</li>
<li>单例类必须存在一个静态变量，用以指向单例类的唯一实例</li>
<li>必须存在一个修饰符为公有且为静态的函数，能在外部直接静态使用，函数返回单例类的唯一实例，若单例类无实例则此函数调动构造函数再返回实例</li></ol></li>
<li><p>使用</p>

<ol><li>当类只能有一个实例而且客户可以从一个众所周知的访问点访问它时</li>
<li>当这个唯一实例应该是通过子类化可扩展的。并且用户应该无需更改代码就能使用一个扩展的实例时</li></ol></li>
</ul><div class="md-section-divider"></div><h2 data-anchor-id="tgnh" id="工厂">工厂</h2><ul data-anchor-id="it8r">
<li><p>构造</p>

<ol><li>构造函数修饰符必须为私有，不可在外部实例化</li>
<li>工厂类必须存在一个静态变量，用以保存所需的工具类对象</li>
<li>除构造函数外全部为共有的静态函数，无需实例化类而直接静态调用</li></ol></li>
<li><p>使用</p>

<ol><li>当类只能有一个实例而且客户可以从一个众所周知的访问点访问它时</li>
<li>当这个唯一实例应该是通过子类化可扩展的。并且用户应该无需更改代码就能使用一个扩展的实例时</li></ol></li>
</ul><div class="md-section-divider"></div><h2 data-anchor-id="auga" id="迭代器">迭代器</h2><p data-anchor-id="15s4">好吧，说实话，我真的没看懂，完全没概念</p><div class="md-section-divider"></div><h2 data-anchor-id="mzcm" id="装饰者">装饰者</h2><ul data-anchor-id="mkjr">
<li>构造 <br>
<ol><li>装饰者 与 被装饰者 必须是继承于同一父类</li>
<li>将装饰者 与 组件 组合时，就是在加入新的行为，但所得的新行为不是继承自父类，而是由组合对象得来</li></ol></li>
<li>使用 <br>
需要在不修改基础代码的情况下，利用 继承 与 组合 产生新的功能</li>
</ul><div class="md-section-divider"></div><h2 data-anchor-id="5356" id="观察者">观察者</h2><ul data-anchor-id="26w0">
<li>构造 <br>
这个说不清啊</li>
<li>使用 <br>
<ol><li>当许多对象 需要从 一个内部信息动态变换的对象获取信息时，前者为观察者，后者为被观察者，当被观察者发生改变的时候，观察者就会观察到这样的变化，并且做出相应的响应。并且观察者具有“注册-通知-撤销注册”的功能 </li></ol></li>
</ul><div class="md-section-divider"></div><h2 data-anchor-id="da7f" id="附加博客ｒｂａｃ数据库">附加（博客ｒｂａｃ数据库）</h2><ul data-anchor-id="raos">
<li>按照网上的模板写了一个数据库，大致懂了一点它的权限分配思想，但不太了解这个数据库怎么结合ｐｈｐ使用</li>
</ul></div>
</body>
</html>
