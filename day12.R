states = filter(us_states(), stusps %in% c("CO", "AZ", "KS", "OK", "NM", "WY","UT", "NE" )) %>%
  select(name)

CO = filter(states, name == "Colorado")

(mutate(states,
        deim9 = st_relate(states, CO),
        touch = st_touches(states, CO, sparse = F)))

mutate(states, equalsCO = (name == "Colorado")) %>%
  st_drop_geometry()

filter(states, name == "Colorado") %>%
  st_drop_geometry()

mutate(states,
       touch = st_touches(states, CO, sparse = FALSE))

st_filter(states, CO, .predicate = st_touches)

ggplot(states) +
  geom_sf() +
  geom_sf(data = CO, fill = "red", alpha = .5) +
  geom_sf(data = st_filter(states, CO, .predicate = st_touches), fill = "grey", alpha = .5) +
  theme_void()
