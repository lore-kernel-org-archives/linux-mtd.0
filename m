Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132ytb-0004GL-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 17:23:03 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132ytb-0004GF-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 17:23:03 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode-v22.c inode-v23.c'
Message-Id: <E132ytb-0004GF-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 16 Jun 2000 17:23:03 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv16374

Modified Files:
	inode-v22.c inode-v23.c 
Log Message:
Tut tut. f_op->write is supposed to return ssize_t, which isn't
necessarily an int.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
