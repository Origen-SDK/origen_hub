class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :email
end
