type image_t = PNG | JPG

let extension_of_image_type image_type =
  match image_type with
  | PNG -> ".png"
  | JPG -> ".jpg"
;;

let images_of_dir 
image_type  (images_directory : string) : string list =
let files_array = Sys.readdir images_directory in
let files_list  = Array.to_list files_array    in
files_list 
  |> List.filter (fun file -> Filename.extension file = extension_of_image_type image_type)