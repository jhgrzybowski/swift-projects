import Foundation

public class Location {
  let id: Int
  let type: String
  let name: String
  let rating: Int

  init(_ id: Int, _ type: String, _ name: String, _ rating: Int) {
    self.id = id
    self.type = type
    self.name = name
    if(rating < 1) {
      self.rating = 1
    } else if(rating > 5) {
      self.rating = 5
    } else {
      self.rating = rating
    }
     
  }
  
}

class City: CustomStringConvertible {
  let id: Int
  let name: String
  let description: String
  let latitude: Float
  let longitude: Float
  let tagList: [String]
  let locations: [Location]

  init(_ id: Int, _ name: String, _ description: String, _ latitude: Float, _ longitude: Float, _ tagList: [String], _ locations: [Location]) {
    self.id = id
    self.name = name
    self.description = description
    self.latitude = latitude
    self.longitude = longitude
    self.tagList = tagList
    self.locations = locations
  }
 
  
  func showInfo() -> Void {
    print("Miasto \(self.name): \(description) (id \(self.id))")
  }

  public var toString: String { return description }
  
}

let loc1 = Location(1, "restaurant", "Aioli", 5)
let loc2 = Location(2, "restaurant", "Mc Donalds", 2)
let loc3 = Location(3, "restaurant", "Burger King", 3)
let loc4 = Location(4, "restaurant", "Subway", 4)
let loc5 = Location(5, "restaurant", "KFC", 3)
let loc6 = Location(6, "restaurant", "Pizza 105", 5)
let loc7 = Location(7, "restaurant", "Pizzeria Italiano", 5)
let loc8 = Location(8, "restaurant", "Steakhouse", 5)
let loc9 = Location(9, "restaurant", "Falla", 5)
let loc10 = Location(10, "restaurant", "Kebab Hassan", 1)
let loc11 = Location(11, "restaurant", "Tokyo Sushi", 5)
let loc12 = Location(12, "restaurant", "Ramen Fusion", 5)
let loc13 = Location(13, "restaurant", "Sashimi House", 5)
let loc14 = Location(14, "restaurant", "Hells Kitchen", 3)
let loc15 = Location(15, "restaurant", "Drive by Burger", 2)

var polandLocations = [loc1, loc2, loc6, loc8, loc9, loc10]
var europeLocations1 = [loc2, loc3, loc4, loc6]
var europeLocations2 = [loc2, loc7, loc8, loc9]
var americaLocations = [loc1, loc4, loc5, loc7, loc9, loc15]
var asiaLocations = [loc11, loc12, loc13, loc14]

let bdg = City(1, "Bydgoszcz", "Stolica kujawsko-pomorskiego, przyjazne miasto, kt??re rozwija si?? z roku na rok i jest wizyt??wk?? regionu", 53.1234804, 18.0084378, ["Opera", "Wyspa M??y??ska", "Dzielnica muzyczna", "Kana?? bydgoski", "Wierza ci??nie??", "Piwo"], polandLocations)

let trn = City(2, "Toru??", "Druga stolica kujawsko-pomorskiego, g????wnie kojarzony z piernikami, a w rzeczywisto??ci kolebka kultury", 53.010020, 18.605132, ["Kopernik", "Pierniki", "Planetarium", "Odnowa", "Star??wka", "Horzycy"], polandLocations)

let lnd = City(3, "London", "Stolica Anglii, kulturowo najbardziej bogate miasto w Europie", 51.507351, -0.127758, ["Big Ben", "London Eye", "Tower Bridge", "Westminster", "Rodzina kr??lewska", "Czerwone autobusy", "Budki telefoniczne"], europeLocations1)

let nyc = City(4, "New York City", "Najbardziej popularne miasto w USA, miejsce kultowe na ca??ym ??wiecie", 40.712775, -74.005973, ["Statua Wolno??ci", "??????te taks??wki", "Manhattan", "Central Park"], americaLocations)

let rio = City(5, "Rio De Janeiro", "Pi??kne miejsce, ciep??o, kolorowo, weso??o, muzycznie i pi??karsko", -22.906847, -43.172897, ["Jezus Odkupiciel", "Fawele", "Kolory", "Pi??ka no??na"], americaLocations)

let par = City(6, "Paris", "Stolica Francji i mi??o??ci, miejsce magiczne obfite w kultur?? i histori??", 48.856614, 2.352222, ["Wie??a Eiffla", "Luwr", "Crossoint", "Bagietki", "Lionel Messi"], europeLocations1)

let mad = City(7, "Madrid", "Stolica Hiszpanii, z??ote miejsce na p????wyspie Iberyjskim", 40.416775, -3.703790, ["Flamengo", "Galacticos", "Wy??yna Kastilijska", "S??o??ce", "Wino"], europeLocations1)

let bar = City(8, "Barcelona", "Serce Katalonii, pi??kna architektura i miejsce odkry??", 41.385064, 2.173404, ["Kolumb", "Katalonia", "Sagrada Familia", "Pla??e", "S??o??ce"], europeLocations2)

let pra = City(9, "Prague", "Niedoceniony punkt na mapie Europy, miasto w kt??rym historia ????czy si?? z tera??nejszo??ci??", 50.075538, 14.437800, ["Hradczany", "Most Karola", "Praski zegar", "Katedra ??w. Wita"], europeLocations2)

let bud = City(10, "Budapest", "Buda i Pest czyli dwie cz????ci stolicy W??gier, kt??re tworz?? pi??kny pejza?? i wziyt??wk?? Wyszehradu", 47.497912, 19.040235, ["Parlament", "Papryka", "Most ??a??cuchowy", "Kostka rubika"], europeLocations1)

let ber = City(11, "Berlin", "Stolica Niemiec, miejsce gdzie przecinaj?? si?? kultury i pami??ta si?? o historii", 52.520007, 13.404954, ["Brama Brandenburska", "Miejsce kultur", "Muzea historii IIW??", "Piwo", "Wurst"], europeLocations2)

let lis = City(12, "Lisbon", "Stolica Portugalii, s??o??ce, morze i wino", 38.722252, -9.139337, ["Torre de Belem", "Zamek ??w. Jerzego", "Wino", "Cristiano Ronaldo", "S??o??ce"], europeLocations1)

let tok = City(13, "Tokyo", "Stolica Japonii, serce technologii ??wiatowej oraz rozwoju", 35.689487, 139.691706, ["Sushi", "Skytree", "Shibuya crossing"], asiaLocations)

let syd = City(14, "Sydney", "Stolica Australii, s??ynna ze swojej opery oraz fauny i flory", 33.867487, 151.206990, ["Opera w Sydney", "Pla??e", "Harbour Bridge", "S??o??ce"], asiaLocations)

let nai = City(15, "Nairobi", "Rozgrzana stolica Kenii, radosne miasto, kt??re ca??y czas si?? rozwija", -1.292066, 36.821946, ["Park narodowy", "Las Karura", "Rezerwat ??yraf", "Bomas", "S??o??ce"], asiaLocations)

let nde = City(16, "New Dehli", "Stolica Indii", 28.613939, 77.209021, ["Czerwony Fort", "Kuchnia indyjska", "Qutab Minar", "S??o??ce"], asiaLocations)

let osl = City(17, "Oslo", "Najwi??ksze miasto i stolica Norwegii, serce Skandynawii", 59.913869, 10.752245, ["Muzeum Wiking??w", "Fiordy", "Minimalizm", "Po??owy"], europeLocations2)

let sto = City(18, "Stockholm", "Stolica Szwecji, znana jako centrum spo??eczne, medialne i polityczne", 59.329324, 18.068581, ["Korona", "Muzea", "Wikingowie", "Zimno"], europeLocations1)

let gla = City(19, "Glasgow", "Stolica Szkocji, centrum celtyk??w, miejsce kultury i historii", 55.864237, -4.251806, ["??wi??ty Patryk", "Czterolistna koniczyna", "Celtic", "Piwo"], europeLocations2)

let kre = City(20, "Crete", "Wyspa w Grecji, s??ynie z wielu turysty??w rocznie, ciep??y i wlgotny klimat, idealny na opalanie i korzystanie z morza", 35.240117, 24.809269, ["S??o??ce", "Ciep??o", "Pla??e", "Morze"], europeLocations1)



var cityArray = [bdg, trn, lnd, nyc, rio, par, mad, bar, pra, bud, ber, lis, tok, syd, nai, nde, osl, sto, gla, kre]

func searchCity(_ searchName: String) -> [City] {
  var output: Array<City> = Array()
  for i in 0...(cityArray.count-1) {
    if (cityArray[i].name == searchName)     
    {
      output.append(cityArray[i])
    }
  }  

  return output
}

func searchCityByTag(_ tag: String) -> [City] {
  var output: Array<City> = Array()
  
  for i in 0...(cityArray.count-1) {
    for j in 0...(cityArray[i].tagList.count-1) {
      if (cityArray[i].tagList[j] == tag) {
        output.append(cityArray[i])
      }
    }
  }

  return output
}

func degToRad(_ deg: Float) -> Float {
  return deg * (Float.pi/180)
}

func calcDistance(_ lat1: Float, _ lon1: Float, _ lat2: Float, _ lon2: Float) -> Float {
  let R = Float(6378.14) // Radius of the earth in km
  let dLat = degToRad(lat2-lat1)  // deg2rad below
  let dLon = degToRad(lon2-lon1) 
  let a = sin(dLat/2) * sin(dLat/2) + cos(degToRad(lat1)) * cos(degToRad(lat2)) * sin(dLon/2) * sin(dLon/2)
    
  let c = 2 * atan2(sqrt(a), sqrt(1-a))
  let d = R * c // Distance in km
  return d
}

func calcClosestAndFurthest(_ lat: Float, _ lon: Float) -> String {
  var output: String = ""
  
  var closest: Float = Float.greatestFiniteMagnitude
  var furthest: Float = 0

  var closestCity: String = ""
  var furthestCity: String = ""
  
  for i in 0...(cityArray.count-1) {
    if(calcDistance(lat, lon, cityArray[i].latitude, cityArray[i].longitude) > furthest) {
      furthest = calcDistance(lat, lon, cityArray[i].latitude, cityArray[i].longitude)
      furthestCity = cityArray[i].name
    } else if (calcDistance(lat, lon, cityArray[i].latitude, cityArray[i].longitude) < closest) {
      closest = calcDistance(lat, lon, cityArray[i].latitude, cityArray[i].longitude)
      closestCity = cityArray[i].name
    }
  }

  output = "Miasto znajduj??ce si?? najbli??ej od podanych koordynat to \(closestCity) (\(closest) km)\nMiasto znajduj??ce si?? najdalej od podanych koordynat to \(furthestCity) (\(furthest) km)"
  return output
}

func calcFurthestCities() -> String {
  var output: String = ""

  var distance: Float = 0
  var name1: String = ""
  var name2: String = ""
  
  for i in 0...(cityArray.count-1) {
    for j in i...(cityArray.count-1) {
      if(calcDistance(cityArray[i].latitude, cityArray[i].longitude, cityArray[j].latitude, cityArray[j].longitude)>distance) {
        distance = calcDistance(cityArray[i].latitude, cityArray[i].longitude, cityArray[j].latitude, cityArray[j].longitude)
        name1 = cityArray[i].name
        name2 = cityArray[j].name
      }
    }
  }

   output = "Miasta oddalone od siebie najbardziej to \(name1) oraz \(name2). Dzieli ich a?? \(distance) km."
  return output
}

func findHighRatedCities() -> [String] {
  
  var out: Array<String> = Array()

  for i in 0...(cityArray.count-1) {
    for j in 0...(cityArray[i].locations.count-1) {
      if(cityArray[i].locations[j].rating==5) {
        out.append(cityArray[i].name)
        break;
      }
  
    }

  }
  out.sort()
  return out
}

func findLocations(_ city: City) -> [(String, Int)] {
  var ratedLocationsArray: [(name: String, rating: Int)] = []
  
  for i in 0...(city.locations.count-1) {
    ratedLocationsArray.append((name: city.locations[i].name, rating: city.locations[i].rating))
  }
  ratedLocationsArray = ratedLocationsArray.sorted(by: {$0.rating > $1.rating})
  return ratedLocationsArray
}

func countFiveStarsLocations() -> String {
  var outString: String = ""
  
  for i in 0...(cityArray.count-1) {
    var fiveStarCount = 0
    var fiveStarsLocations: Array<String> = []
    for j in 0...(cityArray[i].locations.count-1) {
      if(cityArray[i].locations[j].rating==5) {
        fiveStarCount += 1
        fiveStarsLocations.append(cityArray[i].locations[j].name)
      }
      
    }
  outString += "Miasto \(cityArray[i].name) posiada \(fiveStarCount) restauracji 5-gwiazdkowych.\n Oto one: \(fiveStarsLocations) \n\n"
    
  }

  return outString
}

print("Szukam Lizbony: ")
var l = searchCity("Lisbon")
print(l)

print()
print("S??oneczne miejsca: ")
var k = searchCityByTag("S??o??ce")
for i in 0...(k.count-1) {
  print(k[i].name)
}
print()

print("Odleg??o???? mi??dzy Bydgoszcz?? a Tokio wynosi \(calcDistance(bdg.latitude, bdg.longitude, tok.latitude, tok.longitude)) km.")

print()
print(calcClosestAndFurthest(30.0, 10.0))
print()
print(calcFurthestCities())

print()
print("Miasta z 5-gwiazdkowymi restauracjami: \(findHighRatedCities())")

print()
print("Lokacje w Bydgoszczy:")
print(findLocations(bdg))

print()
print(countFiveStarsLocations())

















