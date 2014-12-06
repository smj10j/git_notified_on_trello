require 'spec_helper'

describe GitNotifiedOnTrello do
  it "expects the notifier instantiation to succeed" do
    n = GitNotifiedOnTrello::Notifier.new
    expect(n).to be_a GitNotifiedOnTrello::Notifier
  end
end
