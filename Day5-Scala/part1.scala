import scala.io.Source 

@main def HelloWorld(args: String*): Unit =
  val filename = "values.txt" 
  val fileLines = Source.fromFile(filename).getLines()
  fileLines.foreach(println)