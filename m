Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12QFbw-0003i1-00
	for mtd-list@infradead.org; Wed, 01 Mar 2000 20:20:44 +0000
Received: from out2.prserv.net ([32.97.166.32] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12QFbt-0003hv-00
	for mtd@infradead.org; Wed, 01 Mar 2000 20:20:42 +0000
From: "Dvir Oren" <dvir@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Wed, 1 Mar 2000 22:22:43 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Booting from the flash
Message-Id: <E12QFbt-0003hv-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

It appears that nftl_format deletes M-Systems' firmware.  I 
remember that David wrote something about fixing that.  
doc_loadbios seems to destroy the partition entirely.  Neither M-
Systems' drivers nor MTD drivers can recognize anything on the 
flash after doc_loadbios.

Is there a way to boot from a DOC2000 flash using MTD drivers?

[BTW:  I was only successful at creating a 2.3 kernel with MTD 
drivers.  2.2 kernels don't seem to work.  I think I have an idea what 
could be wrong, and I'll try to test it soon]

---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
