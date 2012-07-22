Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ssq9t-00042A-Us
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2012 07:00:55 +0000
From: John Crispin <blogic@openwrt.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] MTD: check for valid pdata inside plat_nand
Date: Sun, 22 Jul 2012 08:59:57 +0200
Message-Id: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If plat_nand loads and the platform_data is not properly set it will segfault.

Signed-off-by: John Crispin <blogic@openwrt.org>
Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-mtd@lists.infradead.org
---
I am seeing this when plat_nand is referenced inside my DT file but
CONFIG_MTD_NAND_XWAY is not selected, resulting in platform_data not being
populated with valid data.
---
 drivers/mtd/nand/plat_nand.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 1bcb520..a47ee68 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -37,6 +37,11 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	const char **part_types;
 	int err = 0;
 
+	if (!pdata) {
+		dev_err(&pdev->dev, "platform_nand_data is missing\n");
+		return -EINVAL;
+	}
+
 	if (pdata->chip.nr_chips < 1) {
 		dev_err(&pdev->dev, "invalid number of chips specified\n");
 		return -EINVAL;
-- 
1.7.9.1
