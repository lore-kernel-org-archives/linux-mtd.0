Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1AiN-0003lP-OC
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 11:57:38 +0000
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 867D15F738
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 13:57:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Robert Lippert <roblip@gmail.com>,
 Robert Lippert <rlippert@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/4] mtd: spi-nor: aspeed: add support for SPI dual IO read
 mode
Date: Thu, 20 Apr 2017 13:56:35 +0200
Message-Id: <1492689397-4704-3-git-send-email-clg@kaod.org>
In-Reply-To: <1492689397-4704-1-git-send-email-clg@kaod.org>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Robert Lippert <roblip@gmail.com>

Implements support for the dual IO read mode on aspeed SMC/FMC
controllers which uses both MISO and MOSI lines for data during a read
to double the read bandwidth.

Signed-off-by: Robert Lippert <rlippert@google.com>
[clg: adapted to mainline driver ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 2940f2098420..183d950e621b 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -372,12 +372,20 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 	struct aspeed_smc_chip *chip = nor->priv;
 	int i;
 	u8 dummy = 0xFF;
+	u32 ctl;
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	for (i = 0; i < chip->nor.read_dummy / 8; i++)
 		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
 
+	if (chip->nor.flash_read == SPI_NOR_DUAL) {
+		/* Switch to dual I/O mode for data cycle */
+		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
+		ctl |= CONTROL_IO_DUAL_DATA;
+		writel(ctl, chip->ctl);
+	}
+
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
 	return len;
@@ -591,6 +599,9 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	case SPI_NOR_FAST:
 		cmd = CONTROL_COMMAND_MODE_FREAD;
 		break;
+	case SPI_NOR_DUAL:
+		cmd = CONTROL_COMMAND_MODE_FREAD | CONTROL_IO_DUAL_DATA;
+		break;
 	default:
 		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
 		return -EINVAL;
@@ -599,7 +610,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	chip->ctl_val[smc_read] |= cmd |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
-	dev_dbg(controller->dev, "base control register: %08x\n",
+	dev_dbg(controller->dev, "read control register: %08x\n",
 		chip->ctl_val[smc_read]);
 	return 0;
 }
@@ -670,11 +681,9 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 			break;
 
 		/*
-		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
-		 * attach when board support is present as determined
-		 * by of property.
+		 * Aspeed SoCs only support Dual mode
 		 */
-		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
+		ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
 		if (ret)
 			break;
 
-- 
2.7.4
