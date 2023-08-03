open Dream

let normalize_slide_num (num_images : int) (slide_num_raw : int) : int =
  if slide_num_raw < 0 then num_images - 1 else slide_num_raw mod num_images

let route (path : string) (img_type : Image.t) = 
  get (path ^ "/:slideshow_id/:slide_num")
  (fun request ->
    let slideshow_id = param request "slideshow_id"                          in
    let slideshow_images = 
      Image.images_of_dir img_type ("static/img/" ^ slideshow_id)            in
    let slide_num    = param request "slide_num" 
      |> int_of_string |> normalize_slide_num (List.length slideshow_images) in
    let image_filename = List.nth slideshow_images slide_num                 in
    Template.apply slideshow_id slide_num image_filename
  |> html)