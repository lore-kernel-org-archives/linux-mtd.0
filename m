Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131bsi-0008O0-00
	for mtd-list@infradead.org; Mon, 12 Jun 2000 22:36:28 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 131bsh-0008Nn-00
	for cvs-notify@infradead.org; Mon, 12 Jun 2000 22:36:27 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/include/linux/mtd cfi.h map.h'
Message-Id: <E131bsh-0008Nn-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 12 Jun 2000 22:36:27 +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/include/linux/mtd
In directory infradead.org:/tmp/cvs-serv32176/include/linux/mtd

Modified Files:
	cfi.h map.h 
Log Message:
Cleanup and document the map_info stuff a little. Add a skeleton driver
for the Intel/Sharp Extended CFI Command Set, into which I should be able
to add real read/write/erase functionality tomorrow.
Strip a few extra bytes out of the NORA driver, just because I can :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
