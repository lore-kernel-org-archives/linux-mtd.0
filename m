Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136yJa-0003Ew-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 17:34:22 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136yJZ-0003Eq-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 17:34:21 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd cfi.h'
Message-Id: <E136yJZ-0003Eq-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 17:34:21 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv12441/include/linux/mtd

Modified Files:
	cfi.h 
Log Message:
Add a chipsize field to the CFI area definition - it's not per-chip
because we only handle multiple chips if they're identical (for now).



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
