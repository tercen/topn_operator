library(tercen)
library(dplyr)


ctx <- tercenCtx()

if(inherits(try(ctx$select(".y")), 'try-error')) stop("y axis is missing.")

ctx %>%
  select(.x, .y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  top_n(as.double(ctx$op.value('n')), .x) %>%
  mutate(elements = .y) %>%
  select(elements, .ri, .ci, .x) %>%
  ctx$addNamespace() %>%
  ctx$save()

