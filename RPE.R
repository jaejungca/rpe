

require(tidyverse)
require(haven)
require(labelled)
require(sjlabelled)
require(sjPlot)
require(janitor)
require(naniar)
```


# Data setup


df <- read_sav("Research+Participation+Experience+Survey-Fall+2021_June+8,+2023_19.26.sav")
view(df)

dim(df)
head(df)
glimpse(df)
view_df(df)


# Data cleaning

df <- df |> clean_names()

names(df)

head(df) 
view_df(df)

df <- df |> 
  #select(q2_3) |> 
  rename(att_check = q2_3)

df |> 
  count(att_check)

df |> 
  count(att_check) |> 
  mutate(percent = n/sum(n))

df <- df |> 
  filter(att_check == 4)

df |> count(q1_1)

df |> count(q2_2_1)

df |> count(q2_2_2)

df |> count(q2_2_5)

df |> count(q2_2_6)

df <- df |> 
  rename(class_ong_online = q2_2_1, 
         class_ong_mw = q2_2_2,
         class_jung_online = q2_2_5,
         class_hossain = q2_2_6)

df <- df |> 
  rename(incent_required = q2_4_1,
         incent_extra = q2_4_2)

view_df(df)

df |> 
  count(incent_required)

df |> 
  count(incent_extra) 
