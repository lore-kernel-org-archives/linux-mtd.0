Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12c1io-0008NM-00
	for mtd-list@infradead.org; Mon, 03 Apr 2000 08:56:30 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12c1in-0008NG-00
	for cvs-notify@infradead.org; Mon, 03 Apr 2000 08:56:29 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel doc2000.c'
Message-Id: <E12c1in-0008NG-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 03 Apr 2000 08:56:29 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv32190

Modified Files:
	doc2000.c 
Log Message:
Fix doc_erase to use the erase callback function. NFTL still relies on the
fact that doc_erase is currently synchronous, though. 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
