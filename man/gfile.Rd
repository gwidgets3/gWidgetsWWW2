% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/gfile.R
\name{gfile}
\alias{gfile}
\title{File selection form}
\usage{
gfile(text = "Choose a file", type = c("open"), filter = NULL,
  handler = NULL, action = NULL, container = NULL, ..., width = NULL,
  height = NULL, ext.args = NULL)
}
\arguments{
\item{text}{Instructional text.}

\item{type}{only "open" implemented}

\item{filter}{ignored}

\item{handler}{optional means (to \code{\link{addHandlerChanged}})
to specify a handler for the default signal. A handler is a
function with signature \code{(h,...)} where \code{h} is a list
with components \code{obj} referring to the object emitting the
signal, \code{action} containing values passed to the
\code{action} argument, and possible other values.}

\item{action}{Passed to handler to parameterize a call}

\item{container}{A parent container. In \pkg{gWidgetsWWW2} a
parent container is not optional (though it can be substituted
with the \code{parent} argument in some circumstances). The parent
specifies the widget heirarchy and the \code{...} argument is used
to pass along arguments to layout the child component in the
parent container. Typically, these are passed to the \code{add}
method of the parent container.}

\item{...}{Used to pass along argument to the parent container's
\code{add} method and possible other arguments to the underlying
ference class constructors.}

\item{width}{width in pixels of component. Sizing in
\pkg{gWidgetsWWW2} is sometimes necessary as the arguments
\code{expand} and \code{fill} are not well implemented.}

\item{height}{height in pixels of the component.}

\item{ext.args}{The contructors of \pkg{gWidgetsWWW2} ultimately
call an Ext constructor. The options passed to the Ext constructor
may be added to or overridden by use of this argument. Values are
passed in as named list components and with values converted into JavaScript
objects by \code{asJSObject}.}
}
\value{
a \code{GFile} instance
}
\description{
This renders a file selection form within a small panel
widget. There are two steps needed to transfer a file: a) select a
file through a dialog, b) save the file to the server by clicking
the upload button.
}
\note{
the \code{svalue} method returns the temporary filename of
the uploaded file, or a value of \code{NA}. The property
\code{filename} holds the original filename.
}
\examples{
w <- gwindow()
gstatusbar("Powered by gWidgetsWWW2 and Rook", cont=w)
f <- gfile("Choose a file for upload", cont=w, handler=function(h,...) {
  galert(paste("You uploaded", svalue(h$obj)), parent=w)
})
}

