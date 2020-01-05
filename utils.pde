ArrayList<Region> loadData(String path) {
  Table t = loadTable(path, "header");
  println(t.getRowCount() + " total rows in table");

  ArrayList<Region> arr = new ArrayList<Region>();
  //name,size,year,absoluteLength,breitengrad,laengengrad
  for (TableRow row : t.rows()) {
    
      String region = row.getString("region");
  int jahr =row.getInt("jahr");
  float km2 = row.getFloat("km2");

 

    println(region + "," + jahr + "," + km2);

    Region g = new Region( region, jahr, km2);
    arr.add(g);
  }

  println("ArrayList length: " + arr.size());

  return arr;
}
