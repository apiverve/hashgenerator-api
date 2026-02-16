from setuptools import setup, find_packages

import os
lib_folder = os.path.dirname(os.path.realpath(__file__))
requirements_file = os.path.join(lib_folder, 'requirements.txt')
install_requires = ["requests >= 2.25.1", "setuptools >= 56.0.0"]
if os.path.exists(requirements_file):
    with open(requirements_file, 'r') as f:
        install_requires = f.read().splitlines()

setup(
    name='apiverve_hashgenerator',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=install_requires,
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