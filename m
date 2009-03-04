Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lenth-0007N4-Nc
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 10:00:22 +0000
Date: Wed, 4 Mar 2009 10:00:08 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] add (write|read)_buf callbacks to plat_nand
Message-ID: <20090304100008.GQ24031@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds (write|read)_buf callbacks to plat_nand.

The NAND on the TS-7800 provisioned by the FPGA allows readl() and
writel() to be used which gives a 2.5x speed up.  To be able to
use this from the plat_nand driver hooks to write_buf and read_buf
need to be made available.  This patch adds those hooks.

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 drivers/mtd/nand/plat_nand.c |    2 ++
 include/linux/mtd/nand.h     |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 75f9f48..262bede 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -61,6 +61,8 @@ static int __init plat_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.write_buf = pdata->ctrl.write_buf;
+	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index db5b63d..c383dee 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -594,6 +594,10 @@ struct platform_nand_ctrl {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	void		(*write_buf)(struct mtd_info *mtd,
+				    const uint8_t *buf, int len);
+	void		(*read_buf)(struct mtd_info *mtd,
+				    uint8_t *buf, int len);
 	void		*priv;
 };
 
-- 
1.6.1.3
