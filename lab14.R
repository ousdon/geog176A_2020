eqdc = '+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'
state = USAboundaries::us_states(resolution = "low") %>%
  city_pip = point_in_polygon3(cities, counties, "geoid")
  filter(!state_name %in% c("Puerto Rico", "Alaska", "Hawaii")) %>%
  counties = get_conus(us_counties("cities"), "state_name") %>%
  st_transform(st_crs(cities))

cities = read_csv("/Users/xingxin/Github/geog176a-summer-2020-lab1/uscities.csv") %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326) %>%
  select(city)


mapview::npts(state)
plot(state$geometry)

ggsave("lab14.png")




