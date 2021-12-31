function PlotTravel(ax, MyTravel)

p = findobj(ax, 'tag', 'MyTravel');

delete(p);

plot3(ax, MyTravel(:,1), MyTravel(:,2), MyTravel(:,3), '*-','MarkerSize', 3, 'linewidth', 1, 'color', 'magenta','tag', 'MyTravel');

end