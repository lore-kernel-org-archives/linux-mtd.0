Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mwtC-0005wt-00
	for mtd-list@infradead.org; Wed, 03 May 2000 12:00:22 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12mwtB-0005wk-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 12:00:21 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtd.c mtdblock.c nftl.c'
Message-Id: <E12mwtB-0005wk-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 12:00:21 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv22848/kernel

Modified Files:
	mtd.c mtdblock.c nftl.c 
Log Message:
Replaced {get,put}_mtd_device() with the new properly(?) locked versions.
Also fix nftl.c and mtdblock.c to use them.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
