Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12aymD-0002sG-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 11:35:41 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12aymD-0002sA-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 11:35:41 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel ftl.c'
Message-Id: <E12aymD-0002sA-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 11:35:41 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv11042

Modified Files:
	ftl.c 
Log Message:
Sanity check - does mtd->erasesize match header.EraseUnitSize?
Add invalidate_inodes() to the close routine.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
