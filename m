Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frrsc-0006AS-JU
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 21:38:33 +0000
Received: by mail-lf1-x143.google.com with SMTP id e23-v6so6676541lfc.13
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2018 14:38:24 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v4 3/3] mtd: rawnand: ams-delta: Set port direction when needed
Date: Mon, 20 Aug 2018 23:39:04 +0200
Message-Id: <20180820213904.13475-4-jmkrzyszt@gmail.com>
In-Reply-To: <20180820213904.13475-1-jmkrzyszt@gmail.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20180820213904.13475-1-jmkrzyszt@gmail.com>
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

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 68 ++++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 48233d638d2a..4d5e5790f18e 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -45,6 +45,7 @@ struct ams_delta_nand {
 	struct gpio_desc	*gpiod_ale;
 	struct gpio_desc	*gpiod_cle;
 	void __iomem		*io_base;
+	bool			data_in;
 };
 
 /*
@@ -72,50 +73,65 @@ static const struct mtd_partition partition_info[] = {
 	  .size		=  3 * SZ_256K },
 };
 
-static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
+static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
-	void __iomem *io_base = priv->io_base;
-
-	writew(0, io_base + OMAP_MPUIO_IO_CNTL);
-	writew(byte, this->IO_ADDR_W);
+	writew(byte, priv->nand_chip.IO_ADDR_W);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 	ndelay(40);
 	gpiod_set_value(priv->gpiod_nwe, 1);
 }
 
-static u_char ams_delta_read_byte(struct mtd_info *mtd)
+static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 {
-	u_char res;
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
-	void __iomem *io_base = priv->io_base;
+	u8 res;
 
 	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
-	writew(~0, io_base + OMAP_MPUIO_IO_CNTL);
-	res = readw(this->IO_ADDR_R);
+	res = readw(priv->nand_chip.IO_ADDR_R);
 	gpiod_set_value(priv->gpiod_nre, 1);
 
 	return res;
 }
 
-static void ams_delta_write_buf(struct mtd_info *mtd, const u_char *buf,
-				int len)
+static void ams_delta_dir_input(struct ams_delta_nand *priv, bool in)
 {
+	writew(in ? ~0 : 0, priv->io_base + OMAP_MPUIO_IO_CNTL);
+	priv->data_in = in;
+}
+
+static void ams_delta_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
-	for (i=0; i<len; i++)
-		ams_delta_write_byte(mtd, buf[i]);
+	if (priv->data_in)
+		ams_delta_dir_input(priv, false);
+
+	for (i = 0; i < len; i++)
+		ams_delta_io_write(priv, buf[i]);
 }
 
-static void ams_delta_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+static void ams_delta_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 {
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
-	for (i=0; i<len; i++)
-		buf[i] = ams_delta_read_byte(mtd);
+	if (!priv->data_in)
+		ams_delta_dir_input(priv, true);
+
+	for (i = 0; i < len; i++)
+		buf[i] = ams_delta_io_read(priv);
+}
+
+static u8 ams_delta_read_byte(struct mtd_info *mtd)
+{
+	u8 res;
+
+	ams_delta_read_buf(mtd, &res, 1);
+
+	return res;
 }
 
 /*
@@ -138,8 +154,11 @@ static void ams_delta_hwcontrol(struct mtd_info *mtd, int cmd,
 		gpiod_set_value(priv->gpiod_ale, !!(ctrl & NAND_ALE));
 	}
 
-	if (cmd != NAND_CMD_NONE)
-		ams_delta_write_byte(mtd, cmd);
+	if (cmd != NAND_CMD_NONE) {
+		u8 byte = cmd;
+
+		ams_delta_write_buf(mtd, &byte, 1);
+	}
 }
 
 static int ams_delta_nand_ready(struct mtd_info *mtd)
@@ -262,6 +281,9 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_mtd;
 	}
 
+	/* Initialize data port direction to a known state */
+	ams_delta_dir_input(priv, true);
+
 	/* Scan to find existence of the device */
 	err = nand_scan(mtd, 1);
 	if (err)
-- 
2.16.4
