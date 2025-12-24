# CLAUDE.md - Superpowers-Enabled Repository

This repository has Superpowers skills configured. Follow the Superpowers workflow for all tasks.

## The Superpowers Workflow

Before writing ANY code:
1. **Brainstorm first** - Use the brainstorming skill to explore requirements and design
2. **Plan second** - Create a detailed implementation plan
3. **Implement with TDD** - Write tests first, then implementation

## Key Skills

The following skills are available in `.claude/skills/`:

- **brainstorming**: MUST use before any creative work (features, components, modifications)
- **writing-plans**: Create detailed implementation plans with bite-sized tasks
- **test-driven-development**: Red-green-refactor cycle
- **systematic-debugging**: Methodical bug diagnosis (gather evidence before theorizing)
- **verification-before-completion**: Verify with evidence before claiming success

## Slash Commands

- `/brainstorm` - Start interactive design session
- `/write-plan` - Create implementation plan
- `/execute-plan` - Execute plan with checkpoints

## Rules

1. Check for applicable skills BEFORE responding (even for clarifying questions)
2. If a skill might apply (even 1% chance), invoke it first
3. Never skip the brainstorming phase for creative work
4. Always verify with tests before claiming completion
