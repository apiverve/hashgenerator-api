from setuptools import setup, find_packages

setup(
    name='apiverve_hashgenerator',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Hash Generator computes cryptographic hashes for any text string across algorithms such as MD5, SHA-256, SHA-512, and BLAKE2. It outputs digests for single or multiple algorithms in one request.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/hashgenerator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
