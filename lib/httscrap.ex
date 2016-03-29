defmodule Httscrap do
  use Hound.Helpers

  def start do
    IO.puts "Starting"
    Hound.start_session
    navigate_to "https://example.com/login"
    find_element(:id, "user_login") |> fill_field('mylogin')
    el = find_element(:id, "user_pass")
    fill_field(el, 'mypass')
    submit_element(el)
  end

  def download(src, output_filename) do
    IO.puts "Downloading #{src} -> #{output_filename}"
    body = HTTPoison.get!(src).body
    File.write!(output_filename, body)
    IO.puts "Done Downloading #{src} -> #{output_filename}"
  end

  def get_video(url, output_filename) do
    navigate_to url
    page_source() |> Floki.find("source") |> Floki.attribute("src") |> download(output_filename)
  end

  
end
