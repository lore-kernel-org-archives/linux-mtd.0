Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135TC1-0007Xw-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 14:08:21 +0100
Received: from scote1 by infradead.org with local (Exim 3.03 #1)
	id 135TC1-0007Xq-00
	for cvs-notify@infradead.org; Fri, 23 Jun 2000 14:08:21 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode-v22.c'
Message-Id: <E135TC1-0007Xq-00@infradead.org>
From: scote1@infradead.org
Date: Fri, 23 Jun 2000 14:08:21 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv28977

Modified Files:
	inode-v22.c 
Log Message:
Added invalidate_inode_pages(inode) to jffs_file_write.  This fixes the bug
found last week and should be applied to inode-v23.c.  Also removed
the French comments.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
