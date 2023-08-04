let normalize_slide_num (num_images : int) (slide_num_raw : int) : int =
  if slide_num_raw < 0 then num_images - 1 else slide_num_raw mod num_images

module Slideshow = Widget.Make(struct
  type static_props = Image_lib.image_t

  type request_props = 
    { slideshow_id : string
    ; slide_num    : int
    }

  let http_method = Dream.get
  let sub_uri = "/:slideshow_id/:slide_num"
  let props_of_request (request : Dream.request) =
    { slideshow_id = Dream.param request "slideshow_id"
    ; slide_num    = Dream.param request "slide_num" |> int_of_string
    }

  let render static_props request_props = 
    let slideshow_images = 
      Image_lib.images_of_dir static_props ("static/img/" ^ request_props.slideshow_id) in
    let slide_num = request_props.slide_num |>
      normalize_slide_num (List.length slideshow_images) in
    let image_filename = List.nth slideshow_images slide_num in
    Templates.slideshow request_props.slideshow_id slide_num image_filename
end)