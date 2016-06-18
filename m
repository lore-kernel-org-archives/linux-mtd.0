Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELhz-0004aZ-4f
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:15:08 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 5/8] MTD: xway: add missing write_buf and read_buf to nand
 driver
Date: Sat, 18 Jun 2016 21:14:09 +0200
Message-Id: <1466277252-13867-6-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <john@phrozen.org>

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 61176c4..1511bdb 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -151,6 +151,33 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	return ret;
 }
 
+
+static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&ebu_lock, flags);
+	for (i = 0; i < len; i++)
+		buf[i] = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
+	spin_unlock_irqrestore(&ebu_lock, flags);
+}
+
+static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&ebu_lock, flags);
+	for (i = 0; i < len; i++)
+		ltq_w8(buf[i], (void __iomem *)(nandaddr | NAND_WRITE_DATA));
+	spin_unlock_irqrestore(&ebu_lock, flags);
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -184,6 +211,8 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = xway_cmd_ctrl;
 	data->chip.dev_ready = xway_dev_ready;
 	data->chip.select_chip = xway_select_chip;
+	data->chip.write_buf = xway_write_buf;
+	data->chip.read_buf = xway_read_buf;
 	data->chip.read_byte = xway_read_byte;
 	data->chip.chip_delay = 30;
 
-- 
2.8.1
