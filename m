Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ngyE-0003wi-00
	for mtd-list@infradead.org; Fri, 05 May 2000 13:12:38 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12ngyE-0003wc-00
	for cvs-notify@infradead.org; Fri, 05 May 2000 13:12:38 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/grub doc_stage1.S'
Message-Id: <E12ngyE-0003wc-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 05 May 2000 13:12:38 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/grub
In directory infradead.org:/tmp/cvs-serv15143

Modified Files:
	doc_stage1.S 
Log Message:
Fix inthandler setup so it stores segment:offset for the _same_
software interrupt, rather than storing the segment of our new inthandler 
in the INT 19h segment location, and the offset of it in the INT 18h
segment location - a practice which tends to mean that neither INT18h or
INT19h actually do anything useful.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
