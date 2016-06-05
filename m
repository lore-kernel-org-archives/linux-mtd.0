Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fUG-0001H6-Dv
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:21:37 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 5/6] MTD: xway: add missing write_buf and read_buf to nand
 driver
Date: Sun,  5 Jun 2016 23:20:08 +0200
Message-Id: <1465161609-19303-6-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
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
 drivers/mtd/nand/xway_nand.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index d44e00d..bc4018e 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -146,6 +146,32 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	return ret;
 }
 
+static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	struct nand_chip *this = mtd->priv;
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
+	struct nand_chip *this = mtd->priv;
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
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this = platform_get_drvdata(pdev);
@@ -187,6 +213,8 @@ static struct platform_nand_data xway_nand_data = {
 		.dev_ready	= xway_dev_ready,
 		.select_chip	= xway_select_chip,
 		.read_byte	= xway_read_byte,
+		.read_buf	= xway_read_buf,
+		.write_buf	= xway_write_buf,
 	}
 };
 
-- 
2.8.1
