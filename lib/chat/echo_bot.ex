defmodule Chat.EchoBot do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def ask(server, message) do
    GenServer.call(server, message)
  end

  ## Server Callback

  def init(:ok) do
    {:ok, []}
  end

  def handle_call(message, _from, messages) do
    allMessages = [message | messages]
    {:reply, allMessages, allMessages}
  end

  def handle_cast(_message,  messages) do
    {:noreply, messages}
  end
end
