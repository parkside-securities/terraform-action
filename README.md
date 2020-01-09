# Terraform Github Action.

This Action runs init and plan or apply against a list of directories (such as those found in `terraform-live`).  If all plans succeed, and diffs are detected, then any diff (plan -out) files are stored as artifacts in Actions.  These should be applied during the PR Merge workflow.

Additionally, any diffs or errors are included in the PR comments.
![](https://user-images.githubusercontent.com/39421615/71298410-cba7c080-233c-11ea-8738-93d91ab7e148.png)

This Action has two required inputs:

| INPUT                         | DESCRIPTION                                                    |
|-------------------------------|----------------------------------------------------------------|
| dirs                          | Colon delimited list of directories to process.                |
| cmd                           | Command to run.  Valid choices are `plan | apply | test`.      |


Additionally, several environment variables are required:

| VARIABLE                      | DESCRIPTION                                                    |
|-------------------------------|----------------------------------------------------------------|
| TERRAFORM_VERSION             | Version of Terraform to use.                                   |
| KUBECTL_VERSION               | Version of Kubectl to use.                                     |
| HELM_VERSION                  | Version of Kubectl to use.                                     |
| DIRENV_VERSION                | Version of Direnv to use.                                      |
| ENVKEY_VERSION                | Version of envkey-source to use.                               |
| AWS_IAM_AUTHENTICATOR_VERSION | Version of aws-iam-authenticator to use.                       |
| ARTIFACTS_DIR                 | Directory to store generated plan files.                       |
| TERRAFORM_TOKEN               | Terraform Cloud API key (Store in GitHub Secrets).             |
| SSH_PRIV_KEY                  | SSH private key (for TF modules) (Store in GitHub Secrets).    |
| GITHUB_TOKEN                  | GitHub API token (Supplied by default in secrets.GITHUB_TOKEN).|
| DRYRUN                        | Apply will not run unless this is explicitly set to 'false'.   |

See: examples/pr_workflow.yaml