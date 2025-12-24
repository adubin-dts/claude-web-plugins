# Claude Code Web + Superpowers Test Repository

This repository enables the [Superpowers plugin](https://github.com/obra/superpowers) functionality to work with Claude Code on the web (claude.ai/code).

## Background

Claude Code CLI supports plugins via `/plugin install`, but Claude Code Web runs in an isolated sandbox without plugin marketplace access. However, Claude Code Web can:
- Read files from the cloned GitHub repository
- Execute SessionStart hooks defined in `.claude/settings.json`
- Discover and use Skills from `.claude/skills/` directories
- Read and apply `CLAUDE.md` instructions

This repository embeds the Superpowers plugin directly in the `.claude/` directory structure.

## What's Included

### Skills (14 total)
Located in `.claude/skills/`:
- `using-superpowers` - Core skill that teaches Claude how to use other skills
- `brainstorming` - Interactive design refinement before coding
- `writing-plans` - Create detailed implementation plans
- `executing-plans` - Execute plans with review checkpoints
- `test-driven-development` - TDD workflow
- `systematic-debugging` - Methodical bug diagnosis
- `using-git-worktrees` - Create isolated workspaces
- `dispatching-parallel-agents` - Run multiple agents concurrently
- `subagent-driven-development` - Implementation with subagents
- `requesting-code-review` - Request code reviews
- `receiving-code-review` - Handle code review feedback
- `finishing-a-development-branch` - Complete development work
- `verification-before-completion` - Verify before claiming completion
- `writing-skills` - Create new skills

### Commands
Located in `.claude/commands/`:
- `/brainstorm` - Start brainstorming session
- `/write-plan` - Create implementation plan
- `/execute-plan` - Execute plan in batches

### Agents
Located in `.claude/agents/`:
- `code-reviewer` - Review completed work against plans

### Hooks
Located in `.claude/hooks/`:
- `session-start.sh` - Injects Superpowers context at session start

## How It Works

1. When you start a Claude Code Web session with this repo, it clones to Anthropic's VM
2. The SessionStart hook runs and injects the `using-superpowers` skill content
3. Claude sees the skill descriptions and follows them automatically based on task context
4. When you ask Claude to "build something," it follows the brainstorm->plan->implement workflow

## Usage

### Option 1: Use This Repository Directly
1. Fork or clone this repository to your GitHub account
2. Go to [claude.ai/code](https://claude.ai/code)
3. Connect your GitHub and select this repository
4. Start a session

### Option 2: Add Superpowers to an Existing Repository
Copy the `.claude/` directory from this repository to your project.

## Verification

To verify Superpowers is working:

1. **Check initialization**: At session start, you should see Claude mention it has Superpowers

2. **Test workflow trigger**: Ask Claude to "build a simple calculator." Claude should:
   - NOT immediately start coding
   - Start asking clarifying questions (brainstorming phase)
   - Follow the brainstorm -> plan -> implement workflow

3. **Check skills**: Ask "What skills do you have available?"

4. **Test commands**: Try `/brainstorm "build a todo app"`

## Expected Behavior

When Superpowers is working correctly, Claude will:

- **Before any creative work**: Use the brainstorming skill to explore requirements
- **Before implementation**: Create a detailed plan
- **During implementation**: Follow TDD practices
- **When debugging**: Use systematic debugging approach
- **Before claiming completion**: Verify with tests and evidence

## Credits

This repository contains the [Superpowers plugin](https://github.com/obra/superpowers) by Jesse Vincent, restructured for Claude Code Web compatibility.

## License

MIT License (same as original Superpowers plugin)
