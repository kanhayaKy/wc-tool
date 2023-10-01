# RWC - Ruby WC Tool

`rwc` (word count) is a command-line tool in Linux used to gather various statistics from a given file or input stream. These statistics include the number of lines, word count, character count, and byte count in the specified file. `rwc` is a similar tool built using Ruby, offering the same features and the ability to accept input from the standard input stream.

## Setup

1. Ensure you have Ruby installed on your system.
2. Navigate to the `ruby` directory containing the source code.
3. Install the necessary dependencies using `bundle install`.
4. You're all set to explore this versatile tool!

## Usage

Run `bin/rwc` with the following options:

- `-l`: Print the number of lines in the file.
- `-w`: Print the number of words in the file.
- `-c`: Print the number of bytes in the file.
- `-m`: Print the number of characters in the file.

## Examples

1. For a file named `test.txt`, when no option is provided, `rwc` displays line count, word count, and character count:
   ```bash
   foo:~$ bin/rwc test.txt
   7143 58164 334997 test.txt
   ```

2. To count the number of lines in test.txt:
    ```bash
    foo:~$ bin/rwc -l test.txt
    7143 test.txt
    ```

3. Input from standard input stream using a pipe (|):
   ```bash
   foo:~$ cat test.txt | bin/rwc
   7143 58164 334997
   ```

4. Input from standard input strea
   ```bash
   foo:~$ bin/rwc
   hello world
   A sample line
   2 5 26
   ```
   
5. Input from standard input strea with option (`-w`)
   ```bash
   foo:~$ bin/rwc -w
   hello world
   A sample line
   5
   ```

## Test
Run the tests using the rake command
```bash
rake test
```

## Write your own wc tool

This challenge is to build your own version of the Unix command line tool wc!

This challenge corresponds to the "Write Your Own wc Tool" [Coding Challenges series by John Crickett](https://codingchallenges.fyi/challenges/challenge-wc/).
