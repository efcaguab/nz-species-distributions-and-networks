# select_sensitivity_species <- function(fig_dist_species_multiple_locations_data,
#                                        org_id){
#   # Get species ID from the most common plant and the most common pollinator
#   sp_ids <- fig_dist_species_multiple_locations_data %>%
#     dplyr::filter(!is.na(sp_name)) %$%
#     sp_id
#   
#   
#   
# }

niche_sensitivity <- function(thinned_occurrences, interactions_org, 
                              filled_climate_occ, filled_climate_net,grid_networks, R, 
                              this_org_id, n = 10){
  
  suppressPackageStartupMessages({
    require(data.table)
  })
  # this_org_id <- "org_00842"
  this_occurrences <- thinned_occurrences[org_id == this_org_id]
  this_net_occurrences <- this_occurrences %>%
    dplyr::filter(is.na(countryCode))
  sampling_levels <- logspace(5-nrow(this_net_occurrences), 
                              nrow(this_occurrences) - nrow(this_net_occurrences), n) %>%
    round()
  
  independent <- sampling_levels %>%
    purrr::map(~this_occurrences[sample(.N, .)] ) %>%
    purrr::map(rbind, this_net_occurrences) %>%
    purrr::map_df(~dplyr::mutate(calc_suitability(this_org_id, ., interactions_org, 
                                                  filled_climate_occ, filled_climate_net, 
                                                  grid_networks, R), 
                                 n_occ = nrow(.))) %>%
    plyr::mutate(niche_space = "single_species")
  
  niche_space <- calc_niche_space(filled_climate_occ)
  
  collective <- sampling_levels %>%
    purrr::map(~this_occurrences[sample(.N, .)] ) %>%
    purrr::map(rbind, this_net_occurrences) %>%
    purrr::map_df(~dplyr::mutate(calc_suitability(this_org_id, ., interactions_org, 
                                                  filled_climate_occ, filled_climate_net, 
                                                  grid_networks, R, niche_space), 
                                 n_occ = nrow(.))) %>%
    dplyr::mutate(niche_space = "all_species")
  
  dplyr::bind_rows(independent, collective) %>%
    dplyr::mutate(n_net_occurrences = nrow(this_net_occurrences))
}

logspace <- function(x, y, n) exp(seq(log(x), log(y), length.out = n))

unique_rounded_logspace <- function(x, y, n){
  l <- logspace(x, y, n) %>% round() %>% unique()
  internal_n <- n
  while(length(l) < n){
    internal_n <- internal_n + 1
    l <- logspace(x, y, internal_n) %>% round() %>% unique()
  }
  l
}

calc_error_subsamples <- function(suitability_subsamples){
  baseline <- 
    suitability_subsamples %>%
    dplyr::filter(n_occ == max(n_occ)) %>%
    dplyr::rename(base_suitability = suitability) %>%
    dplyr::select(-n_occ) %>%
    dplyr::select_at(dplyr::vars(-dplyr::contains("KUD")))
    # split(.$niche_space) %>%

  # suitability_subsamples %>%
  #   ggplot(aes(x = n_occ, y = suitability, colour = niche_space, shape = loc_id)) +
  #   # geom_line() +
  #   # geom_point() +
  #   geom_smooth(se = T) +
  #   scale_x_log10()
  
  dplyr::inner_join(suitability_subsamples, baseline) %>%
    dplyr::select_at(dplyr::vars(-dplyr::contains("KUD"))) %>% 
    dplyr::mutate(run = rep(seq(1, nrow(.)/2), each = 2)) %>%
    dplyr::group_by(niche_space, n_occ, run, n_net_occurrences) %>%
    dplyr::summarise(mse = mse(suitability, base_suitability), 
                     mse_logis = mse(qlogis(suitability), qlogis(base_suitability)), 
                     mae = mae(suitability, base_suitability)) 
}

mse <- function(x, y){
  sum((x - y)^2) / length(x)
}

mae <- function(x, y){
  sum(abs(x - y)) / length(x)
}

determine_min_occurrences_per_niche_space <- function(error_subsamples, min_suitability_error){
  error_subsamples %>%
    # dplyr::filter(niche_space == "single_species") %>%
    dplyr::mutate(prop_occ = n_occ/n_net_occurrences, 
                  log_prop_occ = log(prop_occ)) %>%
    split(.$niche_space) %>%
    purrr::map(determine_min_occurrences, min_suitability_error)
}


determine_min_occurrences <- function(data, min_suitability_error){
  data %>% 
    mgcv::gam(mae ~ s(log_prop_occ), data = . , family = "binomial") %>% 
    broom::augment(type.predict = "response", 
                   newdata = tibble::tibble(
                     log_prop_occ = seq(0.2, 5, length.out = 1000))) %$%
    approx(x = .fitted, y = log_prop_occ, min_suitability_error) %$%
    exp(y) %>%
    round()
}

# Function by Holger Brandl https://stackoverflow.com/questions/43627679/round-any-equivalent-for-dplyr/46489816#46489816
round_any = function(x, accuracy, f=round){f(x/ accuracy) * accuracy}
