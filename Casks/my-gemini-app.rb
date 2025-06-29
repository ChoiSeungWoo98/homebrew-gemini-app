cask "my-gemini-app" do
  # 1. 버전: GitHub Release 태그와 일치해야 합니다. (v는 제외)
  version "1.0.6"
  
  # 2. SHA256 체크섬: 아래 'shasum' 명령어로 계산한 값을 여기에 붙여넣으세요.
  sha256 "81565d0207080c67aa706e9cfa5afd451ce6d99d95d1a994abad6d5ee185d50c"

  # 3. 다운로드 URL: GitHub Release에 있는 .dmg 파일의 다운로드 주소입니다.
  url "https://github.com/ChoiSeungWoo98/gemini_app/releases/download/v1.0.6/Gemini-1.0.6-arm64.dmg"
  
  # 4. 앱 이름과 홈페이지
  name "My Gemini App"
  homepage "https://github.com/ChoiSeungWoo98/gemini_app"

  # 5. 실제 설치될 .app 파일의 이름
  app "My Gemini App.app"

  # 추가된 부분: '손상된 앱' 오류를 해결하기 위해
  # macOS가 인터넷에서 다운로드한 파일에 부여하는 '격리' 속성을 제거합니다.
  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/My Gemini App.app"]
  end

  # 추가된 부분: 앱을 완전히 제거할 때 관련 데이터도 함께 삭제합니다.
  # (appId는 package.json에 명시된 값입니다)
  zap trash: [
    "~/Library/Application Support/My Gemini App",
    "~/Library/Saved Application State/com.choiseu.gemini-app.savedState",
    "~/Library/Preferences/com.choiseu.gemini-app.plist",
  ]
end
