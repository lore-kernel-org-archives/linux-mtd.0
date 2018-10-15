Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC8iv-0004Aw-8r
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 19:40:18 +0000
Received: by mail-lf1-x144.google.com with SMTP id s10-v6so14981786lfc.9
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2018 12:40:06 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 2/3] mtd: rawnand: ams-delta: Stop using legacy .IOADDR_R/W
Date: Mon, 15 Oct 2018 21:41:29 +0200
Message-Id: <20181015194130.21764-2-jmkrzyszt@gmail.com>
In-Reply-To: <20181015194130.21764-1-jmkrzyszt@gmail.com>
References: <20181012204101.26274-1-jmkrzyszt@gmail.com>
 <20181015194130.21764-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace use of legacy .IOADDR_R/W with runtime calculations based on
priv->io_base.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changelog:
v3:
New patch, split out from former PATCH 2/2 on Boris request - thanks

 drivers/mtd/nand/raw/ams-delta.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 5ba180a291eb..46193db6d368 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -75,7 +75,7 @@ static const struct mtd_partition partition_info[] = {
 
 static void ams_delta_io_write(struct ams_delta_nand *priv, u_char byte)
 {
-	writew(byte, priv->nand_chip.legacy.IO_ADDR_W);
+	writew(byte, priv->io_base + OMAP_MPUIO_OUTPUT);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 	ndelay(40);
 	gpiod_set_value(priv->gpiod_nwe, 1);
@@ -87,7 +87,7 @@ static u_char ams_delta_io_read(struct ams_delta_nand *priv)
 
 	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
-	res = readw(priv->nand_chip.legacy.IO_ADDR_R);
+	res = readw(priv->io_base + OMAP_MPUIO_INPUT_LATCH);
 	gpiod_set_value(priv->gpiod_nre, 1);
 
 	return res;
@@ -211,8 +211,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	nand_set_controller_data(this, priv);
 
 	/* Set address of NAND IO lines */
-	this->legacy.IO_ADDR_R = io_base + OMAP_MPUIO_INPUT_LATCH;
-	this->legacy.IO_ADDR_W = io_base + OMAP_MPUIO_OUTPUT;
 	this->legacy.read_byte = ams_delta_read_byte;
 	this->legacy.write_buf = ams_delta_write_buf;
 	this->legacy.read_buf = ams_delta_read_buf;
-- 
2.16.4
