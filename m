Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136US3-0006Wc-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 09:41:07 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136US2-0006WP-00
	for cvs-notify@infradead.org; Mon, 26 Jun 2000 09:41:06 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd doc2000.h'
Message-Id: <E136US2-0006WP-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 26 Jun 2000 09:41:06 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv25044/include/linux/mtd

Modified Files:
	doc2000.h 
Log Message:
Change the ReadDOC and WriteDOC macros to behave appropriately on ARM and
PPC architectures according to the way we expect the DiskOnChip to be
wired up. Also change the doc_locations[] array of places to probe.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
