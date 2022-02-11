//
//  PaymentHandler.swift
//  SmartVend
//
//  Created by Devin Allen on 2/9/22.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    static let supportedNetwork: [PKPaymentNetwork] = [
        .visa,
        .masterCard,
        .amex
    ]
    
    func startPayment(products: [Product], total: Int, completion: @escaping PaymentCompletionHandler) {
            completionHandler = completion

            
            paymentSummaryItems = []

            
            products.forEach { product in
                let item = PKPaymentSummaryItem(label: product.name, amount: NSDecimalNumber(string: "\(product.price).00"), type: .final)
                paymentSummaryItems.append(item)
            }

          
            let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "\(total).00"), type: .final)
            paymentSummaryItems.append(total)

            
            let paymentRequest = PKPaymentRequest()
            paymentRequest.paymentSummaryItems = paymentSummaryItems
            paymentRequest.merchantIdentifier = "merchant.SmartAppDemo2"
            paymentRequest.merchantCapabilities = .capability3DS
            paymentRequest.countryCode = "US"
            paymentRequest.currencyCode = "USD"
            paymentRequest.supportedNetworks = PaymentHandler.supportedNetwork
            
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
                 paymentController?.delegate = self
        
                    
                 paymentController?.present(completion: { (presented: Bool) in
                     if presented {
                         debugPrint("Presented payment controller")
                     } else {
                         debugPrint("Failed to present payment controller")
                     }
                 })
             }
         }

        
         extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

            
             func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {

                 let errors = [Error]()
                 let status = PKPaymentAuthorizationStatus.success

                 self.paymentStatus = status
                 completion(PKPaymentAuthorizationResult(status: status, errors: errors))
             }

             func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
                 controller.dismiss {
                    
                     DispatchQueue.main.async {
                         if self.paymentStatus == .success {
                             if let completionHandler = self.completionHandler {
                                 completionHandler(true)
                             }
                         } else {
                             if let completionHandler = self.completionHandler {
                                 completionHandler(false)
                             }
                         }
                     }
                 }
             }
         }

    


