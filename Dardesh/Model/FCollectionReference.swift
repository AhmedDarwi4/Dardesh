//
//  FCollectionReference.swift
//  Dardesh
//
//  Created by visions tech mac 3 on 8/13/21.
//

import Foundation
import Firebase

enum myCollection:String {
    case User
}

func FirestoreReference (collectionReference:myCollection) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}



