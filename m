Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132X0j-0006vE-00
	for mtd-list@infradead.org; Thu, 15 Jun 2000 11:36:33 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 132X0i-0006v8-00
	for cvs-notify@infradead.org; Thu, 15 Jun 2000 11:36:32 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c'
Message-Id: <E132X0i-0006v8-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 15 Jun 2000 11:36:32 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv26602

Modified Files:
	cfi_cmdset_0001.c 
Log Message:
er... even longer timeout and make it return zero on success rather than
-EIO which is quite silly really



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
