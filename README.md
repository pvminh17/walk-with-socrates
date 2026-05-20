# Walk With Socrates

A Claude Code skill that turns Claude into **Socrates** — a patient, sharp thinking partner who uses the Socratic method to help you clarify ideas, surface hidden assumptions, test evidence, and find contradictions instead of handing you a quick answer.

The goal is not to corner you. The goal is to help you walk away with a stronger, more grounded idea than the one you walked in with.

## What it does

When invoked, Claude stops behaving like a generic advice chatbot and starts behaving like Socrates. It will:

- Ask few questions, but deep ones (never more than 3 at a time)
- Use your own words back to you to keep the conversation honest
- Surface the assumptions your idea quietly depends on
- Probe for evidence and look for contradictions
- Reflect your reasoning back as a "gift, not a verdict"
- End with the smallest possible test you could run to validate your idea

It will *not* flatter you, dump checklists on you, or solve the problem for you too early.

## When to use it

Invoke the skill when you want to:

- Stress-test an idea or a decision before committing
- Pressure-test the assumptions inside a plan
- Get unstuck from circular thinking
- Sharpen vague language ("better", "effective", "users need it")
- Be challenged with care, not attacked

Trigger phrases the skill listens for:

- "walk with Socrates"
- "ask me questions"
- "dig deeper with me"
- "challenge this idea"

## Installation

This skill works with [Claude Code](https://claude.com/claude-code). You can install it at two scopes.

### Option 1: User scope (available across all your projects)

```bash
git clone https://github.com/pvminh17/claude-skill-walk-with-socrates.git \
  ~/.claude/skills/walk-with-socrates
```

### Option 2: Project scope (only inside one project)

From the root of the project you want the skill in:

```bash
mkdir -p .claude/skills
git clone https://github.com/pvminh17/claude-skill-walk-with-socrates.git \
  .claude/skills/walk-with-socrates
```

### Option 3: One-line install script

```bash
curl -fsSL https://raw.githubusercontent.com/pvminh17/claude-skill-walk-with-socrates/main/install.sh | bash
```

By default the script installs to user scope (`~/.claude/skills/walk-with-socrates`). Pass `--project` to install into the current project's `.claude/skills/` instead:

```bash
curl -fsSL https://raw.githubusercontent.com/pvminh17/claude-skill-walk-with-socrates/main/install.sh | bash -s -- --project
```

## Verifying installation

Open Claude Code and run:

```
/skills
```

You should see `walk-with-socrates` in the list. Then try:

> walk with Socrates — I want to stress-test an idea

Claude should answer in the voice of Socrates, not as a regular assistant.

## Updating

```bash
cd ~/.claude/skills/walk-with-socrates && git pull
```

## Uninstalling

```bash
rm -rf ~/.claude/skills/walk-with-socrates
```

(Or the project-scope path, if you installed it there.)

## Customising the skill

The whole skill is a single file: [`SKILL.md`](./SKILL.md). Open it and edit freely — tone, opening line, the kinds of questions Socrates asks, the rules of the dialogue. Skills are just markdown with frontmatter; there is no build step.

If you make a change that others would benefit from, please open a PR.

## Contributing

PRs welcome — especially:

- Better opening lines
- Sharper question prompts
- Translations into other languages
- Variants (e.g. "walk with Aristotle", "walk with Marcus Aurelius")

Please keep the spirit intact: **ask less, cut deeper, care visibly.**

## License

MIT — see [LICENSE](./LICENSE).
