# docker-mono
Docker image for .NET/Mono/Python.NET development

```
$ git clone https://github.com/shugaoye/docker-mono.git
$ make
$ ./run_image.sh
```
or

```
$ docker pull shugaoye/docker-mono:latest
$ run_image.sh
```


This image is based on Microsoft image [mcr.microsoft.com/dotnet/sdk:5.0][1].

| Items         | Version     |            Image                 |
| ------------- |:-----------:|:--------------------------------:|
| .NET SDK      | 5.0         | mcr.microsoft.com/dotnet/sdk:5.0 |
| Mono          | 6.12.0.107  | shugaoye/docker-mono:6.12.0.107  |
| Python.NET    | 2.5.2       | shugaoye/docker-mono:p2.5.2      |
| development   | latest      | shugaoye/docker-mono:latest      |

[1]: https://hub.docker.com/_/microsoft-dotnet-sdk
