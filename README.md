# Docker MySQL Java JDK Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-mysql-java-jdk.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-mysql-java-jdk)

Docker MySQL Container that also includes Open Java 8 *JDK* install.
It will start mysql in the background then run any parameters provided. 

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

The example below, starts the mysql instance then runs a Java (gradle) build:

```
docker run -i --rm=true \
        -v ${BUILD_HOME_DIR}:/code \
        -e BUILD_NUMBER=${BUILD_NUMBER} \
        -e MYSQL_ROOT_PASSWORD=password \
        -v ${GRADLE_CACHE}:/root/.gradle/caches \
        quay.io/ukhomeofficedigital/mysql-java-jdk:v0.1.1 \
        ./gradlew -Dspring.datasource.username=root \
            -Dspring.datasource.password=${MYSQL_ROOT_PASSWORD} \
            -Dspring.datasource.url=jdbc:mysql://127.0.0.1/mydb \
            -Dliquibase.url=jdbc:mysql://127.0.0.1/mydb \
            -Dliquibase.user=root \
            -Dliquibase.password=${MYSQL_ROOT_PASSWORD} \
            "$@"
    exit 0
fi
```

It extends the mysql only repository and as such, additional relevant documentation is available here:
[Docker MySQL](https://github.com/UKHomeOffice/docker-mysql/blob/v0.5.1/README.md)
 

## Contributing

Feel free to submit pull requests and issues. If it's a particualy large PR, you may wish to discuss
it in an issue first.

Please note that this project is released with a [Contributor Code of Conduct](code_of_conduct.md). 
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/UKHomeOffice/docker-mysql-java/tags). 

## Authors

* **Lewis Marshall** - *Initial work* - [Lewis Marshall](https://github.com/LewisMarshall)

See also the list of [contributors](https://github.com/UKHomeOffice/docker-mysql-java/contributors) who 
participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* This container is taken from the 
  [UKHomeOffice mysql docker container](https://quay.io/repository/ukhomeofficedigital/mysql).
