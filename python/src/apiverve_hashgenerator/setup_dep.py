from setuptools import setup, find_packages

setup(
    name='apiverve_hashgenerator',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Hash Generator is a tool for generating cryptographic hashes from text. It supports multiple algorithms including MD5, SHA-1, SHA-256, SHA-384, SHA-512, and BLAKE2 variants for data integrity and security applications.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/hashgenerator?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
