#!/bin/bash

claude --permission-mode acceptEdits "@PRD.md @agent-progress.md \
1. Read PRD.md and agent-progress.md. \
2. Find the next incomplete task (status: planned/in-progress in the roadmap). \
3. Implement it completely with tests. \
4. Update the feature status in PRD.md (check the acceptance criteria box). \
5. Commit your changes (pre-commit hooks will enforce quality automatically). \
6. Update agent-progress.md with what you did, and the next task (if applicable). \
7. EXIT IMMEDIATELY - do not process any additional tasks."
