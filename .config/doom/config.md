
# Table of Contents

1.  [TABLE OF CONTENTS](#orgd3bf50a):toc:
2.  [ABOUT THIS CONFIG](#orgf058ce1)
3.  [BEACON](#org2cf66cd)
4.  [BOOKMARKS AND BUFFERS](#org6dabc7d)
    1.  [Bookmarks](#orga24e470)
    2.  [Buffers](#org9dc95fb)
    3.  [Global Auto Revert](#orgeabac6c)
    4.  [Keybindings within ibuffer mode](#org947b395)
5.  [CALENDAR](#org9e8a93d)
6.  [CENTAUR-TABS](#org244b287)
7.  [CLIPPY](#org4d6dce0)
8.  [DASHBOARD](#org6f54d77)
    1.  [Configuring Dashboard](#orgf21f644)
    2.  [Dashboard in Emacsclient](#org8fcd097)
9.  [DIRED](#orgab1034f)
    1.  [Keybindings To Open Dired](#orgaf5d11e)
    2.  [Keybindings Within Dired](#org4089273)
        1.  [Basic dired commands](#orgba918dd)
        2.  [Dired commands using regex](#org1b8c2b6)
        3.  [File permissions and ownership](#org39aad9d)
    3.  [Keybindings Within Dired With Peep-Dired-Mode Enabled](#org9c544a9)
    4.  [Making deleted files go to trash can](#orgb516163)
10. [DOOM THEME](#orgc0da4dd)
11. [ELFEED](#org537a912)
12. [EMMS](#org429bc60)
13. [EMOJIS](#orgcf13bbf)
14. [ERC](#org749bab7)
15. [EVALUATE ELISP EXPRESSIONS](#org97ec036)
16. [EWW](#org85f8696)
17. [FONTS](#orgaf74783)
18. [INSERT DATE](#org0031ae4)
19. [IVY](#orgb04edf5)
    1.  [IVY-POSFRAME](#org2ef57da)
    2.  [IVY KEYBINDINGS](#org2bd8aaa)
20. [LINE SETTINGS](#orgcc41533)
21. [MARKDOWN](#orgcbaee25)
22. [MINIMAP](#org19914ce)
23. [MODELINE](#orgb1eb4bb)
24. [MOUSE SUPPORT](#org14c452d)
25. [NEOTREE](#orga3f2325)
26. [OPEN SPECIFIC FILES](#org34c8b9a)
27. [ORG MODE](#org93c5d4c)
    1.  [Org fonts](#org97d54b3)
    2.  [Org-export](#org17f9b8c)
    3.  [Org-journal](#org1c3a54a)
    4.  [Org-publish](#orgf1aa6ad)
    5.  [Org-auto-tangle](#org470db00)
28. [PASSWORD STORE](#orgd03ef3b)
29. [PERSPECTIVE](#orgfcd9598)
30. [RAINBOW MODE](#org56b886a)
31. [REGISTERS](#orgacbc57b)
32. [SHELLS](#orgd7241ad)
33. [SPLITS](#org6568966)
34. [WINNER MODE](#org6038e64)
35. [ZAP TO CHAR](#org1fc04ba)



<a id="orgd3bf50a"></a>

# TABLE OF CONTENTS     :toc:

-   
-   
-   -   
    -   
    -   
    -
-   
-   
-   
-   -   
    -
-   -   
    -   
    -   
    -
-   
-   
-   
-   
-   
-   
-   
-   
-   
-   -   
    -
-   
-   
-   
-   
-   
-   
-   
-   -   
    -   
    -   
    -   
    -
-   
-   
-   
-   
-   
-   
-   
-   


<a id="orgf058ce1"></a>

# ABOUT THIS CONFIG

This is my personal Doom Emacs config.  Doom Emacs is a distribution of Emacs that uses the &ldquo;evil&rdquo; keybindings (Vim keybindings) and includes a number of nice extensions and a bit of configuration out of the box.  I am maintaining this config not just for myself, but also for those that want to explore some of what is possible with Emacs.  I will add a lot of examples of plugins and settings, some of them I may not even use personally.  I do this because many people following me on YouTube look at my configs as &ldquo;documentation&rdquo;.


<a id="org2cf66cd"></a>

# BEACON

Never lose your cursor.  When you scroll, your cursor will shine!  This is a global minor-mode. Turn it on everywhere with:

    (beacon-mode 1)


<a id="org6dabc7d"></a>

# BOOKMARKS AND BUFFERS

Doom Emacs uses &rsquo;SPC b&rsquo; for keybindings related to bookmarks and buffers.


<a id="orga24e470"></a>

## Bookmarks

Bookmarks are somewhat like registers in that they record positions you can jump to.  Unlike registers, they have long names, and they persist automatically from one Emacs session to the next. The prototypical use of bookmarks is to record where you were reading in various files.

    (map! "C-h" #'delete-backward-char)
    (map! :after org :map evil-org-mode-map :i "C-h" #'org-delete-backward-char)
    
    (map! :leader
          (:prefix ("b". "buffer")
           :desc "List bookmarks" "L" #'list-bookmarks
           :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))


<a id="org9dc95fb"></a>

## Buffers

Regarding *buffers*, the text you are editing in Emacs resides in an object called a *buffer*. Each time you visit a file, a buffer is used to hold the file’s text. Each time you invoke Dired, a buffer is used to hold the directory listing.  *Ibuffer* is a program that lists all of your Emacs *buffers*, allowing you to navigate between them and filter them.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">ibuffer</td>
<td class="org-left">Launch ibuffer</td>
<td class="org-left">SPC b i</td>
</tr>


<tr>
<td class="org-left">kill-buffer</td>
<td class="org-left">Kill current buffer</td>
<td class="org-left">SPC b k</td>
</tr>


<tr>
<td class="org-left">next-buffer</td>
<td class="org-left">Goto next buffer</td>
<td class="org-left">SPC b n</td>
</tr>


<tr>
<td class="org-left">previous-buffer</td>
<td class="org-left">Goto previous buffer</td>
<td class="org-left">SPC b p</td>
</tr>


<tr>
<td class="org-left">save-buffer</td>
<td class="org-left">Save current buffer</td>
<td class="org-left">SPC b s</td>
</tr>
</tbody>
</table>


<a id="orgeabac6c"></a>

## Global Auto Revert

A buffer can get out of sync with respect to its visited file on disk if that file is changed by another program. To keep it up to date, you can enable Auto Revert mode by typing M-x auto-revert-mode, or you can set it to be turned on globally with &rsquo;global-auto-revert-mode&rsquo;.  I have also turned on Global Auto Revert on non-file buffers, which is especially useful for &rsquo;dired&rsquo; buffers.

    (global-auto-revert-mode 1)
    (setq global-auto-revert-non-file-buffers t)


<a id="org947b395"></a>

## Keybindings within ibuffer mode

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">ibuffer-mark-forward</td>
<td class="org-left">Mark the buffer</td>
<td class="org-left">m</td>
</tr>


<tr>
<td class="org-left">ibuffer-unmark-forward</td>
<td class="org-left">Unmark the buffer</td>
<td class="org-left">u</td>
</tr>


<tr>
<td class="org-left">ibuffer-do-kill-on-deletion-marks</td>
<td class="org-left">Kill the marked buffers</td>
<td class="org-left">x</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-by-content</td>
<td class="org-left">Ibuffer filter by content</td>
<td class="org-left">f c</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-by-directory</td>
<td class="org-left">Ibuffer filter by directory</td>
<td class="org-left">f d</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-by-filename</td>
<td class="org-left">Ibuffer filter by filename (full path)</td>
<td class="org-left">f f</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-by-mode</td>
<td class="org-left">Ibuffer filter by mode</td>
<td class="org-left">f m</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-by-name</td>
<td class="org-left">Ibuffer filter by name</td>
<td class="org-left">f n</td>
</tr>


<tr>
<td class="org-left">ibuffer-filter-disable</td>
<td class="org-left">Disable ibuffer filter</td>
<td class="org-left">f x</td>
</tr>


<tr>
<td class="org-left">ibuffer-do-kill-lines</td>
<td class="org-left">Hide marked buffers</td>
<td class="org-left">g h</td>
</tr>


<tr>
<td class="org-left">ibuffer-update</td>
<td class="org-left">Restore hidden buffers</td>
<td class="org-left">g H</td>
</tr>
</tbody>
</table>

    (evil-define-key 'normal ibuffer-mode-map
      (kbd "f c") 'ibuffer-filter-by-content
      (kbd "f d") 'ibuffer-filter-by-directory
      (kbd "f f") 'ibuffer-filter-by-filename
      (kbd "f m") 'ibuffer-filter-by-mode
      (kbd "f n") 'ibuffer-filter-by-name
      (kbd "f x") 'ibuffer-filter-disable
      (kbd "g h") 'ibuffer-do-kill-lines
      (kbd "g H") 'ibuffer-update)


<a id="org9e8a93d"></a>

# CALENDAR

Let&rsquo;s make a 12-month calendar available so we can have a calendar app that, when we click on time/date in xmobar, we get a nice 12-month calendar to view.

This is a modification of: <http://homepage3.nifty.com/oatu/emacs/calendar.html>
See also: <https://stackoverflow.com/questions/9547912/emacs-calendar-show-more-than-3-months>

    ;; https://stackoverflow.com/questions/9547912/emacs-calendar-show-more-than-3-months
    (defun dt/year-calendar (&optional year)
      (interactive)
      (require 'calendar)
      (let* (
          (current-year (number-to-string (nth 5 (decode-time (current-time)))))
          (month 0)
          (year (if year year (string-to-number (format-time-string "%Y" (current-time))))))
        (switch-to-buffer (get-buffer-create calendar-buffer))
        (when (not (eq major-mode 'calendar-mode))
          (calendar-mode))
        (setq displayed-month month)
        (setq displayed-year year)
        (setq buffer-read-only nil)
        (erase-buffer)
        ;; horizontal rows
        (dotimes (j 4)
          ;; vertical columns
          (dotimes (i 3)
            (calendar-generate-month
              (setq month (+ month 1))
              year
              ;; indentation / spacing between months
              (+ 5 (* 25 i))))
          (goto-char (point-max))
          (insert (make-string (- 10 (count-lines (point-min) (point-max))) ?\n))
          (widen)
          (goto-char (point-max))
          (narrow-to-region (point-max) (point-max)))
        (widen)
        (goto-char (point-min))
        (setq buffer-read-only t)))
    
    (defun dt/scroll-year-calendar-forward (&optional arg event)
      "Scroll the yearly calendar by year in a forward direction."
      (interactive (list (prefix-numeric-value current-prefix-arg)
                         last-nonmenu-event))
      (unless arg (setq arg 0))
      (save-selected-window
        (if (setq event (event-start event)) (select-window (posn-window event)))
        (unless (zerop arg)
          (let* (
                  (year (+ displayed-year arg)))
            (dt/year-calendar year)))
        (goto-char (point-min))
        (run-hooks 'calendar-move-hook)))
    
    (defun dt/scroll-year-calendar-backward (&optional arg event)
      "Scroll the yearly calendar by year in a backward direction."
      (interactive (list (prefix-numeric-value current-prefix-arg)
                         last-nonmenu-event))
      (dt/scroll-year-calendar-forward (- (or arg 1)) event))
    
    (map! :leader
          :desc "Scroll year calendar backward" "<left>" #'dt/scroll-year-calendar-backward
          :desc "Scroll year calendar forward" "<right>" #'dt/scroll-year-calendar-forward)
    
    (defalias 'year-calendar 'dt/year-calendar)

Let&rsquo;s also play around with calfw.

    (use-package! calfw)
    (use-package! calfw-org)


<a id="org244b287"></a>

# CENTAUR-TABS

To use tabs in Doom Emacs, be sure to uncomment &ldquo;tabs&rdquo; in Doom&rsquo;s init.el.  Displays tabs at the top of the window similar to tabbed web browsers such as Firefox.  I don&rsquo;t actually use tabs in Emacs.  I placed this in my config to help others who may want tabs.  In the default configuration of Doom Emacs, &rsquo;SPC t&rsquo; is used for &ldquo;toggle&rdquo; keybindings, so I choose &rsquo;SPC t c&rsquo; to toggle centaur-tabs.  The &ldquo;g&rdquo; prefix for keybindings is used for a bunch of evil keybindings in Doom, but &ldquo;g&rdquo; plus the arrow keys were not used, so I thought I would bind those for tab navigation.  But I did leave the default &ldquo;g t&rdquo; and &ldquo;g T&rdquo; intact if you prefer to use those for centaur-tabs-forward/backward.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">centaur-tabs-mode</td>
<td class="org-left"><i>Toggle tabs globally</i></td>
<td class="org-left">SPC t c</td>
</tr>


<tr>
<td class="org-left">centaur-tabs-local-mode</td>
<td class="org-left"><i>Toggle tabs local display</i></td>
<td class="org-left">SPC t C</td>
</tr>


<tr>
<td class="org-left">centaur-tabs-forward</td>
<td class="org-left"><i>Next tab</i></td>
<td class="org-left">g &lt;right&gt; or g t</td>
</tr>


<tr>
<td class="org-left">centaur-tabs-backward</td>
<td class="org-left"><i>Previous tab</i></td>
<td class="org-left">g &lt;left&gt; or g T</td>
</tr>


<tr>
<td class="org-left">centaur-tabs-forward-group</td>
<td class="org-left"><i>Next tab group</i></td>
<td class="org-left">g &lt;down&gt;</td>
</tr>


<tr>
<td class="org-left">centaur-tabs-backward-group</td>
<td class="org-left"><i>Previous tab group</i></td>
<td class="org-left">g &lt;up&gt;</td>
</tr>
</tbody>
</table>

    (setq centaur-tabs-set-bar 'over
          centaur-tabs-set-icons t
          centaur-tabs-gray-out-icons 'buffer
          centaur-tabs-height 24
          centaur-tabs-set-modified-marker t
          centaur-tabs-style "bar"
          centaur-tabs-modified-marker "•")
    (map! :leader
          :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
          :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
    (evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                                   (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                                   (kbd "g <down>")  'centaur-tabs-forward-group
                                                   (kbd "g <up>")    'centaur-tabs-backward-group)


<a id="org4d6dce0"></a>

# CLIPPY

Gives us a popup box with &ldquo;Clippy, the paper clip&rdquo;. You can make him say various things by calling &rsquo;clippy-say&rsquo; function.  But the more useful functions of clippy are the two describe functions provided: &rsquo;clippy-describe-function&rsquo; and &rsquo;clippy-describe-variable&rsquo;.  Hit the appropriate keybinding while the point is over a function/variable to call it.  A popup with helpful clippy will appear, telling you about the function/variable (using describe-function and describe-variable respectively).

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">clippy-describe-function</td>
<td class="org-left"><i>Clippy describes function under point</i></td>
<td class="org-left">SPC c h f</td>
</tr>


<tr>
<td class="org-left">clippy-describe-variable</td>
<td class="org-left"><i>Clippy describes variable under point</i></td>
<td class="org-left">SPC c h v</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("c h" . "Help info from Clippy")
           :desc "Clippy describes function under point" "f" #'clippy-describe-function
           :desc "Clippy describes variable under point" "v" #'clippy-describe-variable))


<a id="org6f54d77"></a>

# DASHBOARD

Emacs Dashboard is an extensible startup screen showing you recent files, bookmarks, agenda items and an Emacs banner.


<a id="orgf21f644"></a>

## Configuring Dashboard

    (use-package dashboard
      :init      ;; tweak dashboard config before loading it
      (setq dashboard-set-heading-icons t)
      (setq dashboard-set-file-icons t)
      (setq dashboard-banner-logo-title "\nKEYBINDINGS:\
    \nFind file               (SPC .)     \
    Open buffer list    (SPC b i)\
    \nFind recent files       (SPC f r)   \
    Open the eshell     (SPC e s)\
    \nOpen dired file manager (SPC d d)   \
    List of keybindings (SPC h b b)")
      ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
      (setq dashboard-startup-banner "~/.config/doom/doom-vapourwave.png")  ;; use custom image as banner
      (setq dashboard-center-content nil) ;; set to 't' for centered content
      (setq dashboard-items '((recents . 5)
                              (agenda . 5 )
                              (bookmarks . 5)
                              (projects . 5)
                              (registers . 5)))
      :config
      (dashboard-setup-startup-hook)
      (dashboard-modify-heading-icons '((recents . "file-text")
                                        (bookmarks . "book"))))


<a id="org8fcd097"></a>

## Dashboard in Emacsclient

This setting ensures that emacsclient always opens on **dashboard** rather than **scratch**.

    (setq doom-fallback-buffer-name "*dashboard*")


<a id="orgab1034f"></a>

# DIRED

Dired is the file manager within Emacs.  Below, I setup keybindings for image previews (peep-dired).  Doom Emacs does not use &rsquo;SPC d&rsquo; for any of its keybindings, so I&rsquo;ve chosen the format of &rsquo;SPC d&rsquo; plus &rsquo;key&rsquo;.


<a id="orgaf5d11e"></a>

## Keybindings To Open Dired

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">dired</td>
<td class="org-left"><i>Open dired file manager</i></td>
<td class="org-left">SPC d d</td>
</tr>


<tr>
<td class="org-left">dired-jump</td>
<td class="org-left"><i>Jump to current directory in dired</i></td>
<td class="org-left">SPC d j</td>
</tr>
</tbody>
</table>


<a id="org4089273"></a>

## Keybindings Within Dired


<a id="orgba918dd"></a>

### Basic dired commands

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">dired-view-file</td>
<td class="org-left"><i>View file in dired</i></td>
<td class="org-left">SPC d v</td>
</tr>


<tr>
<td class="org-left">dired-up-directory</td>
<td class="org-left"><i>Go up in directory tree</i></td>
<td class="org-left">h</td>
</tr>


<tr>
<td class="org-left">dired-find-file</td>
<td class="org-left"><i>Go down in directory tree (or open if file)</i></td>
<td class="org-left">l</td>
</tr>


<tr>
<td class="org-left">dired-next-line</td>
<td class="org-left">Move down to next line</td>
<td class="org-left">j</td>
</tr>


<tr>
<td class="org-left">dired-previous-line</td>
<td class="org-left">Move up to previous line</td>
<td class="org-left">k</td>
</tr>


<tr>
<td class="org-left">dired-mark</td>
<td class="org-left">Mark file at point</td>
<td class="org-left">m</td>
</tr>


<tr>
<td class="org-left">dired-unmark</td>
<td class="org-left">Unmark file at point</td>
<td class="org-left">u</td>
</tr>


<tr>
<td class="org-left">dired-do-copy</td>
<td class="org-left">Copy current file or marked files</td>
<td class="org-left">C</td>
</tr>


<tr>
<td class="org-left">dired-do-rename</td>
<td class="org-left">Rename current file or marked files</td>
<td class="org-left">R</td>
</tr>


<tr>
<td class="org-left">dired-hide-details</td>
<td class="org-left">Toggle detailed listings on/off</td>
<td class="org-left">(</td>
</tr>


<tr>
<td class="org-left">dired-git-info-mode</td>
<td class="org-left">Toggle git information on/off</td>
<td class="org-left">)</td>
</tr>


<tr>
<td class="org-left">dired-create-directory</td>
<td class="org-left">Create new empty directory</td>
<td class="org-left">+</td>
</tr>


<tr>
<td class="org-left">dired-diff</td>
<td class="org-left">Compare file at point with another</td>
<td class="org-left">=</td>
</tr>


<tr>
<td class="org-left">dired-subtree-toggle</td>
<td class="org-left">Toggle viewing subtree at point</td>
<td class="org-left">TAB</td>
</tr>
</tbody>
</table>


<a id="org1b8c2b6"></a>

### Dired commands using regex

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">dired-mark-files-regexp</td>
<td class="org-left">Mark files using regex</td>
<td class="org-left">% m</td>
</tr>


<tr>
<td class="org-left">dired-do-copy-regexp</td>
<td class="org-left">Copy files using regex</td>
<td class="org-left">% C</td>
</tr>


<tr>
<td class="org-left">dired-do-rename-regexp</td>
<td class="org-left">Rename files using regex</td>
<td class="org-left">% R</td>
</tr>


<tr>
<td class="org-left">dired-mark-files-regexp</td>
<td class="org-left">Mark all files using regex</td>
<td class="org-left">* %</td>
</tr>
</tbody>
</table>


<a id="org39aad9d"></a>

### File permissions and ownership

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">dired-do-chgrp</td>
<td class="org-left">Change the group of marked files</td>
<td class="org-left">g G</td>
</tr>


<tr>
<td class="org-left">dired-do-chmod</td>
<td class="org-left">Change the mode of marked files</td>
<td class="org-left">M</td>
</tr>


<tr>
<td class="org-left">dired-do-chown</td>
<td class="org-left">Change the owner of marked files</td>
<td class="org-left">O</td>
</tr>


<tr>
<td class="org-left">dired-do-rename</td>
<td class="org-left">Rename file or all marked files</td>
<td class="org-left">R</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("d" . "dired")
           :desc "Open dired" "d" #'dired
           :desc "Dired jump to current" "j" #'dired-jump)
          (:after dired
           (:map dired-mode-map
            :desc "Peep-dired image previews" "d p" #'peep-dired
            :desc "Dired view file" "d v" #'dired-view-file)))
    
    (evil-define-key 'normal dired-mode-map
      (kbd "M-RET") 'dired-display-file
      (kbd "h") 'dired-up-directory
      (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
      (kbd "m") 'dired-mark
      (kbd "t") 'dired-toggle-marks
      (kbd "u") 'dired-unmark
      (kbd "C") 'dired-do-copy
      (kbd "D") 'dired-do-delete
      (kbd "J") 'dired-goto-file
      (kbd "M") 'dired-do-chmod
      (kbd "O") 'dired-do-chown
      (kbd "P") 'dired-do-print
      (kbd "R") 'dired-do-rename
      (kbd "T") 'dired-do-touch
      (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
      (kbd "+") 'dired-create-directory
      (kbd "-") 'dired-up-directory
      (kbd "% l") 'dired-downcase
      (kbd "% u") 'dired-upcase
      (kbd "; d") 'epa-dired-do-decrypt
      (kbd "; e") 'epa-dired-do-encrypt)
    ;; Get file icons in dired
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    ;; With dired-open plugin, you can launch external programs for certain extensions
    ;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
    (setq dired-open-extensions '(("gif" . "sxiv")
                                  ("jpg" . "sxiv")
                                  ("png" . "sxiv")
                                  ("mkv" . "mpv")
                                  ("mp4" . "mpv")))


<a id="org9c544a9"></a>

## Keybindings Within Dired With Peep-Dired-Mode Enabled

If peep-dired is enabled, you will get image previews as you go up/down with &rsquo;j&rsquo; and &rsquo;k&rsquo;

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">peep-dired</td>
<td class="org-left"><i>Toggle previews within dired</i></td>
<td class="org-left">SPC d p</td>
</tr>


<tr>
<td class="org-left">peep-dired-next-file</td>
<td class="org-left"><i>Move to next file in peep-dired-mode</i></td>
<td class="org-left">j</td>
</tr>


<tr>
<td class="org-left">peep-dired-prev-file</td>
<td class="org-left"><i>Move to previous file in peep-dired-mode</i></td>
<td class="org-left">k</td>
</tr>
</tbody>
</table>

    (evil-define-key 'normal peep-dired-mode-map
      (kbd "j") 'peep-dired-next-file
      (kbd "k") 'peep-dired-prev-file)
    (add-hook 'peep-dired-hook 'evil-normalize-keymaps)


<a id="orgb516163"></a>

## Making deleted files go to trash can

    (setq delete-by-moving-to-trash t
          trash-directory "~/.local/share/Trash/files/")


<a id="orgc0da4dd"></a>

# DOOM THEME

Setting the theme to doom-one.  To try out new themes, I set a keybinding for counsel-load-theme with &rsquo;SPC h t&rsquo;.

    (setq doom-theme 'doom-one)
    (map! :leader
          :desc "Load new theme" "h t" #'counsel-load-theme)


<a id="org537a912"></a>

# ELFEED

An RSS newsfeed reader for Emacs.

    (use-package! elfeed-goodies)
    (elfeed-goodies/setup)
    (setq elfeed-goodies/entry-pane-size 0.5)
    (add-hook 'elfeed-show-mode-hook 'visual-line-mode)
    (evil-define-key 'normal elfeed-show-mode-map
      (kbd "J") 'elfeed-goodies/split-show-next
      (kbd "K") 'elfeed-goodies/split-show-prev)
    (evil-define-key 'normal elfeed-search-mode-map
      (kbd "J") 'elfeed-goodies/split-show-next
      (kbd "K") 'elfeed-goodies/split-show-prev)
    (setq elfeed-feeds (quote
                        (("https://www.reddit.com/r/linux.rss" reddit linux)
                         ("https://www.reddit.com/r/commandline.rss" reddit commandline)
                         ("https://www.reddit.com/r/distrotube.rss" reddit distrotube)
                         ("https://www.reddit.com/r/emacs.rss" reddit emacs)
                         ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
                         ("https://hackaday.com/blog/feed/" hackaday linux)
                         ("https://opensource.com/feed" opensource linux)
                         ("https://linux.softpedia.com/backend.xml" softpedia linux)
                         ("https://itsfoss.com/feed/" itsfoss linux)
                         ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
                         ("https://www.phoronix.com/rss.php" phoronix linux)
                         ("http://feeds.feedburner.com/d0od" omgubuntu linux)
                         ("https://www.computerworld.com/index.rss" computerworld linux)
                         ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
                         ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
                         ("https://betanews.com/feed" betanews linux)
                         ("http://lxer.com/module/newswire/headlines.rss" lxer linux)
                         ("https://distrowatch.com/news/dwd.xml" distrowatch linux))))


<a id="org429bc60"></a>

# EMMS

One of the media players available for Emacs is emms, which stands for Emacs Multimedia System.  By default, Doom Emacs does not use &rsquo;SPC a&rsquo;,&rsquo; so the format I use for these bindings is &rsquo;SPC a&rsquo; plus &rsquo;key&rsquo;.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">emms-playlist-mode-go</td>
<td class="org-left"><i>Switch to the playlist buffer</i></td>
<td class="org-left">SPC a a</td>
</tr>


<tr>
<td class="org-left">emms-pause</td>
<td class="org-left"><i>Pause the track</i></td>
<td class="org-left">SPC a x</td>
</tr>


<tr>
<td class="org-left">emms-stop</td>
<td class="org-left"><i>Stop the track</i></td>
<td class="org-left">SPC a s</td>
</tr>


<tr>
<td class="org-left">emms-previous</td>
<td class="org-left"><i>Play previous track in playlist</i></td>
<td class="org-left">SPC a p</td>
</tr>


<tr>
<td class="org-left">emms-next</td>
<td class="org-left"><i>Play next track in playlist</i></td>
<td class="org-left">SPC a n</td>
</tr>
</tbody>
</table>

    (emms-all)
    (emms-default-players)
    (emms-mode-line 1)
    (emms-playing-time 1)
    (setq emms-source-file-default-directory "~/Music/"
          emms-playlist-buffer-name "*Music*"
          emms-info-asynchronously t
          emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
    (map! :leader
          (:prefix ("e" . "EMMS audio player")
           :desc "Go to emms playlist" "a" #'emms-playlist-mode-go
           :desc "Emms pause track" "x" #'emms-pause
           :desc "Emms stop track" "s" #'emms-stop
           :desc "Emms play previous track" "p" #'emms-previous
           :desc "Emms play next track" "n" #'emms-next))


<a id="orgcf13bbf"></a>

# EMOJIS

Emojify is an Emacs extension to display emojis. It can display github style emojis like :smile: or plain ascii ones like :).

    (use-package emojify
      :hook (after-init . global-emojify-mode))


<a id="org749bab7"></a>

# ERC

ERC is a built-in Emacs IRC client.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">erc-tls</td>
<td class="org-left"><i>Launch ERC using more secure TLS connection</i></td>
<td class="org-left">SPC e E</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("e". "evaluate/ERC/EWW")
           :desc "Launch ERC with TLS connection" "E" #'erc-tls))
    
    (setq erc-prompt (lambda () (concat "[" (buffer-name) "]"))
          erc-server "irc.libera.chat"
          erc-nick "distrotube"
          erc-user-full-name "Derek Taylor"
          erc-track-shorten-start 24
          erc-autojoin-channels-alist '(("irc.libera.chat" "#archlinux" "#linux" "#emacs"))
          erc-kill-buffer-on-part t
          erc-fill-column 100
          erc-fill-function 'erc-fill-static
          erc-fill-static-center 20
          ;; erc-auto-query 'bury
          )


<a id="org97ec036"></a>

# EVALUATE ELISP EXPRESSIONS

Changing some keybindings from their defaults to better fit with Doom Emacs, and to avoid conflicts with my window managers which sometimes use the control key in their keybindings.  By default, Doom Emacs does not use &rsquo;SPC e&rsquo; for anything, so I choose to use the format &rsquo;SPC e&rsquo; plus &rsquo;key&rsquo; for these (I also use &rsquo;SPC e&rsquo; for &rsquo;eww&rsquo; keybindings).

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">eval-buffer</td>
<td class="org-left"><i>Evaluate elisp in buffer</i></td>
<td class="org-left">SPC e b</td>
</tr>


<tr>
<td class="org-left">eval-defun</td>
<td class="org-left"><i>Evaluate the defun containing or after point</i></td>
<td class="org-left">SPC e d</td>
</tr>


<tr>
<td class="org-left">eval-expression</td>
<td class="org-left"><i>Evaluate an elisp expression</i></td>
<td class="org-left">SPC e e</td>
</tr>


<tr>
<td class="org-left">eval-last-sexp</td>
<td class="org-left"><i>Evaluate elisp expression before point</i></td>
<td class="org-left">SPC e l</td>
</tr>


<tr>
<td class="org-left">eval-region</td>
<td class="org-left"><i>Evaluate elisp in region</i></td>
<td class="org-left">SPC e r</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("e". "evaluate/ERC/EWW")
           :desc "Evaluate elisp in buffer" "b" #'eval-buffer
           :desc "Evaluate defun" "d" #'eval-defun
           :desc "Evaluate elisp expression" "e" #'eval-expression
           :desc "Evaluate last sexpression" "l" #'eval-last-sexp
           :desc "Evaluate elisp in region" "r" #'eval-region))


<a id="org85f8696"></a>

# EWW

EWW is the Emacs Web Wowser, the builtin browser in Emacs.  Below I set urls to open in a specific browser (eww) with browse-url-browser-function.  By default, Doom Emacs does not use &rsquo;SPC e&rsquo; for anything, so I choose to use the format &rsquo;SPC e&rsquo; plus &rsquo;key&rsquo; for these (I also use &rsquo;SPC e&rsquo; for &rsquo;eval&rsquo; keybindings).  I chose to use &rsquo;SPC s w&rsquo; for eww-search-words because Doom Emacs uses &rsquo;SPC s&rsquo; for &rsquo;search&rsquo; commands.

    (setq browse-url-browser-function 'eww-browse-url)
    (map! :leader
          :desc "Search web for text between BEG/END"
          "s w" #'eww-search-words
          (:prefix ("e" . "evaluate/ERC/EWW")
           :desc "Eww web browser" "w" #'eww
           :desc "Eww reload page" "R" #'eww-reload))


<a id="orgaf74783"></a>

# FONTS

Settings related to fonts within Doom Emacs:

-   &rsquo;doom-font&rsquo; &#x2013; standard monospace font that is used for most things in Emacs.
-   &rsquo;doom-variable-pitch-font&rsquo; &#x2013; variable font which is useful in some Emacs plugins.
-   &rsquo;doom-big-font&rsquo; &#x2013; used in doom-big-font-mode; useful for presentations.
-   &rsquo;font-lock-comment-face&rsquo; &#x2013; for comments.
-   &rsquo;font-lock-keyword-face&rsquo; &#x2013; for keywords with special significance like &rsquo;setq&rsquo; in elisp.

    (setq doom-font (font-spec :family "JetBrains Mono" :size 25)
          doom-variable-pitch-font (font-spec :family "Ubuntu" :size 25)
          doom-big-font (font-spec :family "JetBrains Mono" :size 34))
    (after! doom-themes
      (setq doom-themes-enable-bold t
            doom-themes-enable-italic t))
    (custom-set-faces!
      '(font-lock-comment-face :slant italic)
      '(font-lock-keyword-face :slant italic))


<a id="org0031ae4"></a>

# INSERT DATE

Some custom functions to insert the date.  The function &rsquo;insert-todays-date&rsquo; can be used one of three different ways: (1) just the keybinding without the universal argument prefix, (2) with one universal argument prefix, or (3) with two universal argument prefixes.  The universal argument prefix is &rsquo;SPC-u&rsquo; in Doom Emacs (C-u in standard GNU Emacs).  The function &rsquo;insert-any-date&rsquo; only outputs to one format, which is the same format as &rsquo;insert-todays-date&rsquo; without a prefix.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">EXAMPLE OUTPUT</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">dt/insert-todays-date</td>
<td class="org-left">Friday, November 19, 2021</td>
<td class="org-left">SPC i d t</td>
</tr>


<tr>
<td class="org-left">dt/insert-todays-date</td>
<td class="org-left">11-19-2021</td>
<td class="org-left">SPC u SPC i d t</td>
</tr>


<tr>
<td class="org-left">dt/insert-todays-date</td>
<td class="org-left">2021-11-19</td>
<td class="org-left">SPC u SPC u SPC i d t</td>
</tr>


<tr>
<td class="org-left">dt/insert-any-date</td>
<td class="org-left">Friday, November 19, 2021</td>
<td class="org-left">SPC i d a</td>
</tr>
</tbody>
</table>

    (defun dt/insert-todays-date (prefix)
      (interactive "P")
      (let ((format (cond
                     ((not prefix) "%A, %B %d, %Y")
                     ((equal prefix '(4)) "%m-%d-%Y")
                     ((equal prefix '(16)) "%Y-%m-%d"))))
        (insert (format-time-string format))))
    
    (require 'calendar)
    (defun dt/insert-any-date (date)
      "Insert DATE using the current locale."
      (interactive (list (calendar-read-date)))
      (insert (calendar-date-string date)))
    
    (map! :leader
          (:prefix ("i d" . "Insert date")
            :desc "Insert any date" "a" #'dt/insert-any-date
            :desc "Insert todays date" "t" #'dt/insert-todays-date))


<a id="orgb04edf5"></a>

# IVY

Ivy is a generic completion mechanism for Emacs.


<a id="org2ef57da"></a>

## IVY-POSFRAME

Ivy-posframe is an ivy extension, which lets ivy use posframe to show its candidate menu.  Some of the settings below involve:

-   ivy-posframe-display-functions-alist &#x2013; sets the display position for specific programs
-   ivy-posframe-height-alist &#x2013; sets the height of the list displayed for specific programs

Available functions (positions) for &rsquo;ivy-posframe-display-functions-alist&rsquo;

-   ivy-posframe-display-at-frame-center
-   ivy-posframe-display-at-window-center
-   ivy-posframe-display-at-frame-bottom-left
-   ivy-posframe-display-at-window-bottom-left
-   ivy-posframe-display-at-frame-bottom-window-center
-   ivy-posframe-display-at-point
-   ivy-posframe-display-at-frame-top-center

`NOTE:` If the setting for &rsquo;ivy-posframe-display&rsquo; is set to &rsquo;nil&rsquo; (false), anything that is set to &rsquo;ivy-display-function-fallback&rsquo; will just default to their normal position in Doom Emacs (usually a bottom split).  However, if this is set to &rsquo;t&rsquo; (true), then the fallback position will be centered in the window.

    (setq ivy-posframe-display-functions-alist
          '((swiper                     . ivy-posframe-display-at-point)
            (complete-symbol            . ivy-posframe-display-at-point)
            (counsel-M-x                . ivy-display-function-fallback)
            (counsel-esh-history        . ivy-posframe-display-at-window-center)
            (counsel-describe-function  . ivy-display-function-fallback)
            (counsel-describe-variable  . ivy-display-function-fallback)
            (counsel-find-file          . ivy-display-function-fallback)
            (counsel-recentf            . ivy-display-function-fallback)
            (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
            (dmenu                      . ivy-posframe-display-at-frame-top-center)
            (nil                        . ivy-posframe-display))
          ivy-posframe-height-alist
          '((swiper . 20)
            (dmenu . 20)
            (t . 10)))
    (ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.


<a id="org2bd8aaa"></a>

## IVY KEYBINDINGS

By default, Doom Emacs does not use &rsquo;SPC v&rsquo;, so the format I use for these bindings is &rsquo;SPC v&rsquo; plus &rsquo;key&rsquo;.

    (map! :leader
          (:prefix ("v" . "Ivy")
           :desc "Ivy push view" "v p" #'ivy-push-view
           :desc "Ivy switch view" "v s" #'ivy-switch-view))


<a id="orgcc41533"></a>

# LINE SETTINGS

I set comment-line to &rsquo;SPC TAB TAB&rsquo; which is a rather comfortable keybinding for me on my ZSA Moonlander keyboard.  The standard Emacs keybinding for comment-line is &rsquo;C-x C-;&rsquo;.  The other keybindings are for commands that toggle on/off various line-related settings.  Doom Emacs uses &rsquo;SPC t&rsquo; for &ldquo;toggle&rdquo; commands, so I choose &rsquo;SPC t&rsquo; plus &rsquo;key&rsquo; for those bindings.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">comment-line</td>
<td class="org-left"><i>Comment or uncomment lines</i></td>
<td class="org-left">SPC TAB TAB</td>
</tr>


<tr>
<td class="org-left">hl-line-mode</td>
<td class="org-left"><i>Toggle line highlighting in current frame</i></td>
<td class="org-left">SPC t h</td>
</tr>


<tr>
<td class="org-left">global-hl-line-mode</td>
<td class="org-left"><i>Toggle line highlighting globally</i></td>
<td class="org-left">SPC t H</td>
</tr>


<tr>
<td class="org-left">doom/toggle-line-numbers</td>
<td class="org-left"><i>Toggle line numbers</i></td>
<td class="org-left">SPC t l</td>
</tr>


<tr>
<td class="org-left">toggle-truncate-lines</td>
<td class="org-left"><i>Toggle truncate lines</i></td>
<td class="org-left">SPC t t</td>
</tr>
</tbody>
</table>

    (setq display-line-numbers-type t)
    (map! :leader
          :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
          (:prefix ("t" . "toggle")
           :desc "Toggle line numbers" "l" #'doom/toggle-line-numbers
           :desc "Toggle line highlight in frame" "h" #'hl-line-mode
           :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
           :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))


<a id="orgcbaee25"></a>

# MARKDOWN

    (custom-set-faces
     '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
     '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
     '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
     '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
     '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
     '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
     '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))


<a id="org19914ce"></a>

# MINIMAP

A minimap sidebar displaying a smaller version of the current buffer on either the left or right side. It highlights the currently shown region and updates its position automatically.  Be aware that this minimap program does not work in Org documents.  This is not unusual though because I have tried several minimap programs and none of them can handle Org.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">minimap-mode</td>
<td class="org-left"><i>Toggle minimap-mode</i></td>
<td class="org-left">SPC t m</td>
</tr>
</tbody>
</table>

    (setq minimap-window-location 'right)
    (map! :leader
          (:prefix ("t" . "toggle")
           :desc "Toggle minimap-mode" "m" #'minimap-mode))


<a id="orgb1eb4bb"></a>

# MODELINE

The modeline is the bottom status bar that appears in Emacs windows.  For more information on what is available to configure in the Doom modeline, check out:
<https://github.com/seagle0128/doom-modeline>

    (set-face-attribute 'mode-line nil :font "Ubuntu Mono-13")
    (setq doom-modeline-height 30     ;; sets modeline height
          doom-modeline-bar-width 5   ;; sets right bar width
          doom-modeline-persp-name t  ;; adds perspective name to modeline
          doom-modeline-persp-icon t) ;; adds folder icon next to persp name


<a id="org14c452d"></a>

# MOUSE SUPPORT

Adding mouse support in the terminal version of Emacs.

    (xterm-mouse-mode 1)


<a id="orga3f2325"></a>

# NEOTREE

Neotree is a file tree viewer.  When you open neotree, it jumps to the current file thanks to neo-smart-open.  The neo-window-fixed-size setting makes the neotree width be adjustable.  Doom Emacs had no keybindings set for neotree.  Since Doom Emacs uses &rsquo;SPC t&rsquo; for &rsquo;toggle&rsquo; keybindings, I used &rsquo;SPC t n&rsquo; for toggle-neotree.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">neotree-toggle</td>
<td class="org-left"><i>Toggle neotree</i></td>
<td class="org-left">SPC t n</td>
</tr>


<tr>
<td class="org-left">neotree- dir</td>
<td class="org-left"><i>Open directory in neotree</i></td>
<td class="org-left">SPC d n</td>
</tr>
</tbody>
</table>

    (after! neotree
      (setq neo-smart-open t
            neo-window-fixed-size nil))
    (after! doom-themes
      (setq doom-neotree-enable-variable-pitch t))
    (map! :leader
          :desc "Toggle neotree file viewer" "t n" #'neotree-toggle
          :desc "Open directory in neotree" "d n" #'neotree-dir)


<a id="org34c8b9a"></a>

# OPEN SPECIFIC FILES

Keybindings to open files that I work with all the time using the find-file command, which is the interactive file search that opens with &rsquo;C-x C-f&rsquo; in GNU Emacs or &rsquo;SPC f f&rsquo; in Doom Emacs.  These keybindings use find-file non-interactively since we specify exactly what file to open.  The format I use for these bindings is &rsquo;SPC =&rsquo; plus &rsquo;key&rsquo; since Doom Emacs does not use &rsquo;SPC =&rsquo;.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">PATH TO FILE</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">~/Org/agenda.org</td>
<td class="org-left"><i>Edit agenda file</i></td>
<td class="org-left">SPC = a</td>
</tr>


<tr>
<td class="org-left">~/.config/doom/config.org&ldquo;</td>
<td class="org-left"><i>Edit doom config.org</i></td>
<td class="org-left">SPC = c</td>
</tr>


<tr>
<td class="org-left">~/.config/doom/init.el&ldquo;</td>
<td class="org-left"><i>Edit doom init.el</i></td>
<td class="org-left">SPC = i</td>
</tr>


<tr>
<td class="org-left">~/.config/doom/packages.el&ldquo;</td>
<td class="org-left"><i>Edit doom packages.el</i></td>
<td class="org-left">SPC = p</td>
</tr>


<tr>
<td class="org-left">~/.config/doom/eshell/aliases&ldquo;</td>
<td class="org-left"><i>Edit eshell aliases</i></td>
<td class="org-left">SPC = e a</td>
</tr>


<tr>
<td class="org-left">~/.config/doom/eshell/profile&ldquo;</td>
<td class="org-left"><i>Edit eshell profile</i></td>
<td class="org-left">SPC = e p</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("=" . "open file")
           :desc "Edit agenda file" "a" #'(lambda () (interactive) (find-file "~/Org/agenda.org"))
           :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.config/doom/config.org"))
           :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.config/doom/init.el"))
           :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.config/doom/packages.el"))))
    (map! :leader
          (:prefix ("= e" . "open eshell files")
           :desc "Edit eshell aliases" "a" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/aliases"))
           :desc "Edit eshell profile" "p" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/profile"))))


<a id="org93c5d4c"></a>

# ORG MODE

I wrapped most of this block in (after! org).  Without this, my settings might be evaluated too early, which will result in my settings being overwritten by Doom&rsquo;s defaults.  I have also enabled org-journal, org-superstar and org-roam by adding (+journal +pretty +roam2) to the org section of my Doom Emacs init.el.

`NOTE:` I have the location of my Org directory and Roam directory in $HOME/nc/ which is a Nextcloud folder that allows me to instantly sync all of my Org work between my home computer and my office computer.

    (map! :leader
          :desc "Org babel tangle" "m B" #'org-babel-tangle)
    (after! org
      (setq org-directory "~/nc/Org/"
            org-agenda-files '("~/nc/Org/agenda.org")
            org-default-notes-file (expand-file-name "notes.org" org-directory)
            org-ellipsis " ▼ "
            org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
            org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
            org-log-done 'time
            org-hide-emphasis-markers t
            ;; ex. of org-link-abbrev-alist in action
            ;; [[arch-wiki:Name_of_Page][Description]]
            org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
              '(("google" . "http://www.google.com/search?q=")
                ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
                ("ddg" . "https://duckduckgo.com/?q=")
                ("wiki" . "https://en.wikipedia.org/wiki/"))
            org-table-convert-region-max-lines 20000
            org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
              '((sequence
                 "TODO(t)"           ; A task that is ready to be tackled
                 "BLOG(b)"           ; Blog writing assignments
                 "GYM(g)"            ; Things to accomplish at the gym
                 "PROJ(p)"           ; A project that contains other tasks
                 "VIDEO(v)"          ; Video assignments
                 "WAIT(w)"           ; Something is holding up this task
                 "|"                 ; The pipe necessary to separate "active" states and "inactive" states
                 "DONE(d)"           ; Task has been completed
                 "CANCELLED(c)" )))) ; Task has been cancelled


<a id="org97d54b3"></a>

## Org fonts

I have created an interactive function for each color scheme (M-x dt/org-colors-\*).  These functions will set appropriate colors and font attributes for org-level fonts and the org-table font.

    
    (defun dt/org-colors-doom-one ()
      "Enable Doom One colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#51afef" ultra-bold)
             (org-level-2 1.6 "#c678dd" extra-bold)
             (org-level-3 1.5 "#98be65" bold)
             (org-level-4 1.4 "#da8548" semi-bold)
             (org-level-5 1.3 "#5699af" normal)
             (org-level-6 1.2 "#a9a1e1" normal)
             (org-level-7 1.1 "#46d9ff" normal)
             (org-level-8 1.0 "#ff6c6b" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-dracula ()
      "Enable Dracula colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#8be9fd" ultra-bold)
             (org-level-2 1.6 "#bd93f9" extra-bold)
             (org-level-3 1.5 "#50fa7b" bold)
             (org-level-4 1.4 "#ff79c6" semi-bold)
             (org-level-5 1.3 "#9aedfe" normal)
             (org-level-6 1.2 "#caa9fa" normal)
             (org-level-7 1.1 "#5af78e" normal)
             (org-level-8 1.0 "#ff92d0" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-gruvbox-dark ()
      "Enable Gruvbox Dark colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#458588" ultra-bold)
             (org-level-2 1.6 "#b16286" extra-bold)
             (org-level-3 1.5 "#98971a" bold)
             (org-level-4 1.4 "#fb4934" semi-bold)
             (org-level-5 1.3 "#83a598" normal)
             (org-level-6 1.2 "#d3869b" normal)
             (org-level-7 1.1 "#d79921" normal)
             (org-level-8 1.0 "#8ec07c" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-monokai-pro ()
      "Enable Monokai Pro colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#78dce8" ultra-bold)
             (org-level-2 1.6 "#ab9df2" extra-bold)
             (org-level-3 1.5 "#a9dc76" bold)
             (org-level-4 1.4 "#fc9867" semi-bold)
             (org-level-5 1.3 "#ff6188" normal)
             (org-level-6 1.2 "#ffd866" normal)
             (org-level-7 1.1 "#78dce8" normal)
             (org-level-8 1.0 "#ab9df2" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-nord ()
      "Enable Nord colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#81a1c1" ultra-bold)
             (org-level-2 1.6 "#b48ead" extra-bold)
             (org-level-3 1.5 "#a3be8c" bold)
             (org-level-4 1.4 "#ebcb8b" semi-bold)
             (org-level-5 1.3 "#bf616a" normal)
             (org-level-6 1.2 "#88c0d0" normal)
             (org-level-7 1.1 "#81a1c1" normal)
             (org-level-8 1.0 "#b48ead" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-oceanic-next ()
      "Enable Oceanic Next colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#6699cc" ultra-bold)
             (org-level-2 1.6 "#c594c5" extra-bold)
             (org-level-3 1.5 "#99c794" bold)
             (org-level-4 1.4 "#fac863" semi-bold)
             (org-level-5 1.3 "#5fb3b3" normal)
             (org-level-6 1.2 "#ec5f67" normal)
             (org-level-7 1.1 "#6699cc" normal)
             (org-level-8 1.0 "#c594c5" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-palenight ()
      "Enable Palenight colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#82aaff" ultra-bold)
             (org-level-2 1.6 "#c792ea" extra-bold)
             (org-level-3 1.5 "#c3e88d" bold)
             (org-level-4 1.4 "#ffcb6b" semi-bold)
             (org-level-5 1.3 "#a3f7ff" normal)
             (org-level-6 1.2 "#e1acff" normal)
             (org-level-7 1.1 "#f07178" normal)
             (org-level-8 1.0 "#ddffa7" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-solarized-dark ()
      "Enable Solarized Dark colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#268bd2" ultra-bold)
             (org-level-2 1.6 "#d33682" extra-bold)
             (org-level-3 1.5 "#859900" bold)
             (org-level-4 1.4 "#b58900" semi-bold)
             (org-level-5 1.3 "#cb4b16" normal)
             (org-level-6 1.2 "#6c71c4" normal)
             (org-level-7 1.1 "#2aa198" normal)
             (org-level-8 1.0 "#657b83" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-solarized-light ()
      "Enable Solarized Light colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#268bd2" ultra-bold)
             (org-level-2 1.6 "#d33682" extra-bold)
             (org-level-3 1.5 "#859900" bold)
             (org-level-4 1.4 "#b58900" semi-bold)
             (org-level-5 1.3 "#cb4b16" normal)
             (org-level-6 1.2 "#6c71c4" normal)
             (org-level-7 1.1 "#2aa198" normal)
             (org-level-8 1.0 "#657b83" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    (defun dt/org-colors-tomorrow-night ()
      "Enable Tomorrow Night colors for Org headers."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.7 "#81a2be" ultra-bold)
             (org-level-2 1.6 "#b294bb" extra-bold)
             (org-level-3 1.5 "#b5bd68" bold)
             (org-level-4 1.4 "#e6c547" semi-bold)
             (org-level-5 1.3 "#cc6666" normal)
             (org-level-6 1.2 "#70c0ba" normal)
             (org-level-7 1.1 "#b77ee0" normal)
             (org-level-8 1.0 "#9ec400" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
    
    ;; Load our desired dt/org-colors-* theme on startup
    (dt/org-colors-doom-one)


<a id="org17f9b8c"></a>

## Org-export

We need ox-man for &ldquo;Org eXporting&rdquo; to manpage format and ox-gemini for exporting to gemtext (for the gemini protocol).

`NOTE`: I also enable ox-publish for converting an Org site into an HTML site, but that is done in init.el (org +publish).

    (use-package ox-man)
    (use-package ox-gemini)


<a id="org1c3a54a"></a>

## Org-journal

    (setq org-journal-dir "~/nc/Org/journal/"
          org-journal-date-prefix "* "
          org-journal-time-prefix "** "
          org-journal-date-format "%B %d, %Y (%A) "
          org-journal-file-format "%Y-%m-%d.org")


<a id="orgf1aa6ad"></a>

## Org-publish

    (setq org-publish-use-timestamps-flag nil)
    (setq org-export-with-broken-links t)
    (setq org-publish-project-alist
          '(("distro.tube without manpages"
             :base-directory "~/nc/gitlab-repos/distro.tube/"
             :base-extension "org"
             :publishing-directory "~/nc/gitlab-repos/distro.tube/html/"
             :recursive t
             :exclude "org-html-themes/.*\\|man-org/man*"
             :publishing-function org-html-publish-to-html
             :headline-levels 4             ; Just the default for this project.
             :auto-preamble t)
          ))


<a id="org470db00"></a>

## Org-auto-tangle

`org-auto-tangle` allows you to add the option `#+auto_tangle: t` in your Org file so that it automatically tangles when you save the document.

    (use-package! org-auto-tangle
      :defer t
      :hook (org-mode . org-auto-tangle-mode)
      :config
      (setq org-auto-tangle-default t))


<a id="orgd03ef3b"></a>

# PASSWORD STORE

Uses the standard Unix password store &ldquo;pass&rdquo;.

    (use-package! password-store)


<a id="orgfcd9598"></a>

# PERSPECTIVE

Perspective provides multiple named workspaces (or &ldquo;perspectives&rdquo;) in Emacs, similar to having multiple desktops in window managers like Awesome and XMonad.  Each perspective has its own buffer list and its own window layout, making it easy to work on many separate projects without getting lost in all the buffers.  Switching to a perspective activates its window configuration, and when in a perspective, only its buffers are available (by default).  Doom Emacs uses &rsquo;SPC some<sub>key</sub>&rsquo; for binding some of the perspective commands, so I used this binging format for the perspective bindings that I created..

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">persp-switch</td>
<td class="org-left">Switch to perspective NAME</td>
<td class="org-left">SPC DEL</td>
</tr>


<tr>
<td class="org-left">persp-switch-to-buffer</td>
<td class="org-left">Switch to buffer in perspective</td>
<td class="org-left">SPC ,</td>
</tr>


<tr>
<td class="org-left">persp-next</td>
<td class="org-left">Switch to next perspective</td>
<td class="org-left">SPC ]</td>
</tr>


<tr>
<td class="org-left">persp-prev</td>
<td class="org-left">Switch to previous perspective</td>
<td class="org-left">SPC [</td>
</tr>


<tr>
<td class="org-left">persp-add-buffer</td>
<td class="org-left">Add a buffer to current perspective</td>
<td class="org-left">SPC +</td>
</tr>


<tr>
<td class="org-left">persp-remove-by-name</td>
<td class="org-left">Remove perspective by name</td>
<td class="org-left">SPC -</td>
</tr>


<tr>
<td class="org-left">+workspace/switch-to-{0-9}</td>
<td class="org-left">Switch to workspace <i>n</i></td>
<td class="org-left">SPC 0-9</td>
</tr>
</tbody>
</table>

    (map! :leader
          :desc "Switch to perspective NAME" "DEL" #'persp-switch
          :desc "Switch to buffer in perspective" "," #'persp-switch-to-buffer
          :desc "Switch to next perspective" "]" #'persp-next
          :desc "Switch to previous perspective" "[" #'persp-prev
          :desc "Add a buffer current perspective" "+" #'persp-add-buffer
          :desc "Remove perspective by name" "-" #'persp-remove-by-name)


<a id="org56b886a"></a>

# RAINBOW MODE

Rainbox mode displays the actual color for any hex value color.  It&rsquo;s such a nice feature that I wanted it turned on all the time, regardless of what mode I am in.  The following creates a global minor mode for rainbow-mode and enables it.

    (define-globalized-minor-mode global-rainbow-mode rainbow-mode
      (lambda () (rainbow-mode 1)))
    (global-rainbow-mode 1 )


<a id="orgacbc57b"></a>

# REGISTERS

Emacs registers are compartments where you can save text, rectangles and positions for later use. Once you save text or a rectangle in a register, you can copy it into the buffer once or many times; once you save a position in a register, you can jump back to that position once or many times.  The default GNU Emacs keybindings for these commands (with the exception of counsel-register) involves &rsquo;C-x r&rsquo; followed by one or more other keys.  I wanted to make this a little more user friendly, and since I am using Doom Emacs, I choose to replace the &rsquo;C-x r&rsquo; part of the key chords with &rsquo;SPC r&rsquo;.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">COMMAND</th>
<th scope="col" class="org-left">DESCRIPTION</th>
<th scope="col" class="org-left">KEYBINDING</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">copy-to-register</td>
<td class="org-left"><i>Copy to register</i></td>
<td class="org-left">SPC r c</td>
</tr>


<tr>
<td class="org-left">frameset-to-register</td>
<td class="org-left"><i>Frameset to register</i></td>
<td class="org-left">SPC r f</td>
</tr>


<tr>
<td class="org-left">insert-register</td>
<td class="org-left"><i>Insert contents of register</i></td>
<td class="org-left">SPC r i</td>
</tr>


<tr>
<td class="org-left">jump-to-register</td>
<td class="org-left"><i>Jump to register</i></td>
<td class="org-left">SPC r j</td>
</tr>


<tr>
<td class="org-left">list-registers</td>
<td class="org-left"><i>List registers</i></td>
<td class="org-left">SPC r l</td>
</tr>


<tr>
<td class="org-left">number-to-register</td>
<td class="org-left"><i>Number to register</i></td>
<td class="org-left">SPC r n</td>
</tr>


<tr>
<td class="org-left">counsel-register</td>
<td class="org-left"><i>Interactively choose a register</i></td>
<td class="org-left">SPC r r</td>
</tr>


<tr>
<td class="org-left">view-register</td>
<td class="org-left"><i>View a register</i></td>
<td class="org-left">SPC r v</td>
</tr>


<tr>
<td class="org-left">window-configuration-to-register</td>
<td class="org-left"><i>Window configuration to register</i></td>
<td class="org-left">SPC r w</td>
</tr>


<tr>
<td class="org-left">increment-register</td>
<td class="org-left"><i>Increment register</i></td>
<td class="org-left">SPC r +</td>
</tr>


<tr>
<td class="org-left">point-to-register</td>
<td class="org-left"><i>Point to register</i></td>
<td class="org-left">SPC r SPC</td>
</tr>
</tbody>
</table>

    (map! :leader
          (:prefix ("r" . "registers")
           :desc "Copy to register" "c" #'copy-to-register
           :desc "Frameset to register" "f" #'frameset-to-register
           :desc "Insert contents of register" "i" #'insert-register
           :desc "Jump to register" "j" #'jump-to-register
           :desc "List registers" "l" #'list-registers
           :desc "Number to register" "n" #'number-to-register
           :desc "Interactively choose a register" "r" #'counsel-register
           :desc "View a register" "v" #'view-register
           :desc "Window configuration to register" "w" #'window-configuration-to-register
           :desc "Increment register" "+" #'increment-register
           :desc "Point to register" "SPC" #'point-to-register))


<a id="orgd7241ad"></a>

# SHELLS

Settings for the various shells and terminal emulators within Emacs.

-   &rsquo;shell-file-name&rsquo; &#x2013; sets the shell to be used in M-x shell, M-x term, M-x ansi-term and M-x vterm.
-   &rsquo;eshell-aliases-file&rsquo; &#x2013; sets an aliases file for the eshell.

    (setq shell-file-name "/bin/fish"
          vterm-max-scrollback 5000)
    (setq eshell-rc-script "~/.config/doom/eshell/profile"
          eshell-aliases-file "~/.config/doom/eshell/aliases"
          eshell-history-size 5000
          eshell-buffer-maximum-lines 5000
          eshell-hist-ignoredups t
          eshell-scroll-to-bottom-on-input t
          eshell-destroy-buffer-when-process-dies t
          eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))
    (map! :leader
          :desc "Eshell" "e s" #'eshell
          :desc "Eshell popup toggle" "e t" #'+eshell/toggle
          :desc "Counsel eshell history" "e h" #'counsel-esh-history
          :desc "Vterm popup toggle" "v t" #'+vterm/toggle)


<a id="org6568966"></a>

# SPLITS

I set splits to default to opening on the right using &rsquo;prefer-horizontal-split&rsquo;.  I set a keybinding for &rsquo;clone-indirect-buffer-other-window&rsquo; for when I want to have the same document in two splits.  The text of the indirect buffer is always identical to the text of its base buffer; changes made by editing either one are visible immediately in the other.  But in all other respects, the indirect buffer and its base buffer are completely separate.  For example, I can fold one split but other will be unfolded.

    (defun prefer-horizontal-split ()
      (set-variable 'split-height-threshold nil t)
      (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
    (add-hook 'markdown-mode-hook 'prefer-horizontal-split)
    (map! :leader
          :desc "Clone indirect buffer other window" "b c" #'clone-indirect-buffer-other-window)


<a id="org6038e64"></a>

# WINNER MODE

Winner mode has been included with GNU Emacs since version 20.  This is a global minor mode and, when activated, it allows you to “undo” (and “redo”) changes in the window configuration with the key commands &rsquo;SCP w <left>&rsquo; and &rsquo;SPC w <right>&rsquo;.

    (map! :leader
          (:prefix ("w" . "window")
           :desc "Winner redo" "<right>" #'winner-redo
           :desc "Winner undo" "<left>" #'winner-undo))


<a id="org1fc04ba"></a>

# ZAP TO CHAR

Emacs provides a &rsquo;zap-to-char&rsquo; command that kills from the current point to a character.  It is bound to &rsquo;M-z&rsquo; in standard GNU Emacs but since Doom Emacs uses &rsquo;SPC&rsquo; as its leader key and does not have &rsquo;SPC z&rsquo; binded to anything, it just makes since to use it for &rsquo;zap-to-char&rsquo;.  Note that &rsquo;zap-to-char&rsquo; can be used with the universal argument &rsquo;SPC u&rsquo; to modify its behavior.  Examples of &rsquo;zap-to-char&rsquo; usage are listed in the table below:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">KEYBINDING</th>
<th scope="col" class="org-left">WHAT IS DOES</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">SPC z e</td>
<td class="org-left">deletes all chars to the next occurrence of &rsquo;e&rsquo;</td>
</tr>


<tr>
<td class="org-left">SPC u 2 SPC z e</td>
<td class="org-left">deletes all chars to the second occurrence of &rsquo;e&rsquo;</td>
</tr>


<tr>
<td class="org-left">SPC u - SPC z e</td>
<td class="org-left">deletes all chars to the previous occurrence of &rsquo;e&rsquo;</td>
</tr>


<tr>
<td class="org-left">SPC u - 2 SPC z e</td>
<td class="org-left">deletes all chars to the second previous occurrence of &rsquo;e&rsquo;</td>
</tr>


<tr>
<td class="org-left">SPC u 1 0 0 SPC u SPC z e</td>
<td class="org-left">deletes all chars to the 100th occurrence of &rsquo;e&rsquo;</td>
</tr>
</tbody>
</table>

`TIP`: The universal argument (SPC u) can only take a single integer by default.  If you need to use a multi-digit number (like 100 in the last example in the table above), then you must terminate the universal argument with another &rsquo;SPC u&rsquo; after typing the number.

&rsquo;zap-up-to-char&rsquo; is an alternative command that does not zap the char specified.  It is binded to &rsquo;SPC Z&rsquo;.  It can also be used in conjunction with the universal argument &rsquo;SPC u&rsquo; in similar fashion to the the &rsquo;zap-to-char&rsquo; examples above.

`NOTE`:  Vim (evil mode) has similar functionality builtin.  You can delete to the next occurrence of &rsquo;e&rsquo; by using &rsquo;dte&rsquo; in normal.  To delete to the next occurrence of &rsquo;e&rsquo; including the &rsquo;e&rsquo;, then you would use &rsquo;dfe&rsquo;.  And you can modify &rsquo;dt&rsquo; and &rsquo;df&rsquo; by prefixing them with numbers, so &rsquo;2dte&rsquo; would delete to the second occurrence of &rsquo;e&rsquo;.

    (map! :leader
          :desc "Zap to char" "z" #'zap-to-char
          :desc "Zap up to char" "Z" #'zap-up-to-char)

