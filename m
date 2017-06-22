Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNwOA-00074l-2g
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 07:18:51 +0000
Received: from player796.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 893B59810C
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 09:18:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/2] mtd: spi-nor: aspeed: use command mode for reads
Date: Thu, 22 Jun 2017 09:18:03 +0200
Message-Id: <1498115883-31499-3-git-send-email-clg@kaod.org>
In-Reply-To: <1498115883-31499-1-git-send-email-clg@kaod.org>
References: <1498115883-31499-1-git-send-email-clg@kaod.org>
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

When reading flash contents, try to use the "command mode" if the AHB
window configured for the flash module is big enough. Else, just fall
back to the "user mode" to perform the read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since v1:
 
 - reintroduced the setting of the SPI NOR command in the control
   register, which was forgotten in the previous rebase of the patch.

 Changes since initial version :

 - rebased on current patchset which removed DMA support

 drivers/mtd/spi-nor/aspeed-smc.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 93ca2ee65f51..f504fe3de911 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -415,6 +415,31 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 	aspeed_smc_set_io_mode(chip);
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
+	return 0;
+}
+
+static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
+			       u_char *read_buf)
+{
+	struct aspeed_smc_chip *chip = nor->priv;
+
+	/*
+	 * The AHB window configured for the chip is too small for the
+	 * read offset. Use the "User mode" of the controller to
+	 * perform the read.
+	 */
+	if (from >= chip->ahb_window_size) {
+		aspeed_smc_read_user(nor, from, len, read_buf);
+		goto out;
+	}
+
+	/*
+	 * Use the "Command mode" to do a direct read from the AHB
+	 * window configured for the chip. This should be the default.
+	 */
+	memcpy_fromio(read_buf, chip->ahb_base + from, len);
+
+out:
 	return len;
 }
 
@@ -772,6 +797,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 		cmd = CONTROL_COMMAND_MODE_FREAD;
 
 	chip->ctl_val[smc_read] |= cmd | io_mode |
+		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
 	dev_dbg(controller->dev, "read control register: %08x\n",
@@ -840,7 +866,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
-		nor->read = aspeed_smc_read_user;
+		nor->read = aspeed_smc_read;
 		nor->write = aspeed_smc_write_user;
 		nor->read_reg = aspeed_smc_read_reg;
 		nor->write_reg = aspeed_smc_write_reg;
-- 
2.7.5
