TODO
----

* in ex-gcanvas-motin -- error o eventX eventY. Chrome warning

* <del>ggooglem maps no e3 object found</del>

* <del>gtable:</del>
  - <del>paging is broken</del>
  - <del>Reassingment [<- does not allow shortening</del>
  - <del>headers: setting isn't works as ogWidget_ID4.colModel.setColumnHeader(6,'AGE'); doesn't have colModel</del>

* <del>gdf exmaples -- changes names, ... isn't working</del>

* tkdensity examples -- are comboboxes broken? Seems they stop calling "change" handler...

* <del> issue with render call in subwindows </del>

* issues with gcodemirror. (setValue method)

* gcodemirror -- put in text proxy, not stripping off of '. Can use add_async_javascript_callback or jRpc stuff.

* gdf seems broken (add, remove can be done now -- see index)

* <del> gfile is broken</del>

* why so slow? (Reference class methods?)


nginx
-----

* better example: need 3 things change to server, change to http and R
  start up script

* load_app for loading many apps in startup script

apache proxy
------------

* give example of proxyPassReverse -- not rApache

Documentation
--------------

* roxygen docs

* vignette

* load_all -- not working



Unit tests
----------

* add more

App
---

* indexgw.rthml -- do we need this?

* subclass load app (In Rook already, but might be nicer if google
  apps like)

* session manager -- can we make session accessible to local user? can
  we make ability to broadcast if $listen is done?

AJAX calls
----------

* put javascript into a namespace

* can replace run_transport with jRpc call 

* proxy calls: should make configuration of gtable view and gdf view
  user customizable. WOuld need to add user-defined methods

Widgets
--------

containers
----------

* gformlayout (mebbe)


gWidgets
---------

* gedit "validate.type" -- valid.type, rename

* gcombobox 

- cant get templates to work! Ughh. displayTpl is close,
  but no cigar

- would like remote queryMode for autocomplete on larger stores

- fonts -- do we need? Use HTML

* ggooglevis in a panel? XXX This needs work

* galert: no css, too wide. Why? (css missing)

* gcanvas: working, needs documenting

* gtable: 

- checkbox selection; grouping variables (add), means to limit
  which fields are shown

- an't be bottom in layout???

* gdf: We can add and edit, but can't delete. WOuld like to use Rest proxy, but isn't working iwth Rook, as the request is denied -- not even parsable

* work on size issues with radio, check box

