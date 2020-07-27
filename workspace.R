library(tercen)
library(dplyr)


options("tercen.workflowId" = "4d2ce64e3312592700d1d36dab00c018")
options("tercen.stepId"     = "0e2045b4-d100-4a55-bfbf-0f7eb604eb70")


ctx <- tercenCtx()

if(inherits(try(ctx$select(".y")), 'try-error')) stop("y axis is missing.")


ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  top_n(-1, .x) %>%
  mutate(elements = .y) %>%
  select(elements, .ri, .ci, .x) %>%
  ctx$addNamespace() %>%
  ctx$save()

