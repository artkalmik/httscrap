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
end
