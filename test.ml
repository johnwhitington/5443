let fast_output_int ch i = output_string ch (string_of_int i)
let fast_output_float ch f = output_string ch (string_of_float f)
let fast_output_bool ch b = output_string ch (string_of_bool b)

type data =
  | Int of int
  | Float of float
  | Bool of bool
  | Ident of string
  | Array of data list

let rec data_to_channel ch = function
  | Int i -> fast_output_int ch i
  | Float f -> fast_output_float ch f
  | Bool b -> fast_output_bool ch b
  | Ident i -> output_string ch i
  | Array l ->
      output_string ch "[ ";
      List.iter
        (function x -> data_to_channel ch x; output_string ch " ")
        l;
      output_string ch "]"

let many x n =
  Array.to_list (Array.make n x)

let testdata n = Array (many (Bool false) n)

let _ =
  match Sys.argv with
    [|_; n|] ->
      Printf.eprintf "start...";
      flush stderr;
      let t = Unix.gettimeofday () in
      data_to_channel stdout (testdata (int_of_string n));
      let t' = Unix.gettimeofday () in 
      Printf.eprintf "end. %f\n" (t' -. t);
      flush stderr
  | _ -> failwith "Bad input" 
