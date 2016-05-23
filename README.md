# cmlp
La aplicacion corre, sin embargo agradecere fijarse en:

Segun los mensajes del debugger del xcode, se activa la funcion didFailToReceiveAdWithError error: NSError!.

Inmediatamente sale un mensaje extraño: ADBannerView: Unhandled error (no delegate or delegate does not implement didFailToReceiveAdWithError:): Error Domain=ADErrorDomain Code=7 "Ad was unloaded from this banner" UserInfo={ADInternalErrorCode=7, ADInternalErrorDomain=ADErrorDomain, NSLocalizedFailureReason=Ad was unloaded from this banner}
(segun stackoverflow, es un bug del simulador pues la app corre bien).

Si bien el iAD se muestra, cuando se regresa a la pagina otra vez, ya no sale igual.
