# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# %ni%
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title 'Not in'
#' 
#' @description 
#' Negates %in%
#' 
#' @param None
#' 
#' @return The opposite of %in%
#' 
#' @export
`%ni%`<- Negate(`%in%`)



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# move_to_end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title Move item to end of vector
#'
#' @param my_vector A vector
#' @param items_to_move Item or vector of items to move ( not indices )
#' 
#' @return Returns reordered vector
#' @export
move_to_end = function(
  my_vector, 
  items_to_move
){
  
  items_to_move = items_to_move[items_to_move %in% my_vector]
  start_items = my_vector[my_vector %ni% items_to_move]
  
  return(c(start_items, items_to_move))
}




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# move_to_front
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title Move item to front of vector
#'
#' @param my_vector A vector
#' @param items_to_move Item or vector of items to move ( not indices )
#' 
#' @return Returns reordered vector
#' 
#' @export
move_to_front = function(
  my_vector, 
  items_to_move
){
  items_to_move = items_to_move[items_to_move %in% my_vector]
  end_items = my_vector[my_vector %ni% items_to_move]
  
  return(c(items_to_move, end_items))
}




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# move_to_position
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title Move item to position of vector
#'
#' @param my_vector A vector
#' @param items_to_move Item or vector of items to move ( not indices )
#' @param my_position Integer/Index of the postion the items should be moved to move the items to
#' 
#' @return Returns reordered vector
#' 
#' @export
move_to_position = function(
  a_vector, 
  items_to_move, 
  my_position
){
  
  items_to_move = items_to_move[items_to_move %in% a_vector] # make sure items are there first
  
  
  if(my_position > length(a_vector)){
    return_v = move_to_end(a_vector, items_to_move)
  } else if (my_position < 2){
    return_v = move_to_front(a_vector, items_to_move)
  } else {
    a_vector = sapply(a_vector, function(x){paste0(x)})
    a_vector = append(a_vector, items_to_move,  after = my_position - 1)
    a_vector = a_vector[!(names(a_vector) %in% items_to_move)]
    names(a_vector) = NULL
    return_v = a_vector
  }
  return(return_v)
}