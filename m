Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131YDq-0007lO-00
	for mtd-list@infradead.org; Mon, 12 Jun 2000 18:42:02 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 131YDp-0007lA-00
	for cvs-notify@infradead.org; Mon, 12 Jun 2000 18:42:01 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd cfi.h map.h'
Message-Id: <E131YDp-0007lA-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 12 Jun 2000 18:42:01 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv29800/include/linux/mtd

Added Files:
	cfi.h map.h 
Log Message:
Add a slightly neater, if less optimal, structure for memory-mapped
devices. Couple it with a start at detecting CFI devices and a driver
which should support CFI flash attached directly to the CPU's memory bus.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
