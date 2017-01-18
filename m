Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTp4t-0005UN-6D
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 12:11:00 +0000
Received: by mail-wm0-x242.google.com with SMTP id r126so3601479wmr.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 04:10:38 -0800 (PST)
From: Sebastien Decourriere <sebtx452@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-mips@linux-mips.org,
	Sebastien Decourriere <sebtx452@gmail.com>
Subject: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap is
 enabled
Date: Wed, 18 Jan 2017 13:10:52 +0100
Message-Id: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The purpose of this patch is to enable the software address endianness
swapping only when the in SoC EBU endianness swapping is disabled.
To perform this check, I look at Bit 30 of the EBU_CON_0 register.
Actually, the driver expects that the in SoC swapping is disabled.
This is the case with current bootloaders shuch as U-boot. But,

I have a router which uses a proprietary bootloader which keeps
the in SoC swapping enabled. The SoC in this router is a vrx200 v1.2.
In this SoC version, I can keep the in SoC swapping without any problem.

Signed-off-by: Sebastien Decourriere <sebtx452@gmail.com>
---
 drivers/mtd/maps/lantiq-flash.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index c8febb3..a091efa 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -151,6 +151,11 @@ ltq_mtd_probe(struct platform_device *pdev)
 	ltq_mtd->map->copy_to = ltq_copy_to;
 
 	ltq_mtd->map->map_priv_1 = LTQ_NOR_PROBING;
+	/* We swap the addresses only if the EBU endianness swap is disabled */
+	if (ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))
+		ltq_mtd->map[i].map_priv_1 = LTQ_NOR_NORMAL;
+	else
+		ltq_mtd->map[i].map_priv_1 = LTQ_NOR_PROBING;
 	ltq_mtd->mtd = do_map_probe("cfi_probe", ltq_mtd->map);
 	ltq_mtd->map->map_priv_1 = LTQ_NOR_NORMAL;
 
@@ -163,8 +168,11 @@ ltq_mtd_probe(struct platform_device *pdev)
 	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);
 
 	cfi = ltq_mtd->map->fldrv_priv;
-	cfi->addr_unlock1 ^= 1;
-	cfi->addr_unlock2 ^= 1;
+	/* We swap the addresses only if the EBU endianness swap is disabled */
+	if (!(ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))) {
+		cfi->addr_unlock1 ^= 1;
+		cfi->addr_unlock2 ^= 1;
+	}
 
 	err = mtd_device_register(ltq_mtd->mtd, NULL, 0);
 	if (err) {
-- 
2.1.4
