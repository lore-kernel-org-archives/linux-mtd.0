Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132WLh-0006my-00
	for mtd-list@infradead.org; Thu, 15 Jun 2000 10:54:09 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132WLh-0006ms-00
	for cvs-notify@infradead.org; Thu, 15 Jun 2000 10:54:09 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdchar.c'
Message-Id: <E132WLh-0006ms-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 15 Jun 2000 10:54:09 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv26090

Modified Files:
	mtdchar.c 
Log Message:
Handle erase timeout correctly - we were missing a
	current->state = TASK_RUNNING;
... which had 'interesting' effects on the subsequent behaviour of the
task which called the ioctl :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
