Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12soQY-0001zN-00
	for mtd-list@infradead.org; Fri, 19 May 2000 16:11:02 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 12soQY-0001zH-00
	for cvs-notify@infradead.org; Fri, 19 May 2000 16:11:02 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode.c'
Message-Id: <E12soQY-0001zH-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 19 May 2000 16:11:02 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv7636

Modified Files:
	inode.c 
Log Message:
Use page_readlink and page_follow_link.
Patch from al viro.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
