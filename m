Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14J0Vv-0002hT-00
	for mtd-list@infradead.org; Wed, 17 Jan 2001 21:53:07 +0000
Received: from reprofw.itrepro.com ([216.89.237.2] helo=itrepro.atlanta.itserve.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14J0Vu-0002hN-00
	for mtd@infradead.org; Wed, 17 Jan 2001 21:53:06 +0000
Received: from workbox.atlanta.itserve.com (IDENT:dhamm@workbox.atlanta.itserve.com [10.100.3.219])
	by itrepro.atlanta.itserve.com (8.9.3/8.9.3) with SMTP id QAA01340
	for <mtd@infradead.org>; Wed, 17 Jan 2001 16:53:25 -0500
From: David Hamm <dhamm@itrepro.com>
Reply-To: dhamm@itrepro.com
To: mtd@infradead.org
Subject: DiskOnChip 2000 again
Date: Wed, 17 Jan 2001 16:48:53 -0500
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01011716530001.08043@workbox.atlanta.itserve.com>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've tried a number of things.  When I patch the 2.4.0 kernel with the M-Sys
patches in won't compile.  So I've compiled using the MTD stuff and plundered
through making the entrys in the /dev directory.  Below is my /dev/nftl entry.

brw-rw----    1 root     root      93,   0 Jan 12 22:39 /dev/nftl

But when I try to fdisk /dev/nftl the modules load and print the following on
the console.  

M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xd000
Possible DiskOnChip with unknown ChipID 63 found at 0xd000    


Any suggestions?

 -- ---------------------------------
David Hamm
Systems Analyst
Imaging Technologies Services Inc.
email: dhamm@itrepro.com
voice: 404-870-6663
---------------------------------


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
