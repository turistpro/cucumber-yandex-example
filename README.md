# Yandex search in cucumber

## Usage

1. git clone https://github.com/turistpro/cucumber-yandex-example
2. cd cucumber-yandex-example
3. docker run --name chrome -d -p 4444:4444 selenium/standalone-chrome:3.0.1-aluminum
4. docker run -it --rm -v $(pwd):/app-tests --link chrome:hub turistpro/cucumber

