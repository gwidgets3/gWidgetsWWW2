Using nginx and Rook to serve web pages
=======================================

The `nginx` web server can be used as a proxy to route requests to an internally running `R` process running `Rook`.

Setup
-----

* The file `Rook.sh` is a modification of one written by Jeffrey Horner. It allows one to start an `R` process with `Rook` listening on a specified port. The script is meant to be modified by the user, so that any exposed applications are loaded.
Unless needed, one should only start with one port and specify `multiple_instances <- FALSE`. This will give the speediest response.

* The `nginx` server then is used to proxy external requests to the internal `Rook` server. Suppose you started the `Rook` server on port 9000. Then one would configure `nginx` to server pages as follows. The `server` configuration of `nginx.conf` can have this added to it:
    
    location /custom { 
      proxy_pass http://localhost:9000/custom; 
    }

The  urls of the form `http://ip.address/custom/someApp` are sent through to the `Rook` process running on port 9000.
