


# pywin32

* API

    [Python for Win32 Extensions Help](http://timgolden.me.uk/pywin32-docs/contents.html)

    [win32gui](http://docs.activestate.com/activepython/3.3/pywin32/win32gui.html)

    [新编win32api大全](http://www.esk365.com/zxsc/prg/winapia/)

* Link

    [python和pywin32实现窗口查找、遍历和点击](https://www.cnblogs.com/zoro-robin/p/5591185.html)

    [python win32api win32gui win32con 窗口句柄 发送消息 常用方法 键盘输入](https://blog.csdn.net/qq_16234613/article/details/79155632)

    [根据进程句柄获得可执行文件路径的几种方法](https://blog.csdn.net/china_jeffery/article/details/78652140)

# pywinauto

[pywinauto website](http://pywinauto.github.io/)

[API](https://pywinauto.readthedocs.io/en/latest/contents.html)

[API_local](./api/pywinauto/index.html)

[swapy  演示](https://www.youtube.com/watch?v=xaMFHOq_Hls&feature=youtu.be)

教程

[零](https://blog.csdn.net/shawpan/article/details/78170067)

https://www.cnblogs.com/daly/p/4682043.html


## use

1. 确定程序入口

    主要有两种对象可以建立这种入口点——Application() , Desktop(). 

    `app = Application(backend='win32 | uia')`

    Application的作用范围是一个进程，如一般的桌面应用程序都为此类。 

    Desktop的作用范围可以跨进程。主要用于像win10的计算器这样包含多个进程的程序。这种目前比较少见。

    Win32 API (backend="win32") - a default backend for now

    > MFC, VB6, VCL, simple WinForms controls and most of the old legacy apps

    MS UI Automation (backend="uia")
        
    > WinForms, WPF, Store apps, Qt5, browsers

2. 新开进程 | 连接进程

    `app = Application().start('program path')`

    `app = Application().connect(**kwargs)`

    用 `win32gui.FindWindow( class_name )` 获取 handle, 再传入 handle


    ```py
    from pywinauto.application import Application
    # creat a application instance
    app = Application().start('notepad.exe')

    # connect to a exist application instance
    app = Application().connect('notepad.exe)
    ```

3. 指定窗口

    `dlg = app[...]`

    一般用 class_name 来指定, 用 handle不稳定.


4. 指定控件操作



# pyautogui

[API](https://pyautogui.readthedocs.io/en/latest/index.html)

[DOC](https://pyautogui.readthedocs.io/en/latest/index.html)

[教程](https://hugit.app/posts/doc-pyautogui.html)

[Doc PyAutoGUI | 绿萝间](https://muxuezi.github.io/posts/doc-pyautogui.html)

## 暂停脚本

```python
time.sleep(1.5)

pyautogui.PAUSE = 1.5	#暂停 1.5s
```

## 防故障功能

```python
pyautogui.FAILSAFE = true
```

鼠标移动到左上角, 终止程序

## 鼠标

```python
moveTo(cursor_x,cursor_y,duration)	# 移动绝对位置
moveRel(cursor_x,cursor_y,duration)	# 移动相对位置

position()	# 获取鼠标当前位置

click(cursor_x, cursor_y, button='left | right | middle')	#点击鼠标
doubleClick()	# 双击左键
rightClick()	# 双击右键
middleClick()	# 双击中键

dragTo(cursor_x, cursor_y, duration)	# 拖动
dragRel(cursor_x, cursor_y, duration)

scroll()	# 滚动
```

## 键盘

```python
pyautogui.typewrite('str')	#输入str

pyautogui.press()		#模拟击键
pyautogui.keyDown()		#按住
pyautogui.keyUp()		#松开

pyautogui.hotkey()		#组合按键
```

![1540167168921](assets/1540167168921.png)

![1540167183948](assets/1540167183948.png)

## 颜色

```python
import pyautogui
im = pyautogui.screenshot()	# 获得屏幕快照

im.getpixel((10,10))	#获得 坐标(10,10)的颜色值

pyautogui.pixelMatchesColor(cursor_x,cursor_y,(169,32,12))
# 比对坐标处颜色值, 返回 True 或者 False
```

## 图像自动识别

```python
pyautogui.locateOnScreen('submit.png')	
# 根据目标图像 submit.png 匹配, 返回4个整数的元祖, 分别代表(cursor_x,cursor_y,width,hight)
# 否则返回 None

pyautogui.center(,,,)	#根据上面返回值得到中心坐标, 之后就可以用 click()操作了
```


# win32clipboard | 剪切板

https://docs.microsoft.com/zh-cn/windows/desktop/dataxchg/clipboard-overviews

```py
# coding=utf-8
import win32clipboard
import win32con

win32clipboard.OpenClipboard()
win32clipboard.EmptyClipboard()
win32clipboard.SetClipboardData(win32con.CF_UNICODETEXT, 'hello')

data = win32clipboard.GetClipboardData(win32con.CF_UNICODETEXT)
print(data)
```

