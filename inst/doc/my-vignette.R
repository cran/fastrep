## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------


## -----------------------------------------------------------------------------
df = Orange |> 
  dplyr::group_by(Tree) |> 
  dplyr::count() 
  
  
fastrep::tbl(df)

## -----------------------------------------------------------------------------
df |> 
  fastrep::tbl(title = "My Title!", full_page = F)

## -----------------------------------------------------------------------------
df |> 
  fastrep::tbl(title = "My Title!", code = T, format = "latex")

## -----------------------------------------------------------------------------
infert |> 
  fastrep::freq_tbl(education)

## -----------------------------------------------------------------------------
infert |> 
  fastrep::freq_tbl(education) |> 
  fastrep::tbl()

## -----------------------------------------------------------------------------
chickwts |> 
  fastrep::freq_tbl(feed, sort_by = absolute_frequency)

## -----------------------------------------------------------------------------
chickwts |> 
  fastrep::freq_tbl(feed, desc = T, sort_by = relative_frequency)

## -----------------------------------------------------------------------------
infert |> 
  fastrep::cross_tbl(education, spontaneous)

## -----------------------------------------------------------------------------
infert |> 
  fastrep::cross_tbl(education, spontaneous, marg = T)

## -----------------------------------------------------------------------------
mtcars |> 
  fastrep::describe()

## -----------------------------------------------------------------------------
mtcars |> 
  fastrep::describe() |> 
  fastrep::tbl("Summary of mtcars")

