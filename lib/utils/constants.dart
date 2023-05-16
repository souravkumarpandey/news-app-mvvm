class Constant{
  static String TOP_HEADLINE_URL="https://newsapi.org/v2/top-headlines?country=us&apiKey=f5206dbf26b8431fb9dd46f037a71aed";
  static String headlineFor(String keyword){
    return "https://newsapi.org/v2/everything?q=${keyword}&apiKey=f5206dbf26b8431fb9dd46f037a71aed";
  }
}