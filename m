Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13nlSp-0002rm-00
	for mtd-list@infradead.org; Mon, 23 Oct 2000 18:32:47 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13nlSo-0002rg-00
	for mtd@infradead.org; Mon, 23 Oct 2000 18:32:46 +0100
Message-ID: <39F478A4.FB6EE843@cotw.com>
Date: Mon, 23 Oct 2000 12:43:00 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>, JFFS List <jffs-dev@axis.com>
Subject: JFFS now working on NAND flash...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Greetings.

I though I would let everyone know that JFFS is working on NAND
flash devices in read-only mode. All changes have been checked
into the main MTD CVS repository. Use the 'nandwrite' utility
in the 'util' directory to raw write your JFFS image to the
flash and then just do a:

     mount -tjffs -oro /dev/mtdblock0 /mnt

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
