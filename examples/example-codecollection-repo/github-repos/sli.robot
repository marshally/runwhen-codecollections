** Settings **
Documentation   Check GitHub latency by getting a list of repo names.
Metadata        Name        github-get-repos-latency
Metadata        Type        SLI
Metadata        Author      Vui Le
Force Tags      github   latency
Library         RW.Core
Library         RW.GitHub

** Tasks **
Check GitHub Latency With Get Repos
    Import User Secret      GITHUB_TOKEN
    Import User Secret      GITHUB_USER
    Import User Variable    GITHUB_REPO_NAME
    Import User Variable    SERVICE_DESCR

    ${res} =                Get Repo   user=${GITHUB_USER}   name=${GITHUB_REPO_NAME}   token=${GITHUB_TOKEN}
    Log                     ${res}
    Push Metric             ${res.latency}   descr=${SERVICE_DESCR}