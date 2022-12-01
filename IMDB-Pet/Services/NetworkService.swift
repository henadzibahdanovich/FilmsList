//
//  NetworkService.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class NetworkService {
    func mokRequestPopularMedia() -> Observable<[MediaInfo]> {
        return Observable.create { (observer) -> Disposable in
            if let path = Bundle.main.path(forResource: "PopularMedia", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let mediaInfoArray = try JSONDecoder().decode(MediaInfoResponseData.self, from: data)
                    observer.onNext(mediaInfoArray.data.popularity)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func requestPopularMedia() -> Observable<[MediaInfo]> {
        return Observable.create { (observer) -> Disposable in
            let headers = [
                "X-RapidAPI-Key": "",
                "X-RapidAPI-Host": "flixster.p.rapidapi.com"
            ]

            let request = NSMutableURLRequest(
                url: NSURL(
                    string: "https://flixster.p.rapidapi.com/movies/get-popularity?zipCode=90002&radius=50"
                )! as URL,
                cachePolicy: .useProtocolCachePolicy,
                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(
                with: request as URLRequest,
                completionHandler: { data, response, error -> Void in
                    if let error {
                        observer.onError(error)
                    } else {
                        guard let data else { return }
                        
                        do {
                            let mediaInfoArray = try JSONDecoder().decode(MediaInfoResponseData.self, from: data)
                            observer.onNext(mediaInfoArray.data.popularity)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                        }
                    }
                }
            )
            
            dataTask.resume()
            
            return Disposables.create()
        }
    }
}
