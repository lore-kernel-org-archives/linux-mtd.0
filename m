Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Ztfq-0007xn-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 12:01:10 +0000
Received: from chello062178007137.3.11.vie.surfer.at ([62.178.7.137] helo=quake.thinstuff.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Ztfp-0007xf-00
	for mtd@infradead.org; Mon, 05 Mar 2001 12:01:09 +0000
Received: from dmz.thinstuff.com ([192.168.2.1] helo=mg)
	by quake.thinstuff.com with smtp (Exim 3.12 #1 (Debian))
	id 14ZuWA-0006DJ-00
	for <mtd@infradead.org>; Mon, 05 Mar 2001 12:55:15 +0000
Reply-To: <m.gibson@esesixtech.com>
From: "Michael Gibson" <m.gibson@esesixtech.com>
To: <mtd@infradead.org>
Subject: Kernel panic DiskOnChip /Newbie question
Date: Mon, 5 Mar 2001 13:03:59 +0100
Message-ID: <002101c0a56c$5caf3090$3201a8c0@thinstuff.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Is there somebody who could help me with following jffs problem?

kernel 2.4.2, mtd cvs snapshot of 02nd March 2001(same problem with original
mtd modules from kernel 2.4.2), DOC2000 8MB with firmware 1.21

DOC2000 is detected OK
when I try to do "mount -t jffs /dev/mtdblock0 /test" after "erase
/dev/mtd0" (as described in the mtd/jffs HOWTO from the CVS snapshot)
I get a Kernel panic:
" Didn´t read all bytes in flash_safe_read(). Returned 0 "

but NFTL workes fine, I can do nftl_format - create a partition - put a
minix fs on it and mount it.
Also writing to the nftl partition works fine.

What am I doing wrong?

Best regards
Michael Gibson






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
