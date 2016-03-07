# Docker image for flake8 checker

[flake8](https://pypi.python.org/pypi/flake8) is a Python source code checker: pep8, pyflakes and co


## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.flake8/blob/master/Dockerfile)
- [`2.5.4` (*Dockerfile*)](https://github.com/eea/eea.docker.flake8/blob/2.5.4/Dockerfile)

## Usage

```console
$ docker run --rm -v /path/to/python/code:/code eeacms/flake8
```

## Advanced usage

Exclude files or directories:

```console
$ docker run --rm -v /path/to/python/code:/code \ 
         eeacms/flake8 --exclude=skins /code
```

See flake8 `--help` for more options:

```console
$ docker run --rm eeacms/flake8 --help
```
