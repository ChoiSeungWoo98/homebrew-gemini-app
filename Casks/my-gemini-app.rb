cask "my-gemini-app" do
  # 1. 버전: GitHub Release 태그와 일치해야 합니다. (v는 제외)
  version "1.0.1"
  
  # 2. SHA256 체크섬: 아래 'shasum' 명령어로 계산한 값을 여기에 붙여넣으세요.
  sha256 "5375fe404b8f7ea806935e7c67567329a1c4c6a2073eb8ab966d7068f1a81adb"

  # 3. 다운로드 URL: GitHub Release에 있는 .dmg 파일의 다운로드 주소입니다.
  url "https://github.com/ChoiSeungWoo98/gemini_app/releases/download/v#{version}/My.Gemini.App-#{version}-arm64.dmg"
  
  # 4. 앱 이름과 홈페이지
  name "My Gemini App"
  homepage "https://github.com/ChoiSeungWoo98/gemini_app"

  # 5. 실제 설치될 .app 파일의 이름
  app "My Gemini App.app"
end
