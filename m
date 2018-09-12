Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g02rp-0004dI-2D
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2018 10:59:30 +0000
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: [BUG/RFC] denali NAND probe issues on SoCFPGA
Date: Wed, 12 Sep 2018 12:59:05 +0200
Message-ID: <737ejrj81y.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

I just found an issue with

    commit 586a2c52909df453ed1b6239283744b0851ccf81
    Author: Masahiro Yamada <yamada.masahiro@socionext.com>
    Date:   Fri Sep 22 12:46:41 2017 +0900

    mtd: nand: denali: squash denali_enable_dma() helper into 
    caller

on (atleast) Cyclone5 SoCFPGAs.

With this patch I get

    [    0.543088] denali-nand-dt ff900000.nand: necessary clock 
    is missing. default clock rates are used.
    [    0.554325] nand: device found, Manufacturer ID: 0x2c, Chip 
    ID: 0xda
    [    0.560654] nand: Micron MT29F2G08ABAEAWP
    [    0.564680] nand: 256 MiB, SLC, erase size: 128 KiB, page 
    size: 2048, OOB size: 64
    [    0.971317] nand: timeout while waiting for chip to become 
    ready
    [    1.991336] denali-nand-dt ff900000.nand: timeout while 
    waiting for irq 0x4

and then the system just reboots. Adding the ioread32 back or just 
some printks fixes this. So there seems to be a timing issue.
What would be the preferred solution? Add a 
msleep($IDONTKNOWWHATISAGOODVALUE) although it is unnecessary for 
the other SoCs?
Bringing the ioread32 back seems like obfuscating the problem.


Best regards,
Steffen

-- 
Pengutronix e.K.                          | Steffen Trumtrar 
|
Industrial Linux Solutions                | 
http://www.pengutronix.de/ |
Peiner Str. 6-8, 31137 Hildesheim, Germany| Phone: 
+49-5121-206917-0   |
Amtsgericht Hildesheim, HRA 2686          | Fax: 
+49-5121-206917-5555|
