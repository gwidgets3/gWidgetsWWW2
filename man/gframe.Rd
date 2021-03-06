% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/gframe.R
\name{gframe}
\alias{gframe}
\title{gframe is a title-decorated ggroup box container}
\usage{
gframe(text = "", pos = 0, horizontal = TRUE, spacing = 2,
  use.scrollwindow = FALSE, container = NULL, ..., width = NULL,
  height = NULL, ext.args = NULL)
}
\arguments{
\item{text}{label text}

\item{pos}{position of label. Ignored?}

\item{horizontal}{Boolean. Set to \code{TRUE} to pack children horizontally.}

\item{spacing}{Integer. Between child spacing.}

\item{use.scrollwindow}{Boolean. Set to \code{TRUE} to add a
scrollwindow to manage space given to child widgets. Containers
with scrollwindows often have their size fixed.}

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
an \code{GContainer} object
}
\description{
Use \code{svalue<-} to adjust the title
}
\examples{
w <- gwindow()
g <- gframe("Label", cont=w)
b <- gbutton("insider frame", cont=g)
svalue(g) <- "new label"
}
\seealso{
\code{\link{ggroup}}
}

