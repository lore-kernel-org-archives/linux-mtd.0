Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136fgc-0000Pw-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 21:40:54 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136fgb-0000Pj-00
	for cvs-notify@infradead.org; Mon, 26 Jun 2000 21:40:53 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd doc2000.h'
Message-Id: <E136fgb-0000Pj-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 26 Jun 2000 21:40:53 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv1591/include/linux/mtd

Modified Files:
	doc2000.h 
Log Message:
Eliminate the readb() for checking the signature bytes at the beginning of
the DiskOnChip. Use the arch-specific ReadDOC() macro instead.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
