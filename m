Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136US4-0006We-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 09:41:08 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136US2-0006WV-00
	for cvs-notify@infradead.org; Mon, 26 Jun 2000 09:41:06 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel docprobe.c'
Message-Id: <E136US2-0006WV-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 26 Jun 2000 09:41:06 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv25044/kernel

Modified Files:
	docprobe.c 
Log Message:
Change the ReadDOC and WriteDOC macros to behave appropriately on ARM and
PPC architectures according to the way we expect the DiskOnChip to be
wired up. Also change the doc_locations[] array of places to probe.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
