Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12b3sw-0003bj-00
	for mtd-list@infradead.org; Fri, 31 Mar 2000 17:02:58 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12b3sv-0003bd-00
	for cvs-notify@infradead.org; Fri, 31 Mar 2000 17:02:57 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel nftl.c'
Message-Id: <E12b3sv-0003bd-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 31 Mar 2000 17:02:57 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv13860

Modified Files:
	nftl.c 
Log Message:
Attempt at handling the queuing correctly in nftl.c - we shouldn't
schedule while holding the io_request_lock.
Doesn't work though :( I _HATE_ the Linux block device setup with a
vengeance. I'm off home to sulk for the weekend. If I'm _really_ lucky
someone cleverer than me will have fixed it my Monday.
Well, I can dream :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
