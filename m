Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12mxHr-00062R-00
	for mtd-list@infradead.org; Wed, 03 May 2000 12:25:51 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12mxHq-00062L-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 12:25:50 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/fs/jffs jffs_fm.c'
Message-Id: <E12mxHq-00062L-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 12:25:50 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/fs/jffs
In directory infradead.org:/tmp/cvs-serv23205

Modified Files:
	jffs_fm.c 
Log Message:
Fixed jffs to use {get,put}_mtd_device(). Who knows - I may even have got
it right!. Alex?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
