Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132u3o-0002oJ-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 12:13:16 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132u3n-0002oD-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 12:13:15 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c'
Message-Id: <E132u3n-0002oD-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 16 Jun 2000 12:13:15 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv10791

Modified Files:
	Makefile 
Added Files:
	inode-v22.c 
Removed Files:
	inode.c 
Log Message:
Add inode-v22.c and fix Makefile to compile the appropriate one according
to which kernel we're part of.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
