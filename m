Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sMmC-0007Cw-00
	for mtd-list@infradead.org; Thu, 18 May 2000 10:39:32 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12sMmC-0007Cq-00
	for cvs-notify@infradead.org; Thu, 18 May 2000 10:39:32 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel docprobe.c'
Message-Id: <E12sMmC-0007Cq-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 18 May 2000 10:39:32 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv27700

Modified Files:
	docprobe.c 
Log Message:
Only attempt request_module() if CONFIG_KMOD is defined.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
