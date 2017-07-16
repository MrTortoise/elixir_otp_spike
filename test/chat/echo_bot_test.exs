defmodule Chat.EchoBotTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, echoBot} = Chat.EchoBot.start_link
    {:ok, echoBot: echoBot}
  end

  test "ask returns message", %{echoBot: echoBot} do
    assert Chat.EchoBot.ask(echoBot, "woot") ==  ["woot"]
  end

  test "two asks get the meat", %{echoBot: echoBot} do
    Chat.EchoBot.ask(echoBot, "first")
    assert Chat.EchoBot.ask(echoBot, "second") == ["second", "first"]
  end

end
