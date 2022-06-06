import Foundation

enum FeedType {
  case followedFeed
  case sponsoredFeed
  case reelsFeed
}

class Date {
  var day: Int
  var month: Int
  var year: Int
  init(_ day: Int, _ month: Int, _ year: Int) {
    self.day = day
    self.month = month
    self.year = year
  }
  func show() -> String {
     return "\(day).\(month).\(year)"
    
  }
}

class Content {
  var type: String = "None"
  var name: String
  var format: String
  var width: Int
  var height: Int
  var date: Date!
  init?(_ name: String, _ format: String, _ width: Int, _ height: Int, _ date: Date! = nil) {
      self.name = name
      self.format = format
      self.width = width
      self.height = height
      self.date = date
  }
}

class Picture : Content {
     override init?(_ name: String, _ format: String, _ width: Int, _ height: Int, _ date: Date! = nil) {
      if (width <= 0 || height <= 0) {
        return nil
      } else {
        super.init(name, format, width, height, date)
        self.type = "Picture"
      }
  }
}

class Video : Content {
  var length: Float
    init?(_ name: String, _ format: String, _ width: Int, _ height: Int, _ length: Float, _ date: Date! = nil) {
      if (width <= 0 || height <= 0 || length <= 0) {
        return nil
      } else {
        self.length = length
        super.init(name, format, width, height, date)
        self.type = "Video"
      }
  }
}

class User {
  var nickname: String
  var followers: Int
  var followed: Int
  var posts: [Content]!
  init(_ nickname: String, _ followers: Int, _ followed: Int, _ posts: [Content]! = nil) {
    self.nickname = nickname
    self.followers = followers
    self.followed = followed
    self.posts = posts
  }
}


struct Options {
  
  var type: FeedType
  var feedOptions: [String]

  init(_ type: FeedType) {
    self.type = type
    switch type {
      case .followedFeed:
          self.feedOptions = ["share", "link", "report", "info"]
      case .sponsoredFeed:
          self.feedOptions = ["report", "hide", "info"]
      case .reelsFeed:
          self.feedOptions = ["stitch", "duet", "share", "link", "report", "info"]
      }
  }
}


class ContentContainer {
  
  var profileLogo: Picture
  var profileName: String
  var mainContent: Video
  var optionsMenu: Options

  init(_ profileLogo: Picture, _ profileName: String, _ mainContent: Video, _ optionsMenu: Options) {
    self.profileLogo = profileLogo
    self.profileName = profileName
    self.mainContent = mainContent
    self.optionsMenu = optionsMenu
  }

  func showDetails() -> Void {
    print("Container description\n")
    print("Profile details:")
    print("\t - profile name: \(profileName)")
    print("\t - profile logo:")
    print("\t\t * '\(profileLogo.name)\(profileLogo.format)'")
    print("\t\t * \(profileLogo.width)x\(profileLogo.height)")
    print("\nContent details:")
    print("\t - content type: \(mainContent.type)")
    print("\t - content name: \(mainContent.name)")
    print("\t - publication date: \(mainContent.date.show())")
    print("\t - content description:")
    print("\t\t * '\(mainContent.name)\(mainContent.format)'")
    print("\t\t * \(mainContent.width)x\(mainContent.height)")
    if(mainContent.type == "Video") {
          print("\t\t * \(mainContent.length*60) s")
    }
  } 
  
}

let pl = Picture("samsung_logo", ".png", 400, 400)
let pn = "samsungpolska"
let mc = Video("Prezentacja Galaxy S20", ".mp4", 1600, 1600, 1.20, Date(14,3,2022))
let om = Options(FeedType.sponsoredFeed)

//nie robić tego tak - na potrzeby zadania (zakładamy że pliki mają poprawne wymiary) wpisałem '!' do wartości Optional.
let cc = ContentContainer(pl!, pn, mc!, om)


class ActionBar {
  var like: Bool
  var comment: String!
  var share: [User]!
  init(_ like: Bool, _ comment: String! = nil, _ share: [User]! = nil) {
    self.like = like
    self.comment = comment
    self.share = share
  }

    func showDetails() -> Void {
        if(like == true) {
            print("\nYou liked this post!")
        } else {
            print("\nYou don't like this post.")
        }
        
    }

}


class ReactionsBar {
  var likes: Int
  var friendsLiked: [User]!
  init(_ likes: Int, _ friendsLiked: [User]! = nil) {
      self.likes = likes
      self.friendsLiked = friendsLiked
  }

  func showDetails() -> Void {
    var likesOut: String = "nobody"
    if(likes>0 && likes<999) {
      likesOut = "\(likes)"
    }
    else if(likes>=1000 && likes<10000) {
      let t1 = likes/1000
      let t2 = likes%1000
      likesOut = "\(t1) \(t2)"
    }
    else if(likes>=10000 && likes<99999) {
      let tmp1 = likes/1000
      var tmp2 = likes%1000
      tmp2 = tmp2 / 100
      likesOut = "\(tmp1).\(tmp2)k"
    } else if(likes>=100000 && likes<999999) {
      let temp = likes/1000
      likesOut = "\(temp)k"
    } else if(likes>=1000000) {
      let temp1 = likes/1000000
      var temp2 = likes%1000000
      temp2 = temp2/100000
      likesOut = "\(temp1).\(temp2)m"
    }
    
    var friendsList: String = "" 
      for f in friendsLiked {
          friendsList += " \(f.nickname) and"
      }
      print("\nLiked by\(friendsList) \(likesOut) others")
      
  }
}


struct DescriptionBar {
  var profileName: String
  var description: String
  init(_ profileName: String, _ description: String) {
      self.profileName = profileName
      self.description = description
  }

  func showDetails() -> Void {
      print("\n\(profileName): \(description)")
  }
}

let u1 = User("ehhkuba", 430, 1131)
let u2 = User("jakub.plvta", 241, 172)
let ab = ActionBar(true, nil, [u1, u2]) 
let rb = ReactionsBar(2832, [u1, u2])
let db = DescriptionBar("samsungpolska", "Królowie nocy w przestrzeni nowych możliwości 💫")

public class FeedContent {
  var contentContainer: ContentContainer
  var actionBar: ActionBar
  var reactionsBar: ReactionsBar
  var descriptionBar: DescriptionBar
  init(_ contentContainer: ContentContainer, _ actionBar: ActionBar, _ reactionsBar: ReactionsBar, _ descriptionBar: DescriptionBar) {
    self.contentContainer = contentContainer
    self.actionBar = actionBar
    self.reactionsBar = reactionsBar
    self.descriptionBar = descriptionBar
  }

  func showAllDetails() -> Void {
      contentContainer.showDetails()
      actionBar.showDetails()
      reactionsBar.showDetails()
      descriptionBar.showDetails()
  }

}

let fc = FeedContent(cc, ab, rb, db)
fc.showAllDetails()