Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mwtC-0005wr-00
	for mtd-list@infradead.org; Wed, 03 May 2000 12:00:22 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12mwtB-0005we-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 12:00:21 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd mtd.h'
Message-Id: <E12mwtB-0005we-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 12:00:21 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv22848/include/linux/mtd

Modified Files:
	mtd.h 
Log Message:
Replaced {get,put}_mtd_device() with the new properly(?) locked versions.
Also fix nftl.c and mtdblock.c to use them.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
