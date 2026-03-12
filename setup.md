# Helix Setup

## Tree-sitter SQL Injection

문자열 안의 SQL 쿼리에 자동으로 SQL 구문 강조를 적용한다.
`runtime/queries/` 디렉토리는 심볼릭 링크로 gitignore 되어 있으므로, 새 환경에서 수동으로 추가해야 한다.

injection 파일 경로:
- **macOS (소스 빌드)**: `~/dev/helix/runtime/queries/<lang>/injections.scm`
- **CachyOS Linux (pacman)**: `~/.config/helix/runtime/queries/<lang>/injections.scm` (오버라이드 디렉토리, 없으면 생성)

### Go

`runtime/queries/go/injections.scm` 파일 끝에 추가:

```scm
; SQL: highlight SQL keywords in string literals
(([
   (interpreted_string_literal_content)
   (raw_string_literal_content)
 ] @injection.content
 (#match? @injection.content "(?ism)(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP).+(FROM|INTO|VALUES|SET|TABLE|INDEX)")
 )
(#set! injection.language "sql")
)
```

### Python

`runtime/queries/python/injections.scm` 파일 끝에 추가:

```scm
; SQL: highlight SQL keywords in string literals
((string_content) @injection.content
 (#match? @injection.content "(?ism)^(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP).*?(FROM|INTO|VALUES|SET|TABLE|INDEX)")
 (#set! injection.language "sql"))
```
