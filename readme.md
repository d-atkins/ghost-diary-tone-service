# README
## Description
Ghost Diary: Tone Service is a microservice used in conjunction with the [Ghost Diary Gateway](https://github.com/d-atkins/ghost-diary-gateway).

Tone service is a lightweight API made with Sinatra which consumes IBM's [Tone Analyzer](https://www.ibm.com/watson/services/tone-analyzer/) to assign a tone to posts made in Ghost Diary.

[David Atkins](https://github.com/d-atkins), [Elom Amouzou](https://github.com/eamouzou), [Jenny Klich](https://github.com/jklich151), [Maria Ronauli](https://github.com/mronauli)

### [Ghost Diary Tone Service Production Link](https://turing-ghost-tone.herokuapp.com)

## Getting Started

#### Installation:

```
$ git clone git@github.com:d-atkins/ghost-diary-tone-service.git  
$ cd ghost-diary-tone-service  
$ gem install bundler
$ bundle
```
If you have problems bundling, try deleting `Gemfile.lock`

## Tests
To run the test suite, run the following command: `bundle exec rspec`

## Running in Development
To run Tone Service in development, execute the following command from the project directory:
```
$ rackup
```
Visit `http://localhost:9292` to view the application in development.

## Endpoint
Tone Service has one endpoint.

Returns the tone of a body of text. Emotions (joy, sadness, anger, fear) take precedence. The response is a single word of the tone selected from the tones returned from Tone Analyzer.
```
/api/v1/tone
```

Params:

| param  | description                                                                 | required? |
|--------|-----------------------------------------------------------------------------|-----------|
| apikey | [Tone Analyzer API Key](https://www.ibm.com/watson/services/tone-analyzer/) | yes       |
| body   | body of text to be analyzed                                                 | yes       |

Example Request:
```
http://localhost:9292/api/v1/tone?apikey=ENTER_YOUR_API_KEY_HERE&body=I%20am%20very%20happy
```

Example Response:
```
"Joy"
```

