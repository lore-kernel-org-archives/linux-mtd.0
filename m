Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14M95r-0000r5-00
	for mtd-list@infradead.org; Fri, 26 Jan 2001 13:39:11 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14M95q-0000qz-00
	for mtd@infradead.org; Fri, 26 Jan 2001 13:39:10 +0000
Message-ID: <52AF3CB987C7D41183CD0090271F67C301C929@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>, "JFFS (E-mail)"
	 <jffs-dev@axis.com>
Subject: Problem with deleted files
Date: Fri, 26 Jan 2001 13:38:53 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Consider the following:

Create a file for writing
Unlink it, but don't close it
Write lots of data to the file, so that some nodes get written to the next
flash erase sector
Close it
Use the filesystem enough until the flash sector containing the delete node
is erased.
Unmount the filesystem.

The flash now contains nodes for the file that was deleted, but the node
that says the file was deleted has gone. when remounting the file system,
the file will reappear. (If the file was in a directory that was also
deleted, the mount will fail:'Found inode with no parent and pino'.)

This could be fixed by always setting a node's deleted flag if the
corresponding file's deleted flag is set, when it is written in
jffs_write_node() and jffs_rewrite_data(). Can anyone see any problems with
this?

Should the filesystem fail to mount if it finds a node with no parent? Would
it be better to just throw away such nodes, or perhaps create a virtual
lost+found directory and put them there?

Simon


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
