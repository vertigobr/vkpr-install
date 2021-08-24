#!/bin/sh
echo "VKPR install script"
echo "==================="
curl -fsSL https://commons-repo.ritchiecli.io/install.sh | bash
rit add repo --provider="Github" --name="vkpr-cli" --repoUrl="https://github.com/vertigobr/vkpr-cli"
rit vkpr init
