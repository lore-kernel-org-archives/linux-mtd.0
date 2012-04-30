Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOujZ-0004kL-2T
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 17:50:02 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/4] MTD: add read_byte support to plat_nand
Date: Mon, 30 Apr 2012 19:30:47 +0200
Message-Id: <1335807048-24032-3-git-send-email-blogic@openwrt.org>
In-Reply-To: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
References: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lantiq SoCs have a External Bus Unit (EBU) that is used to attach MTD media.
As we need to co-exist with PCI on the same bus, certain swapping settings must
be applied. Similar to the NOR map driver we need to apply a fix to make NAND
work. The easiest way is to use byte reads.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/plat_nand.c |    1 +
 include/linux/mtd/nand.h     |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index fd2d2a1..1bcb520 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -79,6 +79,7 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	data->chip.select_chip = pdata->ctrl.select_chip;
 	data->chip.write_buf = pdata->ctrl.write_buf;
 	data->chip.read_buf = pdata->ctrl.read_buf;
+	data->chip.read_byte = pdata->ctrl.read_byte;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
 	data->chip.bbt_options |= pdata->chip.bbt_options;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 1482340..b14ff21 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -654,6 +654,7 @@ struct platform_nand_ctrl {
 	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
 	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
+	unsigned char (*read_byte)(struct mtd_info *mtd);
 	void *priv;
 };
 
-- 
1.7.9.1
