Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135PrX-0007AU-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 10:34:59 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 135PrW-0007AO-00
	for cvs-notify@infradead.org; Fri, 23 Jun 2000 10:34:58 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdblock.c'
Message-Id: <E135PrW-0007AO-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 23 Jun 2000 10:34:58 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv27548

Modified Files:
	mtdblock.c 
Log Message:
Oops (literally). We don't want to do mtdblock_end_request() immediately
followed by end_request(). Thought I'd fixed that already.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
