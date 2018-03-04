class NotebooksChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    notebook = Notebook.find_by(id: params[:notebook_id])
    stream_for notebook
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
