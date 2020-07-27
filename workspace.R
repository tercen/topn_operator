library(tercen)
library(dplyr)


options("tercen.workflowId" = "4d2ce64e3312592700d1d36dab00c018")
options("tercen.stepId"     = "a11a3579-8691-4266-8ddd-35d9d3096556")


ctx <- tercenCtx()

if(inherits(try(ctx$select(".y")), 'try-error')) stop("y axis is missing.")

ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  top_n(-1) %>%
  mutate(elements = .y) %>%
  select(elements, .ri, .ci) %>%
  ctx$addNamespace() %>%
  ctx$save()

