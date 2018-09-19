Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2lK8-0008GP-Jp
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 22:52:08 +0000
Received: by mail-lf1-x141.google.com with SMTP id t140-v6so6610265lff.4
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2018 15:51:46 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] mtd: rawnand: ams-delta: Set port direction when needed
Date: Thu, 20 Sep 2018 00:52:55 +0200
Message-Id: <20180919225255.31175-4-jmkrzyszt@gmail.com>
In-Reply-To: <20180919225255.31175-1-jmkrzyszt@gmail.com>
References: <20180820213904.13475-1-jmkrzyszt@gmail.com>
 <20180919225255.31175-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In its current shape, the driver sets data port direction before each
byte read/write operation, even during multi-byte transfers.  Improve
performance of the driver by setting the port direction only when
needed.

This optimisation will become particularly important as soon as
planned conversion of the driver to GPIO API for data I/O will be
implemented.

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 57 ++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index eb2aeadc3b65..5ba180a291eb 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -45,6 +45,7 @@ struct ams_delta_nand {
 	struct gpio_desc	*gpiod_ale;
 	struct gpio_desc	*gpiod_cle;
 	void __iomem		*io_base;
+	bool			data_in;
 };
 
 /*
@@ -72,48 +73,64 @@ static const struct mtd_partition partition_info[] = {
 	  .size		=  3 * SZ_256K },
 };
 
-static void ams_delta_write_byte(struct nand_chip *this, u_char byte)
+static void ams_delta_io_write(struct ams_delta_nand *priv, u_char byte)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
-	void __iomem *io_base = priv->io_base;
-
-	writew(0, io_base + OMAP_MPUIO_IO_CNTL);
-	writew(byte, this->legacy.IO_ADDR_W);
+	writew(byte, priv->nand_chip.legacy.IO_ADDR_W);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 	ndelay(40);
 	gpiod_set_value(priv->gpiod_nwe, 1);
 }
 
-static u_char ams_delta_read_byte(struct nand_chip *this)
+static u_char ams_delta_io_read(struct ams_delta_nand *priv)
 {
 	u_char res;
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
-	void __iomem *io_base = priv->io_base;
 
 	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
-	writew(~0, io_base + OMAP_MPUIO_IO_CNTL);
-	res = readw(this->legacy.IO_ADDR_R);
+	res = readw(priv->nand_chip.legacy.IO_ADDR_R);
 	gpiod_set_value(priv->gpiod_nre, 1);
 
 	return res;
 }
 
+static void ams_delta_dir_input(struct ams_delta_nand *priv, bool in)
+{
+	writew(in ? ~0 : 0, priv->io_base + OMAP_MPUIO_IO_CNTL);
+	priv->data_in = in;
+}
+
 static void ams_delta_write_buf(struct nand_chip *this, const u_char *buf,
 				int len)
 {
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
-	for (i=0; i<len; i++)
-		ams_delta_write_byte(this, buf[i]);
+	if (priv->data_in)
+		ams_delta_dir_input(priv, false);
+
+	for (i = 0; i < len; i++)
+		ams_delta_io_write(priv, buf[i]);
 }
 
 static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
 {
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
-	for (i=0; i<len; i++)
-		buf[i] = ams_delta_read_byte(this);
+	if (!priv->data_in)
+		ams_delta_dir_input(priv, true);
+
+	for (i = 0; i < len; i++)
+		buf[i] = ams_delta_io_read(priv);
+}
+
+static u_char ams_delta_read_byte(struct nand_chip *this)
+{
+	u_char res;
+
+	ams_delta_read_buf(this, &res, 1);
+
+	return res;
 }
 
 /*
@@ -135,8 +152,11 @@ static void ams_delta_hwcontrol(struct nand_chip *this, int cmd,
 		gpiod_set_value(priv->gpiod_ale, !!(ctrl & NAND_ALE));
 	}
 
-	if (cmd != NAND_CMD_NONE)
-		ams_delta_write_byte(this, cmd);
+	if (cmd != NAND_CMD_NONE) {
+		u_char byte = cmd;
+
+		ams_delta_write_buf(this, &byte, 1);
+	}
 }
 
 static int ams_delta_nand_ready(struct nand_chip *this)
@@ -258,6 +278,9 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_mtd;
 	}
 
+	/* Initialize data port direction to a known state */
+	ams_delta_dir_input(priv, true);
+
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
 	if (err)
-- 
2.16.4
