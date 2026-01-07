# CRUD MONKEY (cm)

A minimalist Command Line Interface for managing list based key value commands. `cm` allows you to strictly Create, Read, Update, and Delete commands which are stored in a simple JSON format.

## Features

- **Zero Dependency**: Uses only std Ruby libraries
- **Simple Storage**: Data is stored in `~/.config/cm/commands.json`

## Usage

### Create / Set

Add a new key-value pair to a list. If the key already exists, its value is overwritten, effectively updating the value.

```bash
cm c <list> <key> <value>

# Example:
cm c wifi home "password123"
# storage : {"wifi": {"home": "password123"}}
cm c wifi work "password456"
# storage : {"wifi": {"home": "password123", "work": "password456"}}
cm c wifi home "password789"
# storage : {"wifi": {"home": "password789", "work": "password456"}}
```

### Read

View all lists, or entries within a specific list.

```bash
cm r          # Show all lists and keys
cm r <list>   # Show entries for a specific list
```

### Update (Rename Key)

Rename an existing key within a list while keeping its value logic. *Note: To update a value, simply use the `c` command again.*

```bash
cm u <list> <old_key> <new_key>
```

### Delete

Remove a specific key from a list, or delete an entire list.

```bash
cm d <list> <key>  # Delete specific key
cm d <list>        # Delete entire list
```

## Why Ruby?

Recently I have been getting into the Rails framework and so I am trying to write more Ruby, but more importantly I like dhh.

But on an actual note this tool is a successor of the **crud** project on my github. It implements the exact same CLI command CRUD usage but, `crud_monkey` was written in Ruby to test 'is writing in Ruby a true MVP?'. You can answer that for yourself by comparing the code of `cm` and `crud`.
