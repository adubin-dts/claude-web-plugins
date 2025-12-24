# Claude Web Plugins

This repository enables plugins and skills to work with Claude Code on the web (claude.ai/code).

## Background

Claude Code CLI supports plugins via `/plugin install`, but Claude Code Web runs in an isolated sandbox without plugin marketplace access. However, Claude Code Web can:
- Read files from the cloned GitHub repository
- Execute SessionStart hooks defined in `.claude/settings.json`
- Discover and use Skills from `.claude/skills/` directories
- Read and apply `CLAUDE.md` instructions

This repository embeds plugin contents directly in the `.claude/` directory structure, making them available in Claude Code Web.

## What's Included

### Plugins

**From [Superpowers](https://github.com/obra/superpowers)** (obra):
- Skills for brainstorming, planning, TDD, debugging, code review workflows
- Commands: `/brainstorm`, `/write-plan`, `/execute-plan`
- Agents: code-reviewer

**From [Anthropic Plugins](https://github.com/anthropics/claude-code/tree/main/.plugins)**:
- **feature-dev** - Feature development workflow
- **hookify** - Hook management system
- **security-guidance** - Security reminders on file edits
- **code-review** - Code review capabilities
- **frontend-design** - Frontend design patterns
- **pr-review-toolkit** - PR review tools
- **ralph-wiggum** - Iterative development loops

### Skills (16 total)
Located in `.claude/skills/`:
- `using-superpowers` - Core skill for using other skills
- `brainstorming` - Interactive design refinement
- `writing-plans` - Create implementation plans
- `executing-plans` - Execute plans with checkpoints
- `test-driven-development` - TDD workflow
- `systematic-debugging` - Methodical bug diagnosis
- `using-git-worktrees` - Create isolated workspaces
- `dispatching-parallel-agents` - Run multiple agents
- `subagent-driven-development` - Implementation with subagents
- `requesting-code-review` - Request code reviews
- `receiving-code-review` - Handle review feedback
- `finishing-a-development-branch` - Complete dev work
- `verification-before-completion` - Verify before completion
- `writing-skills` - Create new skills
- `frontend-design` - Frontend design patterns
- `writing-rules` - Writing best practices

### Commands (14 total)
Located in `.claude/commands/`

### Agents (11 total)
Located in `.claude/agents/`

## How It Works

1. When you start a Claude Code Web session with this repo, it clones to Anthropic's VM
2. The SessionStart hook runs and injects skill context
3. Claude sees the skill descriptions and follows them based on task context
4. Hooks provide additional capabilities (security reminders, etc.)

## Usage

### Option 1: Use This Repository Directly
1. Fork or clone this repository to your GitHub account
2. Go to [claude.ai/code](https://claude.ai/code)
3. Connect your GitHub and select this repository
4. Start a session

### Option 2: Add to an Existing Repository

```bash
# Clone this repo
git clone https://github.com/adubin-dts/claude-web-plugins.git

# Install to your target repo
./claude-web-plugins/install.sh /path/to/your/repo

# Commit the .claude/ directory
cd /path/to/your/repo
git add .claude/
git commit -m "Add Claude Web plugins"
```

## Verification

To verify plugins are working:

1. **Check initialization**: At session start, Claude should acknowledge having skills
2. **Test workflow**: Ask Claude to "build a simple calculator" - it should brainstorm first, not code immediately
3. **Check skills**: Ask "What skills do you have available?"
4. **Test commands**: Try `/brainstorm "build a todo app"`

## Credits

- [Superpowers plugin](https://github.com/obra/superpowers) by Jesse Vincent
- [Anthropic plugins](https://github.com/anthropics/claude-code/tree/main/.plugins) by Anthropic

## License

MIT License
