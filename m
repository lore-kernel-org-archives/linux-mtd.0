Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mwxx-0005ye-00
	for mtd-list@infradead.org; Wed, 03 May 2000 12:05:17 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12mwxw-0005yY-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 12:05:16 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd mtd.h'
Message-Id: <E12mwxw-0005yY-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 12:05:16 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv22950

Modified Files:
	mtd.h 
Log Message:
Add missing #include <linux/module.h> to mtd.h for {get,put}_mtd_device()
 - which use __MOD_{INC,DEC}_USE_COUNT and are inline.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
