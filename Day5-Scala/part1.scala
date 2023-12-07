import scala.io.Source 
import scala.collection.mutable.Map

@main def HelloWorld(args: String*): Unit =
  val filename = "values.txt" 
  val fileLines = Source.fromFile(filename).getLines()
  fileLines.foreach(println)

  /* 
  ________Data Format________
  Values: ---

  Map1: ---

  Map2: ---
  ...
  ________Data Rules________
  
  */