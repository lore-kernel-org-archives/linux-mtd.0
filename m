Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWKxy-0004Qi-Cu
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 12:15:07 +0000
Received: from player792.ha.ovh.net (unknown [10.109.105.78])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id E1271B4BC4
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2018 14:14:48 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/4] mtd: spi-nor: aspeed: use command mode for reads
Date: Fri, 22 Jun 2018 14:14:14 +0200
Message-Id: <20180622121417.6762-2-clg@kaod.org>
In-Reply-To: <20180622121417.6762-1-clg@kaod.org>
References: <20180622121417.6762-1-clg@kaod.org>
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
 drivers/mtd/spi-nor/aspeed-smc.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 95e54468cf7d..af84a6fa2360 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -402,6 +402,31 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 	return len;
 }
 
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
+	return len;
+}
+
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
@@ -743,6 +768,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	}
 
 	chip->ctl_val[smc_read] |= cmd |
+		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
 	dev_dbg(controller->dev, "base control register: %08x\n",
@@ -809,7 +835,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
-		nor->read = aspeed_smc_read_user;
+		nor->read = aspeed_smc_read;
 		nor->write = aspeed_smc_write_user;
 		nor->read_reg = aspeed_smc_read_reg;
 		nor->write_reg = aspeed_smc_write_reg;
-- 
2.13.6
