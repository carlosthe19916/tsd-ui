## Overview

This is an organizational directory, not a repository of code. It contains subdirectories for each project that operate organizationally under a single umbrella. The purpose of this `tsd-components` directory is to provide context for each project without polluting their respective code bases.

## TSD Projects

TSD projects to be included:

- Red Hat Developer Hub (RHDH) plugins, or DH for short
- Red Hat Trusted Artifact Signer (RHTAS), or TAS for short
- Red Hat Trusted Profile Analyzer (RHTPA), or TPA for short

Please see the subdirectories for some more information about each project. For example, they might have screenshots and a list of features.

In production, all of these projects are deployed on OpenShift.

Locally, these are the directories for each project:

- TAS frontend: ~/projects/rhtas-console-ui
- TAS backend: ~/projects/rhtas-console
- TPA frontend: ~/projects/trustify-ui
- TPA backend: ~/projects/trustify
- DH:
  - ~/projects/community-plugins/tekton
  - ~/projects/community-plugins/jenkins
  - ~/projects/community-plugins/redhat-argocd
  - ~/projects/community-plugins/multi-source-security-viewer
  - ~/projects/community-plugins/azure-devops
  - ~/projects/community-plugins/quay
