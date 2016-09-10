//
//  FitbitAPI.swift
//  MoveUrButt
//
//  Created by Wang Yujia on 8/9/16.
//  Copyright © 2016 National University of Singapore Design Centric Program. All rights reserved.
//

import Foundation
import OAuth2Swift

print("start connecting API")

let oauthswift = OAuth2Swift(
    consumerKey:    "227ZCL",
    consumerSecret: "e617015b19be038a7544069b50b3a6a4",
    authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
    responseType:   "code"
)

oauthswift.authorizeWithCallbackURL(
    NSURL(string: "nusdcp2016.moveurbutt://")!,
    scope: ["activity", "heartrate"],
    // state:"", optional, Fitbit strongly recommend including an anti-forgery token in this parameter and confirming its value in the redirect to mitigate against cross-site request forgery (CSRF).
    success: { credential, response, parameters in
        print(credential.oauth_token)
    },
    failure: { error in
        print(error.localizedDescription)
    }
)

oauthswift.client.get("https://api.fitbit.com/",
                      success: {
                        data, response in
                        let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
                        print(dataString)
                        print("success")
    }
    , failure: { error in
        print(error)
    }
)







