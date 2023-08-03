(* main server entry point *)
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/"
      (fun _request ->
        Templates.Home.layout
        |> Dream.html);

    Dream.get "/hello"
      (fun _request ->
        Templates.Home.hello
        |> Dream.html);

    Dream.get "/slideshow/:slideshow_id/:slide_num"
        (fun request ->
          let slideshow_id = Dream.param request "slideshow_id"               in
          let slide_num    = Dream.param request "slide_num" |> int_of_string in
          Templates.Home.slideshow slideshow_id slide_num ".png" 2
        |> Dream.html);

    Dream.get "/static/**"
        (Dream.static "./static");

  ] 