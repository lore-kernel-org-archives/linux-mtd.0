Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12n4Dk-0007AE-00
	for mtd-list@infradead.org; Wed, 03 May 2000 19:50:04 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12n4Dh-00079u-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 19:50:01 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/util ftl_check.c ftl_format.c'
Message-Id: <E12n4Dh-00079u-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 19:50:01 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/util
In directory infradead.org:/tmp/cvs-serv27487/util

Modified Files:
	ftl_check.c ftl_format.c 
Log Message:
End-of-day cleanup of the files I've forgotten to commit earlier.
- endianness/wordsize fixes in ftl.h
- userspace compilation issues in mtd.h
- added sync in nftl.c
- porting comment in util/ftl_*.c



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
