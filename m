Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1380hM-0004Iv-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 14:19:12 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 1380hM-0004Ip-00
	for cvs-notify@infradead.org; Fri, 30 Jun 2000 14:19:12 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel doc1000.c'
Message-Id: <E1380hM-0004Ip-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 30 Jun 2000 14:19:12 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv16502/kernel

Modified Files:
	doc1000.c 
Log Message:
Some changes to make it talk to the ISA board I have here. My board is
8-bit, though, and the one I had when I wrote this was 16-bit, so it'd 
need far more hacking than this. I'll just make it a map driver, and wait
for jgg's jedec stuff. 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
