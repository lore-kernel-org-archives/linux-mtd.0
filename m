Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132tKt-0002e7-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 11:26:51 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 132tKs-0002e1-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 11:26:50 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs intrep.c'
Message-Id: <E132tKs-0002e1-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 16 Jun 2000 11:26:50 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv10143

Modified Files:
	intrep.c 
Log Message:
Fixed bug in jffs_insert_node(). jffs_rewrite_data() called it with name ==
f->name which meant name was kfree'ed before being copied.  



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
