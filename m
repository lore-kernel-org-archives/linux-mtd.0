Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12g9YL-0007Nt-00
	for mtd-list@infradead.org; Fri, 14 Apr 2000 18:06:45 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12g9YK-0007Nn-00
	for cvs-notify@infradead.org; Fri, 14 Apr 2000 18:06:44 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode.c'
Message-Id: <E12g9YK-0007Nn-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 14 Apr 2000 18:06:44 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv28376

Modified Files:
	inode.c 
Log Message:
Some work on unlink and rmdir.
unlinks works 'live', but crashes at remount.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
