#!/bin/bash

claude --permission-mode acceptEdits "@PRD.json @agent-progress.md \
1. Read PRD.json and agent-progress.md. \
2. Find the next incomplete task (status not passes; dependencies satisfied). \
3. Implement it completely with tests. \
4. Update the feature status to passes in PRD.json when done. \
5. Commit your changes. \
6. Update agent-progress.md with what you did, and the next task (if applicable). \
7. EXIT IMMEDIATELY - do not process any additional tasks."
