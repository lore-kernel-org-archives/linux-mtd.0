Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SRCn-0000Ze-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 22:12:21 +0000
Received: from reprofw.itrepro.com ([216.89.237.2] helo=itrepro.atlanta.itserve.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SRCk-0000ZI-00
	for mtd@infradead.org; Mon, 12 Feb 2001 22:12:19 +0000
Received: from workbox.atlanta.itserve.com (IDENT:dhamm@workbox.atlanta.itserve.com [10.100.3.219])
	by itrepro.atlanta.itserve.com (8.9.3/8.9.3) with SMTP id RAA05413
	for <mtd@infradead.org>; Mon, 12 Feb 2001 17:13:56 -0500
From: David Hamm <dhamm@itrepro.com>
Reply-To: dhamm@itrepro.com
To: mtd@infradead.org
Subject: booting from doc
Date: Mon, 12 Feb 2001 10:51:52 -0500
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <0102121712140C.26666@workbox.atlanta.itserve.com>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Is anyone booting from disk on chip with LILO.  I've tried several different
methods but still can't do it.  I'm using lilo 21.6, kernel 2.4.0 with mtd
modules.  I get the following info when I "fdisk /dev/nftla"
	DiskOnChip Millennium found at address 0xD0000
	Cannot calculate an NFTL geometry to match size of 0x7cf0.
	Using C:999 H:16 S:2 (== 0x7ce0 sects) 

DINFO yields 
DiskOnChip 2000(R) found at D000:0000
 	Drive letter          : D
  	Disk size             : 15,992 Kbytes
  	SoftWare version      : 4.2
  	TrueFFS Compatibility : 3.3.2
  	FirmWare size         : 48 Kbytes 
Also Lilo won't install because it doesn't know how to handle device 5d01.

If you see anyting that might cause a problem or be different than what you are
doing please let me know.  Thanks


 ---------------------------------
David Hamm
Systems Analyst
Imaging Technologies Services Inc.
email: dhamm@itrepro.com
voice: 404-870-6663
---------------------------------


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
