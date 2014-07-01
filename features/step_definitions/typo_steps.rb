Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    a = Article.create({ :title => article[:title],
        :user => User.find_by_name(article[:author]),
        :body => article[:body],
        :published_at => DateTime.now})
    Comment.create({:article => a, :author => article[:author], :body => article[:comment]})
  end
end

Given /I am editing article ([0-9]*)/ do |id|
  visit path_to("the edit page for article #{id}")
end

Given /I am editing "([^"]*)"/ do |title|
  visit path_to("the edit page for article #{Article.find_by_title(title).id}")
end

When /^I fill in "merge_with" with the ID for "([^"]*)"$/ do |title|
  fill_in("merge_with", :with => Article.find_by_title(title).id)
#step %Q{When I fill in "merge_with" with #{Article.find_by_title(title).id}}
end

When /^I stop to debug$/ do
  debugger
end
