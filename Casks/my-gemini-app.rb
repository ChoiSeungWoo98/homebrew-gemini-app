cask "my-gemini-app" do
  # 1. 버전: GitHub Release 태그와 일치해야 합니다. (v는 제외)
  version "1.0.12"
  
  # 2. SHA256 체크섬: 아래 'shasum' 명령어로 계산한 값을 여기에 붙여넣으세요.
  sha256 "df1f9668ae863f2230513ecce99453eff1c4d8cae8c8ca816c756098431b9182"

  # 3. 다운로드 URL: GitHub Release에 있는 .dmg 파일의 다운로드 주소입니다.
  url "https://github.com/ChoiSeungWoo98/gemini_app/releases/download/v1.0.12/Gemini-1.0.12-arm64.dmg"
  
  # 4. 앱 이름과 홈페이지
  name "Gemini"
  homepage "https://github.com/ChoiSeungWoo98/gemini_app"

  # 5. 실제 설치될 .app 파일의 이름
    app "Gemini.app"

  # 추가된 부분: '손상된 앱' 오류를 해결하기 위해
  # macOS가 인터넷에서 다운로드한 파일에 부여하는 '격리' 속성을 제거합니다.
  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/Gemini.app"]
  end

  # 추가된 부분: 앱을 완전히 제거할 때 관련 데이터도 함께 삭제합니다.
  # (appId는 package.json에 명시된 값입니다)
  zap trash: [
    "~/Library/Application Support/Gemini",
    "~/Library/Saved Application State/com.choiseu.gemini-app.savedState",
    "~/Library/Preferences/com.choiseu.gemini-app.plist",
  ]
end
