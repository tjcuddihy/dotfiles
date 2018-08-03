#!/usr/bin/env python

import glob
import os
import shutil

def backup_and_remove(full_path):
    """ Copy a backup and remove original. """
    dir_name, file_name = os.path.split(full_path)
    backup_dir = os.path.join(dir_name, 'dotfiles_backup')
    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)
    backup_path = os.path.join(backup_dir, file_name)
    shutil.copy(full_path, backup_path)  # Copy orig to backup dir
    print('\tBacked up to {}'.format(backup_path))
    os.remove(full_path)  # Remove orig

def create_symlink(source, home):
    """ From a source path, create a symlink in home folder.  """
    file_name = os.path.split(source)[1]  # Filename only
    link_name = os.path.join(home, file_name)  # New symlink
    print(link_name)
    if os.path.exists(link_name):
        if os.path.islink(link_name):
            print('\tLink exists - skipped')
            return None
        elif os.path.isfile(link_name):
            print('\tFile exists - backed up and removed')
            backup_and_remove(link_name)  # Backup & remove file
        else:  # A folder? Do nothing.
            print('\tPath exists - skipped')
            return None

    os.symlink(source, link_name)
    print('\tLink added')
    return link_name

def main():
    """ Fire ze missiles. """

    home = os.path.expanduser("~")
    dotfiles_folder = os.path.dirname(os.path.realpath(__file__))

    ignore_list = ['git', 'gitignore', 'swp', 'DS_Store']

    # Files starting with . and not in ignore list
    rc_files = [f for f in glob.glob(dotfiles_folder + '/.*') \
                if not any(f.endswith(x) for x in ignore_list)]

    print('Creating dotfile symlinks')
    symlinks = [create_symlink(x, home) for x in rc_files]

if __name__ == '__main__':
    main()

