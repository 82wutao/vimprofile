
from os import shutil
from setuptools import setup,find_packages
from setuptools.command.install_scripts import install_scripts

class InstallScripts(install_scripts):

    def run(self):
        setuptools.command.install_scripts.install_scripts.run(self)

        # Rename some script files
        for script in self.get_outputs():
            if script.basename.endswith(".py") or script.basename.endswith(".sh"):
                dest = script[:-3]
            else:
                continue
            print("moving %s to %s" % (script, dest))
            shutil.move(script, dest)

setup(
    #### 包信息

    name="pydb",
    version="0.0.1",
    author="wutao",
    author_email="codeandmore@126.com",
    description="from object/data to sql",
    url="",
    packages=find_packages(),





    #### 构建工具本身

    # setup.py 本身要依赖的包，这通常是为一些setuptools的插件准备的配置
    # 这里列出的包，不会自动安装。
    setup_requires=['pbr'],

    # 仅在测试时需要使用的依赖，在正常发布的代码中是没有用的。
    # 在执行python setup.py test时，可以自动安装这三个库，确保测试的正常运行。
    tests_require=[
        'pytest>=3.3.1',
        'pytest-cov>=2.5.1',
    ],

    # 用于安装setup_requires或tests_require里的软件包
    # 这些信息会写入egg的 metadata 信息中
    dependency_links=[
        "http://example2.com/p/foobar-1.0.tar.gz",
    ],


    #### 打包分发

    classifiers=[
        # 发展阶段
        # 3 - Alpha
        # 4 - Beta
        # 5 - Production/Stable
        'Development Status :: 3 - Alpha',

        # 目标用户
        'Inended Audience :: Developers',

        # 类型
        'Topic :: Software Development :: SQLTemplate',
        'License :: OSI Approved :: MIT License',

        'Programming Language :: Python :: 3'
    ],

    data_files=[
        ('',['conf/*.conf']),
        ('/usr/lib/systemd/system/',['bin/*.service']),
    ],
    package_data={
        '':['*.txt'],
        'bandwith_reporter':['*.txt']
    },
    exclude_package_data={
        'bandwith_reporter':['*.txt']
    },



    #### 安装

    # 要求兼容的python环境，非兼容的在安装时就提示
    python_requires='>=2.7,<=3',


    # 表明当前模块依赖哪些包，若环境中没有，则会从pypi中下载安装
    install_requires=[
        'docutils>=0.3',
        'argpase',
        'setuptools==38.2.4',
        'Django>1.11,!=1.11.1,<=2',
        'requests[security,socks] >=2.18.4'],

    # install_requires 在安装模块时会自动安装依赖包
    # 而 extras_require 不会，这里仅表示该模块会依赖这些包
    # 但是这些包通常不会使用到，只有当你深度使用模块时，才会用到，这里需要你手动安装
    extras_require={
        'PDF':  ["ReportLab>=1.2", "RXP"],
        'reST': ["docutils>=0.3"],
    },

    # 安装的最终文件形式，可执行或者库

    # 用来支持自动生成脚本，安装后会自动生成 /usr/bin/foo 的可执行文件
    # 该文件入口指向 foo/main.py 的main 函数
    entry_points={
        'console_scripts': [
            'foo = foo.main:main'
        ]
    },

    # 将 bin/foo.sh 和 bar.py 脚本，生成到系统 PATH中
    # 执行 python setup.py install 后
    # 会生成 如 /usr/bin/foo.sh 和 如 /usr/bin/bar.py
    scripts=['bin/foo.sh', 'bar.py'],
    cmdclass={
        "install_scripts": InstallScripts
    }
    )

