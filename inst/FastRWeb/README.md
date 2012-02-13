Integrating gWidgetsWWW2 with FastRWeb and Rserve
=================================================

These files are for using `gWidgetsWWW2` with Simon Urbanek's `FastRWeb` cgi-bin interface to his `Rserve` package. This combination allows one to deploy `gWidgetsWWW2` apps over the internet, as opposed to locally through `Rook`. The other alternatives are to use `Rook` standalone, `Rook` and `nginx` to proxy back to `Rook`, or (in the future) `rapache`.

Installation
------------

There are several pieces of software that need installation. Most of the following comes from the [FastRWeb  documentation](http://www.rforge.net/FastRWeb/), and the [blog entry by Jay Emerson](http://jayemerson.blogspot.com/2011/10/setting-up-fastrwebrserve-on-ubuntu.html). Please consult those pages for more details.

Here are the steps:

* You need a web server capable of running cgi-bin apps. If you use apache, make note of the cgi-bin directory defined in the startup files. (One does not need to configure apache beyond setting up a directory for cgi-bin applications, should that not be done). Installing/configuring/starting apache (or your web server of choice) is left to the official documentation.

* install `gWidgetsWWW2`. The easiest way to do so is through the `devtools` package:

    require(devtools)
    install_github("gWidgetsWWW2", "jverzani")
    
* Install [Rserve](http://www.rforge.net/Rserve/). The easiest thing to do is:

    install.packages("Rserve",,"http://rforge.net/",type="source")

* Install [FastRWeb](http://www.rforge.net/FastRWeb/). Again, the easiest thing to do is:

    install.packages("FastRWeb",,"http://rforge.net/",type="source")

* Copy the `Rcgi` script of `FastRWeb` to apache's cgi-bin directory, renaming to `R`. To find this file, the *R* command

    system.file("cgi-bin", package="FastRWeb")

is helpful.

* Configure `FastRWeb`: From the documentation:

> For unix systems, FastRWeb privides a sample script install.sh that sets up the environment -- you can run it somewhat like this:
> 
> cd `echo 'cat(system.file(package="FastRWeb"))' | R --slave`
> sh install.sh
> 

This sets up a directory `/var/FastRWeb/` where we will need to do several things. The files are in this directory.

- append the contents of `rserve.R` to the file `/var/FastRWeb/code/rserve.R`

- append the contents of `rserve.conf` to the file `/var/FastRWeb/code/rserve.conf`

- create the directory `gw_apps` (or whatever you want to call it) to hold your apps

- copy the `gWidgetsWWW2` *JavaScript* libraries to the `web` directory. These *R* commands will do so:

    d <- system.file("base",  "javascript", package="gWidgetsWWW2")
    system(sprintf("cp -Ra %s /var/FastRWeb/web/javascript", d))

- Similarly copy the `gWidgetsWWW2` images libraries to the `web` directory. These *R* commands will do so:

    d <- system.file("base",  "images", package="gWidgetsWWW2")
    system(sprintf("cp -Ra %s /var/FastRWeb/web/images, d))

- copy the contents of the `web.R` directory to the `/var/FastRWeb/web.R` directory. 




* Test is out. 

- First start `FastRWeb` and `Rserve` with the script `/var/FastRWeb/code/start`.

- Then create and app by saving the following code in the file `/var/FastRWeb/gw_app/test.R`:

    w <- gwindow("Hello")
    g <- ggroup(cont=w)
    b <- gbutton("Click for a message", cont=g)
    addHandlerClicked(b, handler=function(...) {
      gmessage("Hello world", parent=w) 
    })

- Then open the url `http://localhost/cgi-bin/R/app?app=test`. This calls the `app.R` script in `/var/FastRWeb/web.R`. These urls can be prettified through an apache Alias directive. Of course `localhost` can be replaced by an external IP for deploying to the wider internet.


For now, the setup only handles full screen apps. Use an `iframe` to embed in a web page.


Notes
-----

The response is a bit slower than it could be. One area of speedup is in how sessions are handled. There is code in `Rserve` that should allows this to be handled faster, but this has not been exploited yet. 

As of now, sessions are stored in a directory on the server, by default `/tmp/gWidgetsWWW2_session_db`. This must be writable by the `Rserve` process. The location can be configured through an option, which would be set in the `rserve.R` file. Sessions are deleted when a page is unloaded, though one may want to make sure this directory is cleaned out periodically, as the session files can be large.

This is all experimental. Please let me know if there are any issues.
 