Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12nNRO-0001KL-00
	for mtd-list@infradead.org; Thu, 04 May 2000 16:21:26 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12nNRN-0001K8-00
	for cvs-notify@infradead.org; Thu, 04 May 2000 16:21:25 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd doc2000.h'
Message-Id: <E12nNRN-0001K8-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 04 May 2000 16:21:25 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv5008/include/linux/mtd

Modified Files:
	doc2000.h 
Log Message:
Split the DiskOnChip probe from the DoC2000 and DoCMillennium specific
code. This involves implementing dlopen() in kernel, amusingly.

Don't get _too_ excited - this doesn't mean I'm about to actually write
the Millennium support - just that I'm making room for someone to do it.

The Millennium driver is currently a straight copy of the DoC2000 code -
which means it won't work.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
