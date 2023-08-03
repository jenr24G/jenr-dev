(* main server entry point *)
let open Dream in () = run
  @@ logger
  @@ router [

    get "/"
      (fun _request ->
        Templates.Home.layout
        |> html);

    get "/hello"
      (fun _request ->
        Templates.Home.hello
        |> html);
    
    Widgets.Slideshow.route "slideshow" PNG;

    get "/static/**"
        (static "./static");

  ] 