Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Jbe1-0006KT-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 13:59:41 +0100
Received: from [211.116.76.10] (helo=tinuviel.mizi.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Jbdz-0006KM-00
	for mtd@infradead.org; Tue, 01 Aug 2000 13:59:39 +0100
Received: (from tolkien@localhost)
	by tinuviel.mizi.com (8.9.3/8.9.3) id WAA01067
	for mtd@infradead.org; Tue, 1 Aug 2000 22:00:30 +0900
Date: Tue, 1 Aug 2000 22:00:30 +0900
From: Yong-iL Joh <tolkien@mizi.com>
To: mtd@infradead.org
Subject: if flash_size is less than megabyte
Message-ID: <20000801220030.A1053@tinuviel.mizi.com>
Reply-To: tolkien@mizi.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm working on Intel BootBlock Flash.
if mtd->size is less than a megabyte, kernel panic. :(

in ftl.c, here is a tiny patch.

===================================================================
RCS file: /exports/misc/embedded/cvs/linux/drivers/mtd/ftl.c,v
retrieving revision 1.3
diff -r1.3 ftl.c
266c266
<     loff_t offset;
---
>     loff_t offset, max_offset;
268a269
>     max_offset = (0x100000<part->mtd->size)?0x100000:part->mtd->size;
271c272
<        offset < 0x100000;
---
>        offset < max_offset;
283c284
<     if (offset == 0x100000) {
---
>     if (offset == max_offset) {

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
