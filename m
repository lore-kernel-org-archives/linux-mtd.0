Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1hv-0004Sn-Hp
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 11:00:00 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] pxa3xx_nand: allow to define flash types in the platform
	data
Date: Fri, 29 Aug 2008 12:59:48 +0200
Message-Id: <1220007592-26894-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds 'flash' and 'num_flash' attributes to the platform data.
There was added code in the driver to iterate across these attributes in the
detect-flash routine.  This is done similarly to the existing method
which uses a 'builtin_flash_types' field.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h |    3 +++
 drivers/mtd/nand/pxa3xx_nand.c               |   18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
index 0dc50d8..6ac9aea 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
@@ -58,6 +58,9 @@ struct pxa3xx_nand_platform_data {
 
 	struct mtd_partition *parts;
 	unsigned int	nr_parts;
+
+	struct pxa3xx_nand_flash * const	flash;
+	size_t					num_flash;
 };
 
 extern void pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data *info);
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 838db4b..17915d7 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -888,12 +888,26 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	return 0;
 }
 
-static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info)
+static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
+				    struct pxa3xx_nand_platform_data const *pdata)
 {
 	struct pxa3xx_nand_flash *f;
 	uint32_t id;
 	int i;
 
+	for (i = 0; i<pdata->num_flash; ++i) {
+		f = pdata->flash + i;
+
+		if (pxa3xx_nand_config_flash(info, f))
+			continue;
+
+		if (__readid(info, &id))
+			continue;
+
+		if (id == f->chip_id)
+			return 0;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(builtin_flash_types); i++) {
 
 		f = builtin_flash_types[i];
@@ -1091,7 +1105,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		goto fail_free_buf;
 	}
 
-	ret = pxa3xx_nand_detect_flash(info);
+	ret = pxa3xx_nand_detect_flash(info, pdata);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to detect flash\n");
 		ret = -ENODEV;
-- 
1.5.5.1
