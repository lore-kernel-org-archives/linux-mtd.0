Received: from mgw-x4.nokia.com ([131.228.20.27])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Caa7O-0007N0-2d
	for linux-mtd@lists.infradead.org; Sat, 04 Dec 2004 08:38:37 -0500
Received: from esdks004.ntc.nokia.com (esdks004.ntc.nokia.com [172.21.138.159])
	by mgw-x4.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	iB4DcQS01790 for <linux-mtd@lists.infradead.org>;
	Sat, 4 Dec 2004 15:38:26 +0200 (EET)
Received: (from root@localhost)
	by esdks004.ntc.nokia.com (8.12.9/8.12.9) id iB4Dc0gp016558
	for <linux-mtd@lists.infradead.org>; Sat, 4 Dec 2004 15:38:00 +0200
Received: from esebh001.NOE.Nokia.com (esebh001.ntc.nokia.com [172.21.138.28])
	by mgw-int1.ntc.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	iB4Dbba14501 for <linux-mtd@lists.infradead.org>;
	Sat, 4 Dec 2004 15:37:37 +0200 (EET)
Received: from jlavi by angel.research.nokia.com with local (Exim 4.34)
	id 1Caa2a-0003g4-7i
	for linux-mtd@lists.infradead.org; Sat, 04 Dec 2004 15:33:36 +0200
Date: Sat, 4 Dec 2004 15:33:36 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041204133336.GA11070@angel.research.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: <jlavi@angel.research.nokia.com>
Subject: ECC errors on padded images
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I recently encountered ECC errors with padded JFFS2 images (mkfs.jffs2
-p) on Nand flash.

The padded pages were written into flash with a driver which uses
noninverted ECC code. Pages with all bytes either 00 or FF will
produce 00s as ECC bytes.

When JFFS2 scans such padded image, it fails to check the zero ECC
bytes of seemingly unused pages and will use them. Then the already
once written page is written again and later an ECC error is produced
upon read -- because ECC bytes remain zero.

We have now three options:

1. We couuld blame JFFS2, because it fails to check ECC bytes of
   seemingly unused pages.

   But should JFFS2 care if somebody produces an image that JFFS2
   would never produce by itself?

   JFFS2 itself won't pad erase blocks and won't write unused blank
   pages.  Even if writing a long node would result writing an all FF
   page, JFFS2 would know in next mount from node header the page is
   being used and not available for writing.


2. We could blame Mkfs.jffs2, because it is the one who produced
   padded erase block. Without padding there would be no error.


3. We could blame the Ecc logic and insist that writing a blank, all
   FF page will result ECC code of FFs and it would allow writing
   first a blank page and then real data page.

   Conceptually an unused, erased page is not the same as used,
   written blank page.


Jarkko Lavinen
