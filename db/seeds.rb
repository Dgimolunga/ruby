Post.delete_all
Post.create!(title: 'Programming Ruby 1.9 & 2.0', published_at: DateTime.now, content:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>})
