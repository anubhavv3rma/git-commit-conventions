# Git Commit Conventions

A reference guide for writing consistent, meaningful commit messages across three widely-used styles.

---

## Table of Contents

- [1. Imperative Verb Style](#1-imperative-verb-style)
- [2. Conventional Commits](#2-conventional-commits)
- [3. Linux Kernel Style](#3-linux-kernel-style)

---

## 1. Imperative Verb Style

The default convention in most open-source projects. Short, action-first, no prefix or scope.

### Format

```
<Verb> <what and where>
```

### Verbs

| Verb | Use |
|---|---|
| `Add` | Introduce new file, feature, or content |
| `Update` | Modify existing behavior or content |
| `Fix` | Resolve a bug or incorrect behavior |
| `Remove` | Delete files, code, or dependencies |
| `Refactor` | Restructure code without changing behavior |
| `Rename` | Change the name of something |
| `Move` | Relocate a file or module |
| `Revert` | Undo a previous commit |
| `Merge` | Combine branches |
| `Bump` | Increment a version number |
| `Release` | Mark a new version |
| `Init` | First-time project or module setup |
| `Configure` | Adjust settings or config files |
| `Improve` | Incremental enhancement |
| `Optimize` | Make faster or more efficient |
| `Clean` | Remove noise or dead code |
| `Format` | Apply style or whitespace changes |
| `Document` | Add or update docs or comments |
| `Test` | Add or update tests |
| `Mock` | Add stubs or mock data |
| `Secure` | Address a vulnerability |
| `Deprecate` | Mark something as obsolete |
| `Enable` | Turn on a feature or flag |
| `Disable` | Turn off a feature or flag |
| `Migrate` | Move data or schema to new structure |
| `Seed` | Populate database with data |
| `Pin` | Lock a dependency to a version |
| `Upgrade` | Move a dependency to a newer version |
| `Downgrade` | Roll back a dependency |
| `Localize` | Add or update translations |
| `Track` | Begin monitoring or analytics |
| `Integrate` | Connect an external service or API |

### Examples

```
Fix null pointer in login handler
Add rate limiting to API gateway
Remove deprecated CSV export method
Refactor payment service for clarity
```

---

## 2. Conventional Commits

A formal specification designed for tooling — automated changelogs, semantic versioning, and CI triggers. Widely used in the JavaScript/npm ecosystem and monorepos.

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Use |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation changes only |
| `style` | Formatting, whitespace — no logic change |
| `refactor` | Code restructure, no feature or fix |
| `perf` | Performance improvement |
| `test` | Adding or updating tests |
| `build` | Build system or external dependency changes |
| `ci` | CI configuration changes |
| `chore` | Maintenance tasks, tooling, non-src changes |
| `revert` | Revert a previous commit |

> **Scope** is optional and refers to the area of the codebase affected: `auth`, `api`, `ui`, `db`, etc.

> **Breaking changes** are marked with `!` after the type/scope, or with `BREAKING CHANGE:` in the footer.

### Examples

```
feat(auth): add OAuth2 login support
fix(api): handle empty response from payment gateway
docs(readme): update installation instructions
refactor(db): simplify connection pool logic
perf(search): cache frequent queries
test(checkout): add edge cases for discount codes
chore: update dependencies
ci: add Node 20 to test matrix
feat!: drop support for Node 16
feat(api)!: rename /users endpoint to /accounts
```

### Full Commit with Body and Footer

```
fix(auth): prevent token refresh loop on expiry

Previously, expired tokens triggered infinite refresh
attempts. Now returns 401 after first failure.

Closes #482
BREAKING CHANGE: refreshToken() no longer retries automatically
```

---

## 3. Linux Kernel Style

Used in the Linux kernel, Git itself, and low-level C projects. No formal spec — subsystem or file-path prefix followed by an imperative description.

### Format

```
<subsystem/area>: <imperative description>
```

### Common Prefix Patterns

| Pattern | Example |
|---|---|
| Subsystem name | `net:`, `mm:`, `fs:`, `arch:`, `block:` |
| Driver path | `drm/amd:`, `usb/host:`, `sound/pci:` |
| File or module | `tools/perf:`, `scripts:`, `Documentation:` |
| Combined | `net/tcp:`, `mm/slab:`, `fs/ext4:` |

> **Verbs** follow the same imperative style as [Style 1](#1-imperative-verb-style), but lowercase.

### Examples

```
net/tcp: fix race condition in connection teardown
mm: remove unused page migration fallback
fs/ext4: add support for large directory entries
drm/i915: improve power management on idle
block: refactor bio allocation path
Documentation: update memory management overview
tools/perf: fix segfault on empty trace file
arch/arm64: enable FEAT_AFP by default
usb: remove deprecated gadget interface
```

### Multi-line with Sign-off

Sign-offs are required for kernel submissions.

```
net/tcp: fix wraparound in sequence number comparison

The sequence number comparison used unsigned subtraction
which wrapped incorrectly on 32-bit targets. Use the
standard before() helper instead.

Fixes: a3f1c9d2e ("net/tcp: rewrite fast path")
Reported-by: Jane Smith <jane@example.com>
Signed-off-by: John Doe <john@example.com>
```

### Trailer Tags

| Tag | Use |
|---|---|
| `Signed-off-by:` | Developer certificate of origin |
| `Acked-by:` | Acknowledgement without full review |
| `Reviewed-by:` | Full code review sign-off |
| `Reported-by:` | Who reported the bug |
| `Tested-by:` | Who tested the patch |
| `Fixes:` | Which commit introduced the bug |
| `Cc:` | Notify a person or mailing list |
| `Co-developed-by:` | Joint authorship |