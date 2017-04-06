Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwAk5-0005l7-Vf
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 16:58:53 +0000
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id B1CA47A414
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 18:58:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 08/10] mtd: spi-nor: aspeed: use command mode for reads
Date: Thu,  6 Apr 2017 18:56:46 +0200
Message-Id: <1491497808-25487-9-git-send-email-clg@kaod.org>
In-Reply-To: <1491497808-25487-1-git-send-email-clg@kaod.org>
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
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
 drivers/mtd/spi-nor/aspeed-smc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 336a1ddd100b..3c004dfaf873 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -516,16 +516,8 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 	struct aspeed_smc_chip *chip = nor->priv;
 	int i;
 	u8 dummy = 0xFF;
-	int ret;
 	u32 ctl;
 
-	if (aspeed_smc_dma_check(chip, from, len)) {
-		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
-		if (!ret)
-			goto out;
-		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
-	}
-
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	for (i = 0; i < chip->nor.read_dummy / 8; i++)
@@ -540,6 +532,38 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
+	return 0;
+}
+
+static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
+			       u_char *read_buf)
+{
+	struct aspeed_smc_chip *chip = nor->priv;
+	int ret;
+
+	/* The segment window configured for the chip is too small for
+	 * the read offset. Use the "User mode" of the controller to
+	 * perform the read.
+	 */
+	if (from >= chip->ahb_window_size) {
+		aspeed_smc_read_user(nor, from, len, read_buf);
+		goto out;
+	}
+
+	/* Then, try DMA if the driver allows them. */
+	if (aspeed_smc_dma_check(chip, from, len)) {
+		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
+		if (!ret)
+			goto out;
+		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
+	}
+
+	/* Last, and this should be the default, use the "Command
+	 * mode" of the controller which does the read from the
+	 * segment window configured for the chip on the AHB bus.
+	 */
+	memcpy_fromio(read_buf, chip->ahb_base + from, len);
+
 out:
 	return len;
 }
@@ -948,7 +972,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
-		nor->read = aspeed_smc_read_user;
+		nor->read = aspeed_smc_read;
 		nor->write = aspeed_smc_write_user;
 		nor->read_reg = aspeed_smc_read_reg;
 		nor->write_reg = aspeed_smc_write_reg;
-- 
2.7.4
