Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132WMY-0006nd-00
	for mtd-list@infradead.org; Thu, 15 Jun 2000 10:55:02 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132WMY-0006nX-00
	for cvs-notify@infradead.org; Thu, 15 Jun 2000 10:55:02 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E132WMY-0006nX-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 15 Jun 2000 10:55:02 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv26114

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
We could also try setting a more realistic timeout value in the low-level
erase routine :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
