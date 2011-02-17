Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pq2Ic-00084k-F9
	for linux-mtd@lists.infradead.org; Thu, 17 Feb 2011 11:45:31 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: omap: add new variable to platform data to control
	onenand unlocking
Date: Thu, 17 Feb 2011 13:44:42 +0200
Message-Id: <1297943082-398-3-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New variable skip_initial_unlocking is added to the omap_onenand_platform_data.
This is used to inform the onenand driver to skip onenand unlocking when it
is initialized.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 arch/arm/plat-omap/include/plat/onenand.h |    1 +
 drivers/mtd/onenand/omap2.c               |    7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-omap/include/plat/onenand.h b/arch/arm/plat-omap/include/plat/onenand.h
index affe87e..1b430d5 100644
--- a/arch/arm/plat-omap/include/plat/onenand.h
+++ b/arch/arm/plat-omap/include/plat/onenand.h
@@ -24,6 +24,7 @@ struct omap_onenand_platform_data {
 	int			dma_channel;
 	u8			flags;
 	u8			regulator_can_sleep;
+	u8			skip_initial_unlocking;
 };
 
 #define ONENAND_MAX_PARTITIONS 8
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 1e49b65..13e779e 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -629,6 +629,7 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 {
 	struct omap_onenand_platform_data *pdata;
 	struct omap2_onenand *c;
+	struct onenand_chip *this;
 	int r;
 
 	pdata = pdev->dev.platform_data;
@@ -726,9 +727,8 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 
 	c->mtd.dev.parent = &pdev->dev;
 
+	this = &c->onenand;
 	if (c->dma_channel >= 0) {
-		struct onenand_chip *this = &c->onenand;
-
 		this->wait = omap2_onenand_wait;
 		if (cpu_is_omap34xx()) {
 			this->read_bufferram = omap3_onenand_read_bufferram;
@@ -749,6 +749,9 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		c->onenand.disable = omap2_onenand_disable;
 	}
 
+	if (pdata->skip_initial_unlocking)
+		this->options |= ONENAND_SKIP_INITIAL_UNLOCKING;
+
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-- 
1.7.0.4
