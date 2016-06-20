Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6oY-0000UI-9x
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 21:33:03 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v5 7/8] mtd: nand: xway: add missing write_buf and read_buf to
 nand driver
Date: Mon, 20 Jun 2016 23:32:13 +0200
Message-Id: <1466458334-10830-8-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
References: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver needs a special write_buf and read_buf function, because we
have to read from a specific address to tell the controller this is a
read from the nand controller.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 4cdef24..429ba02 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -129,6 +129,22 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	return xway_readb(mtd, NAND_READ_DATA);
 }
 
+static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = xway_readb(mtd, NAND_WRITE_DATA);
+}
+
+static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		xway_writeb(mtd, NAND_WRITE_DATA, buf[i]);
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -162,6 +178,8 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = xway_cmd_ctrl;
 	data->chip.dev_ready = xway_dev_ready;
 	data->chip.select_chip = xway_select_chip;
+	data->chip.write_buf = xway_write_buf;
+	data->chip.read_buf = xway_read_buf;
 	data->chip.read_byte = xway_read_byte;
 	data->chip.chip_delay = 30;
 
-- 
2.8.1
