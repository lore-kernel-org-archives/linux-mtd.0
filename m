Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12dbEV-0001m2-00
	for mtd-list@infradead.org; Fri, 07 Apr 2000 17:03:43 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12dbEV-0001lw-00
	for cvs-notify@infradead.org; Fri, 07 Apr 2000 17:03:43 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode.c'
Message-Id: <E12dbEV-0001lw-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 07 Apr 2000 17:03:43 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv6788

Modified Files:
	inode.c 
Log Message:
Most basic fs write stuff works.
create, mknod, file_write, ioctl, mkdir.
I dunno if mmap:ed writing works.

Still commented out: rename, rmdir, unlink



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
