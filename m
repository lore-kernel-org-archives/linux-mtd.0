Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12n0ae-0006aE-00
	for mtd-list@infradead.org; Wed, 03 May 2000 15:57:28 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12n0ad-0006a8-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 15:57:27 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel mtdblock.c'
Message-Id: <E12n0ad-0006a8-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 15:57:27 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv25296

Modified Files:
	mtdblock.c 
Log Message:
OK, so I broke it. Now it sets the sizes again, and as an added bonus it
also supports ioctls - so mkfs can work on it.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
