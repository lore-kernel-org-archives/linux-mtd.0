Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCJv-0004vB-1d
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:40 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] MTD: lantiq: xway: add missing write_buf and read_buf to
 nand driver
Date: Mon,  4 Jan 2016 22:04:59 +0100
Message-Id: <1451941501-42952-5-git-send-email-blogic@openwrt.org>
In-Reply-To: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index c75a2bc..ef7c7ce 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -136,6 +136,32 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
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
@@ -177,6 +203,8 @@ static struct platform_nand_data xway_nand_data = {
 		.dev_ready	= xway_dev_ready,
 		.select_chip	= xway_select_chip,
 		.read_byte	= xway_read_byte,
+		.read_buf	= xway_read_buf,
+		.write_buf	= xway_write_buf,
 	}
 };
 
-- 
1.7.10.4
