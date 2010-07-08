Received: from mail.dbn.pfk.co.za ([196.212.6.202])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWqVO-0001Vy-G1
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 12:47:08 +0000
Received: from pfkdbn-ltp003.pfksa.co.za ([10.3.0.110] helo=PFKDBNLTP003)
	by mail.dbn.pfk.co.za with esmtp (Exim 4.62)
	(envelope-from <seanp@pfk.co.za>) id 1OWqZg-0007IY-3P
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 14:51:32 +0200
From: "Sean Preston" <seanp@pfk.co.za>
To: "Linux-MTD List" <linux-mtd@lists.infradead.org>
Subject: New NAND Help
Date: Thu, 8 Jul 2010 14:46:40 +0200
Message-ID: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I have a TI DM365 EVM board that currently uses the Micron MT29F16G08FAA 2GB
NAND chip and I would like to test the Micron MT29F8G08ABABA 1GB NAND chip.


Quick summary of the chips specs:
Page size: 2112 bytes (2048 + 64 bytes)
Block size: 64 pages (128K +4K bytes)
Plane size: 2048 blocks
Dies: 4
Chip Enables: 2
ECC: HW 4bit

New chips specs:
Page size: 4320 bytes (4096 + 224 bytes)
Block size: 128 pages (512K +28K bytes)
Plane size: 2 planes x 1024 blocks per plane
Dies: 1
Chip Enables: 1
ECC: HW 4bit 

Looking at the drivers/mtd/nand section of the tree I have added the new
chip ID to nand_ids.c  There already appears to be support for 4096 page
sizes and 512K block sizes.  What else would I need to check to ensure that
the kernel is able to probe this chip and load the driver needed for it.
The driver currently being loaded is the davinci_nand driver.  I have
managed to get this chip working with uBoot which uses a modified version of
the MTD driver.

Regards
Sean

--
Sean Preston
Email: seanp@pfk.co.za
