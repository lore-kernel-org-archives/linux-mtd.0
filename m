Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xWk9-0006YB-00
	for mtd-list@infradead.org; Thu, 01 Jun 2000 16:18:45 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12xWk8-0006Y5-00
	for cvs-notify@infradead.org; Thu, 01 Jun 2000 16:18:44 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel Makefile'
Message-Id: <E12xWk8-0006Y5-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 01 Jun 2000 16:18:44 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv25173

Modified Files:
	Makefile 
Log Message:
PMC551_DRAM_BUG only needs to be defined for pmc551.o, not for the whole
directory.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
