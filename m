Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 14811I-0004C3-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 14:12:04 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 14811G-0004Bx-00
	for mtd@infradead.org; Mon, 18 Dec 2000 14:12:02 +0000
Message-ID: <3A3E1CB4.F4BF34DB@arcom.co.uk>
Date: Mon, 18 Dec 2000 14:18:28 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: JFFS: rmdir wierdness
References: <3A3E07C4.22A3F127@arcom.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> # mkdir a
> # ls
> a
> # rmdir a
> # ls
> # mkdir a
> mkdir: a: File exists

This one has been fixed.

> # mkdir b
> # touch b/a
> # rm b/a
> # rmdir b
> rmdir: b: Directory not empty

This one is still broken.

In jffs_remove():
	if (S_ISDIR(type)) {
		/* ... */
		if (del_f->children) {
			result = -ENOTEMPTY;
			goto jffs_remove_end;
		}
	}

As I understand it del_f->children is the head of a list of the
directory's children.  If this is the case then won't you have to go
through the list checking that all the children have been deleted?  Find
a patch that does just this (it works too).

David Vrabel.

Index: inode-v22.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/inode-v22.c,v
retrieving revision 1.55
diff -u -r1.55 inode-v22.c
--- inode-v22.c 2000/12/18 12:11:08     1.55
+++ inode-v22.c 2000/12/18 14:05:50
@@ -960,14 +960,20 @@
        }
 
        if (S_ISDIR(type)) {
+               struct jffs_file *child=del_f->children;
+
                result = -ENOTDIR;
                if (!S_ISDIR(del_f->mode)) { /* Is this really needed
for 2.2? */
                        D(printk("jffs_remove(): S_ISDIR but isn't\n"));
                        goto jffs_remove_end;
                }
-               if (del_f->children) {
-                       result = -ENOTEMPTY;
-                       goto jffs_remove_end;
+
+               while(child) {
+                       if( !child->deleted ) {
+                               result = -ENOTEMPTY;
+                               goto jffs_remove_end;
+                       }
+                       child = child->sibling_next;
                }
        }
        else if (S_ISDIR(del_f->mode)) {
Index: inode-v23.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/inode-v23.c,v
retrieving revision 1.52
diff -u -r1.52 inode-v23.c
--- inode-v23.c 2000/12/18 12:11:08     1.52
+++ inode-v23.c 2000/12/18 14:05:56
@@ -956,11 +956,15 @@
        }
 
        if (S_ISDIR(type)) {
-               if (del_f->children) {
-                       result = -ENOTEMPTY;
-                       goto jffs_remove_end;
+               struct jffs_file *child=del_f->children;
+               while(child) {
+                       if( !child->deleted ) {
+                               result = -ENOTEMPTY;
+                               goto jffs_remove_end;
+                       }
+                       child = child->sibling_next;
                }
-       }
+       }
        else if (S_ISDIR(del_f->mode)) {
                D(printk("jffs_remove(): node is a directory "
                         "but it shouldn't be.\n"));



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
