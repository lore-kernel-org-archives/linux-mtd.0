Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12wpvx-00089B-00
	for mtd-list@infradead.org; Tue, 30 May 2000 18:36:05 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12wpvv-000895-00
	for cvs-notify@infradead.org; Tue, 30 May 2000 18:36:03 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdchar.c'
Message-Id: <E12wpvv-000895-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 30 May 2000 18:36:03 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv31306

Modified Files:
	mtdchar.c 
Log Message:
Primitive fix to the copy from/to user-space problem - vmalloc a buffer
and bounce through it. Not ideal - some time later when the code has
settled down more and I'm less concerned about #ifdefs, I'll stick in the
kiovec solution which will be nicer.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
