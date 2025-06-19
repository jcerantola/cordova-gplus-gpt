# cordova-gplus-gpt

Fork do `cordova-plugin-googleplus`, atualizado para funcionar com as versões mais recentes do FirebaseX (18+) e Xcode 16. Compatível com `cordova-ios@7.1.1`.

---

## ✅ Funcionalidades

- Login com Google no iOS (compatível com `FirebaseX >= 18.0.0`)
- Compatível com o novo SDK `GoogleSignIn 6+`
- Suporte ao `REVERSED_CLIENT_ID` via `plugin.xml`
- Atualizado para projetos com `cordova-ios 6+` e `cordova-android 10+`

---

## 📦 Instalação

```bash
cordova plugin add https://github.com/jcerantola/cordova-gplus-gpt.git \
  --variable REVERSED_CLIENT_ID=com.googleusercontent.apps.1234567890-abcdefg1234567 \
  --variable PLAY_SERVICES_VERSION=21.0.1
