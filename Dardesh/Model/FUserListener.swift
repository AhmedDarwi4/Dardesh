//
//  FUserListener.swift
//  Dardesh
//
//  Created by visions tech mac 3 on 8/14/21.
//

import Foundation
import Firebase
class FUserListener {
    static let shared = FUserListener()
    private init (){}
    
    // MARK:- Login
    
    
    
    // MARK:- Register
    
    func registerUserWith(email:String,password:String,completion:@escaping (_ error: Error?) ->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(error)
            if error == nil {
                authResult?.user.sendEmailVerification(completion: { (error) in
                    print(error?.localizedDescription)})
                completion(error)
            }
            if authResult != nil {
                let user = User(id: authResult!.user.uid, username: email, email: email, pushId: "", avatarLink: "", status: "Hi there, im using Dardesh")
                
                self.saveUserToFireStore(user)
            }
        }
        
    }

    private func saveUserToFireStore(_ user:User){
        do{
            try FirestoreReference(collectionReference: .User).document(user.id) .setData(from: user)
        }
        catch{
            print(error.localizedDescription)
        }
    }
   
    
}






