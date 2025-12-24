# CLAUDE.md - Claude Web Plugins

This repository has plugins and skills configured for Claude Code Web.

## Workflow

Before writing ANY code:
1. **Brainstorm first** - Use the brainstorming skill to explore requirements and design
2. **Plan second** - Create a detailed implementation plan
3. **Implement with TDD** - Write tests first, then implementation

## Key Skills

Available in `.claude/skills/`:

- **brainstorming**: MUST use before any creative work (features, components, modifications)
- **writing-plans**: Create detailed implementation plans with bite-sized tasks
- **test-driven-development**: Red-green-refactor cycle
- **systematic-debugging**: Methodical bug diagnosis (gather evidence before theorizing)
- **verification-before-completion**: Verify with evidence before claiming success
- **frontend-design**: Frontend design patterns and best practices

## Slash Commands

- `/brainstorm` - Start interactive design session
- `/write-plan` - Create implementation plan
- `/execute-plan` - Execute plan with checkpoints
- `/code-review` - Request code review
- `/feature-dev` - Feature development workflow

## Rules

1. Check for applicable skills BEFORE responding (even for clarifying questions)
2. If a skill might apply (even 1% chance), invoke it first
3. Never skip the brainstorming phase for creative work
4. Always verify with tests before claiming completion
