Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LQNS-0002pe-00
	for mtd-list@infradead.org; Wed, 24 Jan 2001 13:54:22 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LQNR-0002pY-00
	for mtd@infradead.org; Wed, 24 Jan 2001 13:54:21 +0000
Message-ID: <52AF3CB987C7D41183CD0090271F67C301C825@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>, "JFFS (E-mail)"
	 <jffs-dev@axis.com>
Subject: Problem when creating file in directory being deleted
Date: Wed, 24 Jan 2001 13:34:59 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I've come across a problem when creating a file in a directory, when that
directory is being deleted by another process. The file gets created, but is
then orphaned; when remounting the filesystem later, the mount fails,
complaining that it found an inode with no parent and pino set to some
value.

Initially a directory "dir1" exists, and contains a file "file2"
The first process running does a 'rm -rf dir1'
The second process does '(echo hi; rm -f dir1/file1) >> dir1/file1'

Below are the debug messages showing the deletion of file2 and dir1 and the
creation of file1.

No other nodes are written for file1 (ino: 17), and the in memory nodes for
dir1 are not freed until the filesystem is unmounted.


Simon

jffs_readdir(): inode: 0xc0f7eca8, filp: 0xc01db380
***jffs_remove(): file = "file2", ino = 4
jffs_write_node(): filename = "", ino = 4, total_size = 60
jffs_fmalloc(): fmc = 0xc000a630, size = 60, node = 0xc0f4b060
jffs_write_node(): setting version of file2 to 4
jffs_insert_node(): ino = 4, version = 4, name = "", deleted = 1
thread_should_wake(): free=8250420, dirty=1188, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space
jffs_fmfree(): node->ino = 4, node->version = 2
jffs_fmfree(): node->ino = 4, node->version = 3
jffs_fmfree(): node->ino = 4, node->version = 4
jffs_readdir(): inode: 0xc0f7eca8, filp: 0xc01db380
***jffs_remove(): file = "dir1", ino = 3
jffs_write_node(): filename = "", ino = 3, total_size = 60
jffs_fmalloc(): fmc = 0xc000a630, size = 60, node = 0xc0f4b060
jffs_write_node(): setting version of dir1 to 3
jffs_insert_node(): ino = 3, version = 3, name = "", deleted = 1
thread_should_wake(): free=8250360, dirty=2120, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space

jffs_create(): dir: 0xc0f7eca8, name: "file1"
jffs_write_node(): filename = "file1", ino = 17, total_size = 68
jffs_fmalloc(): fmc = 0xc000a630, size = 68, node = 0xc0f4b0e0
jffs_insert_node(): ino = 17, version = 1, name = "file1", deleted = 0
thread_should_wake(): free=8250292, dirty=2120, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space
***jffs_file_write(): inode: 0xc0f7ea20 (ino: 17), filp: 0xc01db1a0, buf:
0x40124000, count: 3
jffs_write_node(): filename = "file1", ino = 17, total_size = 72
jffs_fmalloc(): fmc = 0xc000a630, size = 72, node = 0xc0f4b120
jffs_write_node(): setting version of file1 to 2
jffs_insert_node(): ino = 17, version = 2, name = "", deleted = 0
jffs_remove_redundant_nodes(): Removing node: ino: 17, version: 1, mod_type:
3
jffs_fmfree(): node->ino = 17, node->version = 1
thread_should_wake(): free=8250220, dirty=2188, blocksize=131072.
thread_should_wake(): Not waking. Insufficient dirty space



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
