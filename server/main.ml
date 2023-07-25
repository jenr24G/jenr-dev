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

    Dream.get "/static/**"
        (Dream.static "./static");

  ] 