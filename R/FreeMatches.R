FreeMatches <- function(Competitions){
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please register your details on https://www.statsbomb.com/resource-centre and read our User Agreement carefully.")
  Matches.df <- tibble()
  for(i in 1:length(Competitions)){
    Matches.url <- paste0("https://raw.githubusercontent.com/statsbomb/open-data/master/data/matches/", Competitions[i], ".json")
    raw.matches <- GET(url = Matches.url)
    matches.string <- rawToChar(raw.matches$content)
    matches <- fromJSON(matches.string, flatten = T)
    Matches.df <- bind_rows(Matches.df, matches)
  }
  return(Matches.df)
}
