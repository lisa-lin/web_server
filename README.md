## Web Server and Browser (from the command line)
This is a very simple Ruby web server and browser. You can issue GET and POST requests and see the HTTP response of those requests.

In one tab of your terminal, run `server.rb`.

In another tab run `browser.rb`.

The command line browser will interact with server to either get `index.html`, or post to `thanks.html`.

Sample output for GET request:

```
What type of request do you want to submit [GET, POST]? GET

<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <h1>Welcome to my personal homepage!</h1>
</body>
</html>
```

Sample output for POST request:

```
What type of request do you want to submit [GET, POST]? POST
Enter name: Lisa
Enter e-mail: llin@email.com

<html>
  <body>
    <h1>Thanks for Posting!</h1>
    <h2>Here's what we got from you:</h2>
    <ul>
      <li>name: Lisa</li><li>e-mail: llin@email.com</li>
    </ul>
  </body>
</html>
```