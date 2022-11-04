
.onLoad <- function(libname, pkgname) {
  # the tidylog messages re-routes to our `tidylog_cache` (see utils.R)
  # to enable this, we have to set these options
  options(
    "tidylog.display" = list(store_verb_summary),
    "tidylog.callouts" = store_line_callouts,
    "tidylog.fns_help" = store_fns_help,
    "db.file" = "logs.sqlite",
    "unravel.logdir" = "/Users/mkeller/courses/COMPSCI279R/unravel/Unravel/logs/",
    "unravel.logfile" = "logs.txt",
    "unravel.logging" = TRUE
  )
}
