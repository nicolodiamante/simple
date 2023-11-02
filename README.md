<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/simple/assets/48920263/01141d11-78c3-4c5b-a5ac-6a6716df2e6a" draggable="false" ondragstart="return false;" alt="Simple" title="Simple" />
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/f2664185-160d-4de7-b22c-38e1ecf2e2a3" draggable="false" ondragstart="return false; "alt="Simple" title="Simple" />
  </picture>
</p>

Creating a custom prompt in your terminal can be a great way to improve your productivity and make your work environment more personalised. While there are many pre-configured solutions available, creating your own can be a rewarding experience that allows you to fine-tune your prompt to your specific needs. This can take time and effort, but the result can be a clean, dynamic, and efficient prompt that helps you work more effectively. In this case, the prompt was specifically designed to work well with Apple Terminal, which is a simple and easy-to-use terminal application that comes pre-installed on all Mac computers. This makes it a great choice for users who don't require advanced features or who don't use the terminal frequently. With a customised prompt, even a simple terminal application like Apple Terminal can become a powerful tool for productivity and efficiency.

<br><br>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/simple/assets/48920263/3db96df4-5337-447a-80df-cfc95b087567" draggable="false" ondragstart="return false;" alt="Simple Example" title="Simple Example" />
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/2e79b8a5-b828-4819-8f98-422a6dfdffef" draggable="false" ondragstart="return false; "alt="Simple Example" title="Simple Example" width="560px" />
  </picture>
</p>

<br><br>

## Design

While the default zsh prompt is functional, it is relatively short and does not provide much information. On the other hand, the default bash prompt on macOS is longer and more informative, displaying the current working directory, the username, the hostname, and more. However, with a few tweaks, you can create a customised zsh prompt that displays the same information as the default bash prompt, along with other useful details.

The customised prompt is designed to provide you with the information that is most relevant and useful to your workflow, while also being visually appealing, easy to read, and user-friendly. Some of the information that the prompt displays includes the current working directory, which can help you keep track of where you are in the file system and navigate between different directories more efficiently.

The prompt also displays the git branch and status, which is particularly useful for developers who work with version control systems like Git. This feature allows you to see at a glance which branch you are currently working on, as well as any changes or updates that have been made to the repository.

In addition, the prompt displays the previous command's exit status using colours to indicate whether the command was successful or not. This feature makes it easier to spot errors and identify potential issues with your commands. For example, if a command fails, the prompt will display the exit status in red, making it easy to see that something went wrong.

Overall, the customised prompt is designed to make your command line experience more efficient and productive by providing you with the information you need in a clear and easy-to-read format.
<br><br>

## Highlights

- Prompt character turns red if the last command didn't exit with `0`.
- Shows the git branch and whether it's dirty.
- Indicates when you have unpushed/unpulled git commits with up/down arrows.
- Username and host are only displayed when in an SSH session or a container.
- Shows the current path in the title and the (current folder and command) when a process is running.
- Shows the current git branch in the title.
  <br><br>

The following diagram shows the structure of the prompt:

<br>

<p align="center">
  <picture>
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/9a470c2d-a8bc-4df8-a0b2-d704f8d45754" draggable="false" ondragstart="return false; "alt="Simple Diagram" title="Simple Diagram" width="700px" />
  </picture>
</p>

<br>

**Suggestion:** when you open your terminal, you might see a message that displays information such as the version of your operating system or the last time you logged in. While this message can be useful, it can also be distracting and unnecessary for some users. Fortunately, you can suppress this message by creating a file called .hushlogin in your home directory (~). This file will prevent the status message from appearing at the start of each terminal session, regardless of whether you're using zsh, bash, or any other shell. This is a simple and effective way to customise your terminal experience and remove any unwanted distractions.
<br><br>

## Getting Started

Here are the two methods you can choose from:

**Automatic Download via `curl`**: Simply execute the following command in your terminal to quickly download and seamlessly install the utility:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/simple/HEAD/bootstrap.sh)"
```

**Manual Cloning**: For those who prefer a hands-on approach, you can manually clone the repository to your desired location:

```shell
git clone https://github.com/nicolodiamante/simple.git ~/simple
```

<br>

### Post-Download Steps

**Directory Navigation & Script Execution**: Navigate to the repository's `utils` directory and execute the installation script:

```shell
source install.sh
```

**Simple Configuration**: To streamline the integration process, this script systematically identifies the `zshrc` file within the user's environment and appends the `simple/script` path to the pivotal `fpath` variable.

```shell
fpath=(~/simple/script $fpath)
autoload -Uz simple
```

<br>

### Install via [Oh My Zsh][ohmyzsh]

If you're using Oh My Zsh, you can install `simple` as a plugin:

```shell
git clone https://github.com/nicolodiamante/simple.git $ZSH_CUSTOM/plugins/simple
```

Then, add `simple` to your `.zshrc` plugins array:

```shell
plugins=(... simple)
```

Restart theshell to activate the changes.
<br><br>

## Notes

### Resources

#### Zsh Documentations

- [Documentation Index][zsh-docs]
- [User Guide][zsh-docs-guide]
- [Zsh Character Highlighting][zsh-docs-character-highlighting]

#### Inspired by

- [Pure Prompt][pure-prompt]

### Contribution

Any suggestions or feedback you may have for improvement are welcome. If you encounter any issues or bugs, please report them to the [issues page][issues].
<br><br>

<p align="center">
  <picture>
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/fdc9c9c7-8770-436c-9ba0-eb8fa2be6a73" draggable="false" ondragstart="return false;" /></>
  </picture>
</p>

<p align="center">
  <picture>
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/6245bdc3-deb6-458f-8415-ce5bd7801773" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante" title="Nicol&#242; Diamante" width="17px" />
  </picture>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/simple/assets/48920263/8ab99698-7b25-48ad-b783-4b8e0c099b91" draggable="false" ondragstart="return false;" alt="MIT License" title="MIT License" />
    <img src="https://github.com/nicolodiamante/simple/assets/48920263/e99257be-e61d-450f-965e-0ce34e4ac697" draggable="false" ondragstart="return false; "alt="MIT License" title="MIT License" width="95px" />
  </picture>
</p>

<!-- Link labels: -->

[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[zsh-docs]: http://zsh.sourceforge.net/Doc
[zsh-docs-guide]: http://zsh.sourceforge.net/Guide/zshguide.html
[zsh-docs-character-highlighting]: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
[pure-prompt]: https://github.com/sindresorhus/pure
[issues]: https://github.com/nicolodiamante/simple/issues
