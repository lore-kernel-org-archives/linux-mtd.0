Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136yKa-0003Fc-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 17:35:24 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 136yKZ-0003FW-00
	for cvs-notify@infradead.org; Tue, 27 Jun 2000 17:35:23 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_probe.c'
Message-Id: <E136yKZ-0003FW-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 27 Jun 2000 17:35:23 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv12470/kernel

Modified Files:
	cfi_probe.c 
Log Message:
Fix probe code to eliminate aliases, at least for 16x1 mappings. Someone
with a high boredom threshold, or with some hardware which actually
requires it, can do the rest - it's quite simple.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
