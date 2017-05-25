[ ["DX", "dx"],
  ["Contest", "contest"],
  ["Event", "event"],
  ["General", "general"]
].each do |name,slug|
  Category.find_or_create_by(name: name, slug: slug)
end
