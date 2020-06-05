from distutils.core import setup

from wifite2.config import Configuration

setup(
    name='wifite2',
    version=Configuration.version,
    author='DevDemon',
    author_email='',
    url='https://github.com/D3vD3m0n/kali-Pi-Extensions/tree/master/tools/Kali/Wifite2',
    packages=[
        'wifite2',
        'wifite2/attack',
        'wifite2/model',
        'wifite2/tools',
        'wifite2/util',
    ],
    data_files=[
        ('share/dict', ['wordlist-probable.txt'])
    ],
    entry_points={
        'console_scripts': [
            'wifite2 = wifite2.wifite2:entry_point'
        ]
    },
    license='GNU GPLv2',
    scripts=['bin/wifite2'],
    description='Wifi  Auditor for Kali.',
    #long_description=open('README.md').read(),
    long_description='''Wifi  Auditor for Kali.
    Sniff, Injects and Cracks WEP, WPA/2, and WPS encrypted networks.''',
    classifiers = [
        "Programming Language :: Python :: 3"
    ]
)
