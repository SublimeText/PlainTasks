## PlainTasks

An opinionated todo-list plugin for Sublime Text.


## Installation

The easiest way to install is using [Package Control](https://packagecontrol.io). It's listed as `PlainTasks`.

1. Open `Command Palette` using <kbd>ctrl+shift+P</kbd> or menu item `Tools → Command Palette...`
2. Choose `Package Control: Install Package`
3. Find `PlainTasks` and hit <kbd>Enter</kbd>


## Start a new todo-list

Bring up the command palette (it’s <kbd>⌘ + shift + p</kbd> in OS X and <kbd>ctrl + shift + p</kbd> in Windows) and type `task` and select `Tasks: New document` command.

> [!NOTE]
>
> Save your todo files with `todo`, `todolist`, `tasks` or `taskpaper` file extensions or just name them `TODO` with no extension.
> For more portability you can use `todolist.txt` either as a filename or as suffix for any arbitrary filename.

## Usage

> [!NOTE]
>
> In Windows or Linux use <kbd>ctrl</kbd> instead of <kbd>⌘</kbd>

☐ <kbd>⌘ + enter</kbd> or <kbd>⌘ + i</kbd>: new task

☐ <kbd>⌘ + d</kbd>: toggle task as completed.

☐ <kbd>ctrl + c</kbd>: toggle task as cancelled on Mac. <kbd>alt + c</kbd> on Windows/Linux.

☐ <kbd>⌘ + shift + a</kbd> will archive the done tasks, by removing them from your list and appending them to the bottom of the file under Archive project

☐ <kbd>⌘ + shift + o</kbd> will archive in Org-Mode style, removing the entire subtree after cursor and appending it to new file next to original one, e.g. if original is `filename.TODO` then new would be `filename_archive.TODO`

☐ <kbd>⌘ + shift + u</kbd> will open the url under the cursor in your default browser, other than http(s) schemes must be enclosed within `<>`, e.g. `<skype:nickname>`

☐ Anything with colon at the end of the line is a project title, you can also nest projects by indenting them.

☐ You can write plain text as notes or descriptions wherever you want. Use `_` or `*` for italic and bold just like in Markdown.

☐ You can add tags using **`@`** sign  
You can place cursors on tags, click right mouse button and **Filter by tags under cursors**:
pending tasks with selected tags will remain visible (and their notes and projects they belong to), but everything else will be hidden/folded; to unfold all press <kbd>⌘+k</kbd>, <kbd>⌘+j</kbd> or <kbd>⌘+k</kbd>, <kbd>⌘+0</kbd>

☐ You can navigate tags in current document via <kbd>⌘+shift+r</kbd>.

☐ PlainTasks comes with a simple snippet for creating separators, if you feel that your task list is becoming too long you can split it into several sections (and fold some of them) using this snippet:

`--` and then <kbd>tab</kbd> will give you this: `--- ✄ -----------------------`

☐ Completion rules (<kbd>ctrl+space</kbd> or <kbd>alt+/</kbd> to see list of them):

- type `t`, press <kbd>tab</kbd> — it’ll become `@today` — this one is highlighted differently than other tags;
- `c`, <kbd>tab</kbd> — `@critical`;
- `h`, <kbd>tab</kbd> — `@high`;
- `l`, <kbd>tab</kbd> — `@low`;
- `s`, <kbd>tab</kbd> — `@started` — press <kbd>tab</kbd> again and current date will be inserted, when you’ll complete or cancel a task with such tag, you’ll know how many time has passed since start; if you have to change done/cancelled/started time, then you can recalculate the time spent on task by pressing <kbd>tab</kbd> while cursor is placed on a tag;
- `tg`, <kbd>tab</kbd>, <kbd>tab</kbd> work in the same manner as `s`, but inserts `@toggle(current date)` — so you can pause and resume to get more correct result when done/cancel; each toggle tag is either pause or resume depending on its place in sequence;
- `cr`, <kbd>tab</kbd>, <kbd>tab</kbd> — `@created(current date)` (<kbd>⌘ + shift + enter</kbd> creates a new task with this tag);
- `d`, <kbd>tab</kbd> — `@due( )`  
  If you press <kbd>tab</kbd> again, it’ll insert current date, same for `@due( 0)`.  
  You can type short date (similar to [OrgMode’s date prompt](http://orgmode.org/manual/The-date_002ftime-prompt.html), but not the same) and then press <kbd>tab</kbd> to expand it into default format.  
  Short date should be __`@due(year-month-day hour:minute)`__  
  Dot can be used instead of hyphen, but should be consistent _`year.month.day`_

    - year, month, minute, hour can be omitted:

        <table>
         <tr>
          <th>  Notation    </th><th>   Meaning     </th>
         </tr>
         <tr>
          <td>  <code>@due(1)</code>    </td>
          <td>  1st day of next month always    </td>
         </tr>
         <tr>
          <td>  <code>@due(--1)</code>    </td>
          <td>  1st day of current month always    </td>
         </tr>
         <tr>
          <td>  <code>@due(5)</code>    </td>
          <td>  5th day of current month (or next month if current day is 5th or older) </td>
         </tr>
         <tr>
          <td>  <code>@due(2-3)</code>  </td>
          <td>  February 3rd of current year or next one    </td>
         </tr>
         <tr>
          <td>  <code>@due(31 23:)</code>   </td>
          <td>  31st day of current/next month at 23 hours and minutes are equal to current moment  </td>
         </tr>
         <tr>
          <td>  <code>@due(16.1.1 1:1)</code>   </td>
          <td>  January 1st of 2016 at 01:01    <code>@due(16-01-01 01:01)</code>  </td>
         </tr>
        </table>

    - relative period of time starts with a plus sign, two plus signs, or a minus sign
      __`[+[+]|-][number][DdWwHhMm][ [number][DdWwHhMm] ...][h:m]`__ — the sign is optional
      whenever at least one unit letter (`d`/`w`/`h`/`m`) is present, in which case a plain
      number defaults to days. Multiple `number`+`unit` components may be combined in one tag,
      separated by spaces, and their amounts are summed.

        The resulting date is rounded up to the next whole unit
        of the finest unit occurring in the tag,
        where the day is the coarsest unit that is rounded to.
        Thus `@due(+1d)` written at 01:23 is due at midnight following the next day,
        `@due(+1w)` at the end of the day seven days from now,
        and `@due(+22d 21h)` always at a full hour, i.e. with 0 minutes.
        A tag without any unit letter counts as days,
        so `@due(+2)` is rounded like `@due(+2d)`,
        while the `h:m` suffix contributes its own precision
        and hence `@due(+2 12:)` is rounded to the hour.
        Appending `0m` makes the minute the finest unit
        and therefore keeps the current time of day,
        e.g. `@due(+1d 0m)` or `@due(+22d 21h 0m)`.

        The meanings in the table below denote the offset before rounding.

        <table>
         <tr>
          <th>  Notation    </th><th>   Meaning     </th>
         </tr>
         <tr>
          <td>  <code>@due(+)</code>    </td>
          <td>  tomorrow as well as <code>@due( +1)</code> or <code>@due( +1d)</code></td>
         </tr>
         <tr>
          <td>  <code>@due(+w)</code>    </td>
          <td>  one week since current date, i.e. <code>@due( +7)</code></td>
         </tr>
         <tr>
          <td>  <code>@due(+3w)</code>  </td>
          <td>  3 weeks since current date, i.e. <code>@due( +21d)</code></td>
         </tr>
         <tr>
          <td>  <code>@due(++)</code>   </td>
          <td>  one day since <code>@created(date)</code> if any, otherwise it is equal to <code>@due(+)</code></td>
         </tr>
         <tr>
          <td>  <code>@due(+2:)</code>   </td>
          <td>  two hours since current date</td>
         </tr>
         <tr>
          <td>  <code>@due(+:555)</code>   </td>
          <td>  555 minutes since current date</td>
         </tr>
         <tr>
          <td>  <code>@due(+2 12:)</code>   </td>
          <td>  2 days and 12 hours since current date</td>
         </tr>
         <tr>
          <td>  <code>@due(-1d)</code>    </td>
          <td>  yesterday, i.e. one day before current date</td>
         </tr>
         <tr>
          <td>  <code>@due(-w)</code>    </td>
          <td>  one week before current date</td>
         </tr>
         <tr>
          <td>  <code>@due(+2h)</code>    </td>
          <td>  two hours since current date, same as <code>@due(+2:)</code></td>
         </tr>
         <tr>
          <td>  <code>@due(+10m)</code>    </td>
          <td>  ten minutes since current date</td>
         </tr>
         <tr>
          <td>  <code>@due(3h)</code>    </td>
          <td>  three hours since current date — the sign may be omitted when a unit letter is present</td>
         </tr>
         <tr>
          <td>  <code>@due(+1d 3h)</code>    </td>
          <td>  1 day and 3 hours since current date (components are summed)</td>
         </tr>
         <tr>
          <td>  <code>@due(-2w 1d 4h 30m)</code>    </td>
          <td>  2 weeks, 1 day, 4 hours and 30 minutes before current date</td>
         </tr>
        </table>

☐ You can create a link to a file within your project by prefixing the file name with a dot and (back)slash like: `.\filename\` or `./another filename/`.  
  The line and column can be specified by colons: `.\filename:11:8`.  
  In SublimeText 3 you can specify a symbol inside that file by using \> character like: `.\filename>symbol`.  
  In SublimeText 2 you can specify a text inside that file by using inch characters like: `.\filename"any text"`.  
  Pressing <kbd>ctrl + o</kbd> (<kbd>alt + o</kbd> on Windows/Linux) will open the file in Sublime and scroll to specific position if any.  
  Also in SublimeText 3 link may point to directory, open such link will add the directory to current project (sidebar).  
  In addition, Markdown and “wiki” (Org-Mode, NV, etc.) styles are supported as well, examples:

```
[](path)
[](path ":11:8")
[](path ">symbol")
[](path "any text")
[[path]]
[[path::11:8]]
[[path::*symbol]]
[[path::any text]]
[[path]] ":11:8"
[[path]] ">symbol"
[[path]] "any text"
```

☐ To convert current document to HTML, bring up the command palette <kbd>⌘ + shift + p</kbd> and type `Tasks: View as HTML` — it will be opened in default webbrowser, so you can view and save it.  
`Tasks: Save as HTML…` ask if you want to save and if yes, allow to choose directory and filename (but won’t open it in webbrowser).


### Editor Useful Tools:

☐ Use **<kbd>⌘ + control + up/down</kbd>** (**<kbd>ctrl + shift + up/down</kbd>** on Windows) to move tasks up and down.

☐ Use **<kbd>⌘ + r</kbd>** to see a list of projects and quickly jump between them

★ See the [Tutorial](https://github.com/SublimeText/PlainTasks/blob/master/messages/Tutorial.todo) for more detailed information.


## Settings

PlainTasks is an opinionated plugin, which means that it is highly configured to look in a specific way, but this does not mean that you can not customize it. If you feel that something does not look right and you want to change it, you can easily do it in your user settings file.

To customize settings, open _Command Palette_
and call `Preferences: PlainTasks Settings`
or go to `Main Menu → Preferences → Package Settings → PlainTasks → Settings`.

### Task Settings

|            Setting             |     Default      |                                 Options/Description
| ------------------------------ | ---------------- | -----------------------------------------------------------------------
| **taskpaper_compatible**       | false            | Enable taskpaper compatibility mode
| **open_tasks_bullet**          | `□`              | `-` `❍` `■` `□` `☐` `🔳` `❑` `▪` `▫` `–` `—` `≡` `→` `›` `[ ]`
| **done_tasks_bullet**          | `✓`              | `+` `🗸` `✓` `✔` `☑` `✅` `☑️` `√` `[x]`
| **cancelled_tasks_bullet**     | `×`              | `x` `×` `🗙` `✖` `❌` `❎` `✘` `[-]`
| **tasks_bullet_space**         | whitespace or tab | String to place after bullet, might be any character(s)
| **header_to_task**             | false            | If true, a project title line will be converted to a task on the certain keystroke

### Tags Settings

|            Setting             |     Default      |                                 Options/Description
| ------------------------------ | ---------------- | -----------------------------------------------------------------------
| **before_date_space**          | `" "`            | Space to insert in front of dates
| **date_format**                | `(%y-%m-%d %H:%M)` | See [strfti.me](http://www.strfti.me/) for quick reference; detailed documentation: [python.org](https://docs.python.org/3.14/library/datetime.html#strftime-and-strptime-behavior)
| **done_date**                  | true             | Determines whether done tasks should gain a date or not
| **done_tag**                   | true             | Determines whether done tasks should gain a `@done` tag or not
| **project_tag**                | true             | Postfix archived task with project tag, otherwise prefix
| **show_calendar_on_tags**      | false            | Automatically show date picker when cursor is on tag (you can get date picker any time via context menu)
| **show_remain_due**            | false            | Show remain or overdue time under due tags
| **due_preview_offset**         | 0                | Place preview date outside of parens of `@due()`, 1 — within
| **due_remain_format**          | `"{time} remaining"` | `{time}` will be replaced with actual value
| **due_overdue_format**         | `"{time} overdue"` | `{time}` will be replaced with actual value
| **decimal_minutes**            | false            | If true, minutes in lasted/wasted tags will be percent of hour, e.g. 1.50 instead of 1:30
| **highlight_past_due**         | true             | If true, highlight past, soon, and invalid `@due(something)`
| **highlight_due_soon**         | 24               | Hours as int, threshold to define which `@due` will be soon
| **scope_past_due**             | `tring.other.tag.todo.critical` | Any scope, define color for past `@due`
| **scope_due_soon**             | `tring.other.tag.todo.high`     | Any scope, define color for `@due` will be soon
| **scope_misformatted**         | `tring.other.tag.todo.low`      | Any scope, define color for `@due` mismatch **date_format**

### Archive Settings

|            Setting             |     Default      |                                 Options/Description
| ------------------------------ | ---------------- | -----------------------------------------------------------------------
| **archive_name**               | `Archive:`       | Make sure it is the unique project name within your todo files
| **new_on_top**                 | true             | How to sort archived tasks (done_tag=true and default date_format are required)
| **archive_org_filemask**       | `"{dir}{sep}{base}_archive{ext}"` | Org-mode style archive file naming

### Gutter Settings

|            Setting             |     Default      |                                 Options/Description
| ------------------------------ | ---------------- | -----------------------------------------------------------------------
| **icon_past_due**              | `"circle"`       | Gutter icon¹
| **icon_due_soon**              | `"dot"`          | Gutter icon¹
| **icon_misformatted**          | `""`             | Gutter icon¹
| **icon_critical**              | `""`             | Gutter icon¹
| **icon_high**                  | `""`             | Gutter icon¹
| **icon_low**                   | `""`             | Gutter icon¹
| **icon_today**                 | `""`             | Gutter icon¹

<b>¹</b> Icon value can be  `"dot"`, `"circle"`, `"bookmark"`, `"cross"`, `""`, or custom relative path to existing png file,
e.g. `"Packages/User/my-icon.png"`.


### Changing color scheme

If you don't like colors used in bundled schemes just copy any `.hidden-tmTheme` from PlainTasks to
your User directory, change colors and paste the code below in your user settings file:

``` json
{ "color_scheme": "Path to your custom color scheme file. e.g. Packages/User/custom_plaintasks.hidden-tmTheme" }
```

**N.B.**, sometimes you have to restart Sublime Text to apply changes made in tmTheme file.

**N.B.**, `scope_past_due`, `scope_due_soon`, and `scope_misformatted` settings can assign any scopes defined in tmTheme file, e.g.
you can set `"scope_past_due": "my.own.super.expired.whatever"` and then just add style definition in tmTheme for this scope.


### Taskpaper Compatibility

If you need to keep your files compatible with Taskpaper, go to
`Preferences → Package Settings → PlainTasks` and open `Settings - User`, then
add these settings to the json file:

```json
{
  "translate_tabs_to_spaces": false,
  "date_format": "(%y-%m-%d)",
  "taskpaper_compatible": true
}
```


### Spell check

It is build-in feature of Sublime, you can toggle spell check with <kbd>F6</kbd>.
For convinience, you may add bullets in list of ignored words into **`Preferences → Settings - User`**, e.g.

```json
{
  "ignored_words": [ "☐", "✔", "✘", "✄" ]
}
```


## Custom todo icon

PlainTasks comes with a custom todo icon that you can find in the `icons` folder. You can assign it to your todo files to give them a better look and distinguish them from other plain text files. Google and find out how to assign a custom icon to a file type in your operating system.


## Custom Statistics

Format string `stats_format` speciffies how statistics are represented in status bar.

Default: `"$n/$a done ($percent%) $progress Last task @done $last"`

Supported variables:

| Directive    | Description                                           |
| ------------ | ----------------------------------------------------- |
| `$o`         | Amount of pending tasks                               |
| `$d`         | Amount of completed tasks                             |
| `$c`         | Amount of cancelled tasks                             |
| `$n`         | Sum of completed and cancelled tasks                  |
| `$a`         | Sum of all tasks                                      |
| `$percent`   | Ratio of `$n` to `$a`                                 |
| `$progress`  | Percent as pseudo graphics (absents if less than 10%) |
| `$last`      | Date of lastly completed task                         |
| `{{...}}`    | Return `pending/completed/cancelled` tasks which matched by regex `...`;<br> e.g. `{{@tag}}` — amounts of tasks with `@tag`; or `{{@a|@b}}` — tasks with either `@a` or `@b` or both.<br> You may add several `{{...}}` to get separate stats for different tags. |

To customise it, call `Preferences: PlainTasks Settings` and add...

```jsonc
{
    "stats_format": "□$o ✓$d ×$c",

    // if you want the statistics do not include the archived tasks:
    "stats_ignore_archive": true
}
```


### Copy statistics

Bring up the command palette and type `Tasks: Copy Statistics`.


### Additional settings for progress bar

```jsonc
{
    "bar_full": "■",  // any char
    "bar_empty": "□", // any char

    // Specify replacement rules to to avoid Unicode when copy stats
    // e.g. to convert ■■■■■■□□□□ to [======    ]
    "replace_stats_chars": [[" ■", " [="], ["■", "="], ["□ ", " ] "], ["□", " "]]
}
```


## PlainTasks for other editors

NOTE: These are separate projects, maintained by some awesome developers other than us.
- [Atom: Tasks plugin](https://atom.io/packages/tasks)
- [Vim: Plaintasks.vim](https://github.com/elentok/plaintasks.vim)
- [Visual Studio Code: To Do Tasks](https://github.com/sandy081/vscode-todotasks)
- [Visual Studio Code: Todo+](https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-todo-plus)


## Contributors

- @antonioriva
- [aziz](https://github.com/aziz)
- @binaryannie
- [Ben Johnson](https://github.com/benjohnson)
- [Craig Campbell](https://github.com/ccampbell)
- [Dominique Wahli](https://github.com/bizoo)
- [Germán M. Bravo](https://github.com/Kronuz)
- [Hindol Adhya](https://github.com/Hindol)
- [Jesse Robertson](https://github.com/speilberg0)
- [Marc Schlaich](https://github.com/schlamar)
- [Michael McFarland](https://github.com/mikedmcfarland)
- [Pablo Barrios](https://github.com/sauron)
- [Stanislav Parfeniuk](https://github.com/travmik)
- [Vova Kolobok](https://github.com/vovkkk)

You can contribute on [GitHub](https://github.com/SublimeText/PlainTasks)


## Inspiration

- Thanks to Chagel for the [iTodo plugin](https://github.com/chagel/itodo).
- Thanks to [Taskmate for TextMate](https://github.com/svenfuchs/taskmate).
- Thanks to [TaskPaper Mac application from hogbaysoftware.com](http://www.hogbaysoftware.com/products/taskpaper)
