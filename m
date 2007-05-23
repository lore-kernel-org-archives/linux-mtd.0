Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hqylh-0000Bv-QS
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 17:53:21 -0400
Message-ID: <51303.127.0.0.1.1179957194.squirrel@localhost>
Date: Thu, 24 May 2007 00:53:14 +0300 (EEST)
Subject: PATCH: at91_nand rdy_pin fix
From: "Ivan Kuten" <ivan.kuten@promwad.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The patch below fixes nand driver for AT91 boards which do not have NAND R/B signal
connected to gpio (rdy_pin is not connected).

Patch is against 2.6.22-rc1 + corresponding at91 patch from maxim.org.za

Best regards, Ivan

Signed-off-by: Ivan Kuten <ivan.kuten@promwad.com>

---

diff -urN linux.orig/drivers/mtd/nand/at91_nand.c linux/drivers/mtd/nand/at91_nand.c
--- linux.orig/drivers/mtd/nand/at91_nand.c     2007-05-24 00:19:57 +0300
+++ linux/drivers/mtd/nand/at91_nand.c  2007-05-24 00:10:01 +0300
@@ -128,7 +128,12 @@
        nand_chip->IO_ADDR_R = host->io_base;
        nand_chip->IO_ADDR_W = host->io_base;
        nand_chip->cmd_ctrl = at91_nand_cmd_ctrl;
-       nand_chip->dev_ready = at91_nand_device_ready;
+
+       if (host->board->rdy_pin)
+               nand_chip->dev_ready = at91_nand_device_ready;
+       else
+               nand_chip->dev_ready = NULL;
+
        nand_chip->ecc.mode = NAND_ECC_SOFT;    /* enable ECC */
        nand_chip->chip_delay = 20;             /* 20us command delay time */
