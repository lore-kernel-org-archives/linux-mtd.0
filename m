Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tqah-0001H5-00
	for mtd-list@infradead.org; Mon, 22 May 2000 12:41:47 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12tqag-0001Gz-00
	for cvs-notify@infradead.org; Mon, 22 May 2000 12:41:46 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel nftl.c'
Message-Id: <E12tqag-0001Gz-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 22 May 2000 12:41:46 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv4891

Modified Files:
	nftl.c 
Log Message:
When we can't calculate a geometry to match the NFTL size, don't change
the reported size to match the geometry that we _do_ create. This matches
the behaviour of the M-Systems drivers, be it correct or not.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
