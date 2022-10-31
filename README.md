<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/199002944-9b6b6a5b-caf6-4733-bbe2-9c89614abdb8.png" draggable="false" ondragstart="return false;" alt="Simple Title" title="Simple" /></a></p>

Most prompts are complex, cluttered and slow, in short ugly. You can spend (or waste) a lot of time fine-tuning your prompt. Whether these modifications really improve your productivity is a subjective matter. There are many solutions out there that give you a pre-configured shortcut into lots of zsh goodness. But I was interested in learning this the ‘hard way’ without shortcuts.

This prompt was developed to work well with the default Apple Terminal in mind. I know is not the best terminal, but for the type of use I need it suits me, so I spent quite some time setting it up to be dynamic and simple.

<br/><br/>

<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/198896316-ccc0704d-5b17-4a74-8a82-58a3eab6317d.png" draggable="false" ondragstart="return false;" alt="Simple Title" title="Terminal" /></a></p>

## Concept

### Design

The basic zsh prompt configuration works similarly to bash, even though it uses a different syntax. The default bash prompt on macOS is quite elaborate. The zsh default prompt is far shorter than the bash default and even less helpful. Since I work on the local system most of the time, the hostname bears no helpful information to be repeating in every line, becoming superfluous, instead, I wanted it to show just the current working directory following the git branch and its status (if inside a repository). The prompt also shows the condition for the previous commands' exit turning green when the previous command is successfully (exit code zero) and red when the previous command failed (non-zero exit code).
<br/><br/>

### Highlights

- Prompt character turns red if the last command didn't exit with `0`.
- Shows the `git` branch and whether it's dirty.
- Indicates when you have unpushed/unpulled `git` commits with up/down arrows.
- Username and host are only displayed when in an SSH session or a container.
- Shows the current path in the title and the (current folder and command) when a process is running.
- Shows the current `git` branch in the title.
<br/><br/>

The following diagram shows the structure of the prompt:

<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/198899782-4723c359-23b7-4bb8-9b7f-fd0b39728a70.png" draggable="false" ondragstart="return false;" alt="Simple Diagram" title="Terminal Diagram" /></a></p>

> Tip: creating a file ~/.hushlogin will suppress the status message at the start of each Terminal session in zsh as well as in bash (or any other shell).

I think it makes a good starting point for customising your own prompt.<br/><br/>

## Getting Started

### Installation

Download the repository via curl:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/simple/HEAD/bootstrap.sh)"
```

Alternatively, clone manually:

```shell
git clone https://github.com/nicolodiamante/simple.git ~/simple
```

Head over into the directory and then:

```shell
cd utils && source install.sh
```

The script will look for the `zshrc` and then append the full path to the
`simple/script` directory to the `fpath`:

```shell
fpath=(~/simple/script $fpath)
autoload -Uz simple
```

### Install via [Oh My Zsh][ohmyzsh]

```shell
git clone https://github.com/nicolodiamante/simple.git $ZSH_CUSTOM/plugins/simple
```

- Add to your `zshrc` plugins array `plugins=(... simple)`
- Restart the shell to activate
<br/><br/>

### Resources

#### Zsh Documentations

- [Documentation Index][zsh-docs]
- [User Guide][zsh-docs-guide]
- [Zsh Character Highlighting][zsh-docs-character-highlighting]

#### Inspired by

- [Pure Prompt][pure-prompt]

### Contribution

Please report any issues or bugs to the [issues page][issues]. Suggestions
for improvements are welcome!<br/><br/>

<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/113406768-5a164900-93ac-11eb-94a7-09377a52bf53.png" draggable="false" ondragstart="return false;" /></a></p>

<p align="center"><a href="https://github.com/nicolodiamante" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/113433823-31a84200-93e0-11eb-9ffb-9111b389ef2f.png" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante Portfolio" title="Nicol&#242; Diamante" width="11px" /></a></p>

<p align="center"><a href="https://github.com/nicolodiamante/simple/blob/main/LICENSE.md" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/110947109-06ca5100-8340-11eb-99cf-8d245044b8a3.png" draggable="false" ondragstart="return false;" alt="The MIT License" title="The MIT License (MIT)" width="90px" /></a></p>

<!-- Link labels: -->
[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[zsh-docs]: http://zsh.sourceforge.net/Doc
[zsh-docs-guide]: http://zsh.sourceforge.net/Guide/zshguide.html
[zsh-docs-character-highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
[pure-prompt]: https://github.com/sindresorhus/pure
[issues]: https://github.com/nicolodiamante/simple/issues
