Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12wqDI-0008EM-00
	for mtd-list@infradead.org; Tue, 30 May 2000 18:54:00 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12wqDH-0008EG-00
	for cvs-notify@infradead.org; Tue, 30 May 2000 18:53:59 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel nftl.c'
Message-Id: <E12wqDH-0008EG-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 30 May 2000 18:53:59 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv31632

Modified Files:
	nftl.c 
Log Message:
Trying to debug the #define WE_KNOW_WTF_THIS_DOES_NOT_WORK case. To start
with, stop it from using both end_request and nftl_end_request when that's
defined.
Now to find someone clever to look at it and tell me what I'm doing wrong.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
