import setuptools

with open("README.md", "r") as fh:
    description = fh.read()

setuptools.setup(
    name="hexio",
    version="0.0.1",
    author="Valerio Bucci",
    packages=["src"],
    description="Utility package to handle I/O of hex-compatible data.",
    long_description=description,
    long_description_content_type="text/markdown",
    url="https://github.com/valbucci/hexio",
    license="GPLv3",
    python_requires=">=3.11",
    install_requires=[],
)
