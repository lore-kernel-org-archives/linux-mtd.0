Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1381XU-0004Tn-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 15:13:04 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1381XT-0004Th-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 15:13:03 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs jffs_fm.c'
Message-Id: <E1381XT-0004Th-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 15:13:03 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv17212

Modified Files:
	jffs_fm.c 
Log Message:
Fix from simonk@axis.com:

Bug that caused infinite garbage collection fixed (fmc->dirty_size was
incorrect) 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
