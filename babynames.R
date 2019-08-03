# Library to download data from Internet:
library(rvest)
# Fread correctly imports accents with Latin encoding:
library(data.table) 
# To manipulate data:
library(tidyverse)
library(dplyr)
library(stringi)

data <- list()

# Babies born in Catalonia in this period:
years <- 1997:2018 
# Download data with api:
for (year in seq_along(years)) { 
  page <- fread(str_c("http://www.idescat.cat/nadons/?t=", years[year],"&f=ssv"), 
                skip=8, header=F,encoding = "Latin-1",
                colClasses=c("integer", "factor", "character", "integer", "character"))
  page[, 1] <- years[year]
  data[[year]] <- page
}

# Join all tables in one:
babynames <- tbl_df(do.call("rbind", data))
# Rename columns and prop is by 1000
names(babynames) <- c("year", "sex", "name", "n", "prop")

# Most popular female names in Catalonia in 2000
babynames %>% filter(year == 2000, sex == "D") %>% arrange(desc(prop)) 
# Least popular female names in Catalonia in 2000
babynames %>% filter(year == 2000, sex == "D") %>% arrange(prop) 

# Take the last letter in the name
str_sub(babynames$name,-1)
# Detect vocal == last letter
length(str_detect(str_sub(babynames$name,-1), "[AEIOU]"))
length(babynoms$n)

clean <- function(dirty_text) {
  # Based on REGEX
  # https://www.gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf
  # Convert to Latin ASCIII to remove accents:
  to_split <- stri_trans_general(dirty_text, "Latin-ASCII")
  # [^|\\/] — Any character aside from a pipe or a slash.
  # \\. — Any character escaped with a slash.
  # (...|...)+ — One or more of the preceding (escaped) characters.
  # Ignore everything after slash:
  clean_text <- str_extract(to_split, "([^|\\/]|\\.)+")
  return(clean_text)
}

# Part of data cleaning: clean names from accentuated characters and slashes:
clean_babynames <- babynames %>% mutate(name = as.factor(clean(name)), prop = as.numeric(str_replace(prop, "[,]", ".")))

# Probability of name ending by vowel, by gender:
clean_babynames %>%
  mutate(last = str_sub(name,-1), vowel = str_detect(str_sub(name,-1), "[AEIOU]")) %>% 
  group_by(year, sex) %>%
  summarise(prop_vowel = weighted.mean(vowel, n)) %>% 
  ggplot(aes(year, prop_vowel, color = sex)) + 
  coord_cartesian(ylim = c(0,1)) +
  geom_line()+ geom_point() +
  labs(title = "Proportion of names ending with vowel",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

# Probability of name starting by vowel, by gender:
clean_babynames %>%
  mutate(last = str_sub(name,1,1), vowel = str_detect(str_sub(name,1,1), "[AEIOU]")) %>% 
  group_by(year, sex) %>%
  summarise(prop_vowel = weighted.mean(vowel, n)) %>% 
  ggplot(aes(year, prop_vowel, color = sex)) + 
  coord_cartesian(ylim = c(0,1)) +
  geom_line() + geom_point() +
  labs(title = "Proportion of names starting with vowel",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

library(rlang)
name_graph <- function(data, name, sex){
  name <- enquo(name)
  sex <- enquo(sex)
  data %>%
    filter(name == !! as_label(name), sex == !! as_label(sex)) %>%
    select(year, prop) %>%
    ggplot() +
    geom_line(mapping = aes(year, prop))
}
name_graph(clean_babynames, ASIER, H)

clean_babynames %>%
  filter(name %in% c("MOHAMED", "YOUSSEF", "HAMZA", "MEHDI", 
                     "AYOUB", "OMAR"), sex == "H") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "Moroccan male names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal()

clean_babynames %>%
  filter(name %in% c("SALMA", "AYA", "IMANE", "FATIMA", 
                     "MERYEM", "YASMINE"), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "Moroccan female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal()

clean_babynames %>%
  filter(name %in% c("ANA BELEN", "ANA ISABEL", "ANA LUCIA", 
                     "ANA MARIA", "ANA PAULA", "ANA ROSA", 
                     "ANA SOFIA", "ANA VICTORIA", "ANABEL"), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "Compound with \"Ana\" female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal()

# Are short names becoming popular?
clean_babynames %>%
  filter(name %in% c("ELISA","ELISA MARIA","ELISABET","ELISABETH",
                     "ELISENDA","ELIZABETH","ELIZAVETA"), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Elisabet\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal()

clean_babynames %>%
  filter(name %in% c("EKATERINA", "CATALINA", "CATERINA",
                     "CATHERINE", "KATIA", "KATHERINE",
                     "KATE", "KATALINA", "KAREN"), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Caterina\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal()

clean_babynames %>%
  filter(name %in% c("CAROLINA", "KAROLINA", "CORALI",
                     "CAROLINE", "CORAL", "CAROL", "CAROLA"), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Carolina\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

clean_babynames %>%
  filter(name %in% (unlist(as.list(clean_babynames %>% 
                      filter(str_detect(name, "^ISAB"), sex == "D") %>%
                      select(name) %>% distinct()))), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Isabel\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

clean_babynames %>%
  filter(name %in% (unlist(as.list(clean_babynames %>% 
                                     filter(str_detect(name, "MARG|(^RITA$)"), sex == "D") %>%
                                     select(name) %>% distinct()))), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Margarita\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

clean_babynames %>%
  filter(name %in% (unlist(as.list(clean_babynames %>% 
                                     filter(str_detect(name, "^MARI\\S*$"), sex == "D") %>%
                                     select(name) %>% distinct()))), sex == "D") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Mari\"-like female names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 

clean_babynames %>%
  filter(name %in% (unlist(as.list(clean_babynames %>% 
                                     filter(str_detect(name, "^ALE\\S*$"), sex == "H") %>%
                                     select(name) %>% distinct()))), sex == "H") %>%
  select(name, year, prop) %>%
  ggplot(mapping = aes(x = year, y = prop, color = name)) +
  geom_line() + geom_point() +
  labs(title = "\"Alex\"-like male names in Catalonia through years",
       x = "Year", 
       y = "Proportion ‰",
       color = "Name",
       caption = "Data from idescat.cat") + theme_minimal() 


###=============== BEAUTIFUL VISUALIZATION ================###
### Mean length of names in Catalonia through years by sex ###
clean_babynames %>% 
  mutate(length = str_length(name)) %>%
  group_by(year,sex) %>%
  summarise(mean_length = weighted.mean(length, n)) %>% 
  ggplot(aes(year, mean_length, color = sex)) +
  geom_line() + geom_point() +
  labs(title = "Mean length of names in Catalonia through years",
       x = "Year", 
       y = "Mean length",
       color = "Sex",
       caption = "Data from idescat.cat") +
  #geom_text(aes(label = mean_length)) +
  scale_color_discrete(labels = c("Female", "Male")) +
  theme_minimal() 
###========================================================###




clean_babynames %>% 
  filter(str_detect(name, "^ALE\\S*$"), sex == "H") %>%
  select(name) %>% distinct()




str_sub("name",1, 1)
















