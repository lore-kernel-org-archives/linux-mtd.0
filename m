Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132v6F-000393-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 13:19:51 +0100
Received: from alex by infradead.org with local (Exim 3.03 #1)
	id 132v6F-00038x-00
	for cvs-notify@infradead.org; Fri, 16 Jun 2000 13:19:51 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs inode-v23.c'
Message-Id: <E132v6F-00038x-00@infradead.org>
From: Alexander Larsson <alex@infradead.org>
Date: Fri, 16 Jun 2000 13:19:51 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv12081

Modified Files:
	inode-v23.c 
Log Message:
Update buf->f_bavail in statfs so df doesn't say 0 bytes availible.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
