library(tercen)
library(dplyr)



options("tercen.workflowId" = "4d2ce64e3312592700d1d36dab00c018")
options("tercen.stepId"     = "d0697665-1291-4d8e-bd73-4975fac4d786")


ctx <- tercenCtx()

if(inherits(try(ctx$select(".y")), 'try-error')) stop("y axis is missing.")


ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  top_n(-2, .x) %>%
  mutate(elements = .y) %>%
  select(elements, .ri, .ci, .x) %>%
  ctx$addNamespace() %>%
  ctx$save()

df_in <- ctx %>%
  select(.x, .y, .ri, .ci) 

df_out <- ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  top_n(-2, .x) %>%
  mutate(elements = .y) %>%
  select(elements, .ri, .ci, .x)

