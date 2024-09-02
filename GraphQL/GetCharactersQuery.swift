//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import Apollo

class GetCharactersQuery: GraphQLQuery {
    let operationDefinition: String = """
    query GetCharacters {
      characters {
        results {
          id
          name
          status
          species
          type
          gender
          image
        }
      }
    }
    """

    let operationName: String = "GetCharacters"
    let variables: GraphQLMap? = nil

    struct Data: GraphQLSelectionSet {
        static let possibleTypes: [String] = ["Query"]

        static var selections: [GraphQLSelection] {
            return [
                GraphQLField("characters", type: .object(Character.selections)),
            ]
        }

        var resultMap: ResultMap

        init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }

        var characters: Character? {
            get {
                return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "characters")
            }
        }

        struct Character: GraphQLSelectionSet {
            static let possibleTypes: [String] = ["Characters"]

            static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("results", type: .list(.object(Result.selections))),
                ]
            }

            var resultMap: ResultMap

            init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
            }

            var results: [Result]? {
                get {
                    return (resultMap["results"] as? [ResultMap]).flatMap { $0.map { Result(unsafeResultMap: $0) } }
                }
                set {
                    resultMap.updateValue(newValue?.map { $0.resultMap }, forKey: "results")
                }
            }

            struct Result: GraphQLSelectionSet {
                static let possibleTypes: [String] = ["Character"]

                static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("id", type: .nonNull(.scalar(String.self))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                        GraphQLField("status", type: .nonNull(.scalar(String.self))),
                        GraphQLField("species", type: .nonNull(.scalar(String.self))),
                        GraphQLField("type", type: .scalar(String.self)),
                        GraphQLField("gender", type: .nonNull(.scalar(String.self))),
                        GraphQLField("image", type: .nonNull(.scalar(String.self))),
                    ]
                }

                var resultMap: ResultMap

                init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                }

                var id: String {
                    return resultMap["id"]! as! String
                }

                var name: String {
                    return resultMap["name"]! as! String
                }

                var status: String {
                    return resultMap["status"]! as! String
                }

                var species: String {
                    return resultMap["species"]! as! String
                }

                var type: String? {
                    return resultMap["type"] as? String
                }

                var gender: String {
                    return resultMap["gender"]! as! String
                }

                var image: String {
                    return resultMap["image"]! as! String
                }
            }
        }
    }
}
