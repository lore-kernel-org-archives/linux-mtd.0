Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Ubn-0002N5-QO
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 10:42:09 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: spear_smi: Remove default partition information from
 driver
Date: Fri, 16 Mar 2012 11:41:40 +0100
Message-Id: <1331894500-21305-1-git-send-email-sr@denx.de>
Cc: Vipin Kumar <vipin.kumar@st.com>, spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Additionally, after failing in mtd_device_parse_register(), the driver
unmap/free code is now executed.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/devices/spear_smi.c |   41 ++++++---------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index ad3b7cc..94c5cd9 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -151,21 +151,6 @@ static struct flash_device flash_devices[] = {
 	FLASH_ID("mac 25l6405"   , 0xd8, 0x001720C2, 0x100, 0x10000, 0x800000),
 };
 
-/* These partitions would be used if platform doesn't pass one */
-static struct mtd_partition part_info_8M[] = {
-	DEFINE_PARTS("Xloader", 0x00, 0x10000),
-	DEFINE_PARTS("UBoot", MTDPART_OFS_APPEND, 0x40000),
-	DEFINE_PARTS("Kernel", MTDPART_OFS_APPEND, 0x2C0000),
-	DEFINE_PARTS("Root File System", MTDPART_OFS_APPEND, MTDPART_SIZ_FULL),
-};
-
-static struct mtd_partition part_info_16M[] = {
-	DEFINE_PARTS("Xloader", 0x00, 0x40000),
-	DEFINE_PARTS("UBoot", MTDPART_OFS_APPEND, 0x100000),
-	DEFINE_PARTS("Kernel", MTDPART_OFS_APPEND, 0x300000),
-	DEFINE_PARTS("Root File System", MTDPART_OFS_APPEND, MTDPART_SIZ_FULL),
-};
-
 /* Define spear specific structures */
 
 struct spear_snor_flash;
@@ -771,8 +756,8 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 	struct spear_smi_flash_info *flash_info;
 	struct spear_smi_plat_data *pdata;
 	struct spear_snor_flash *flash;
-	struct mtd_partition *parts;
-	int count;
+	struct mtd_partition *parts = NULL;
+	int count = 0;
 	int flash_index;
 	int ret = 0;
 
@@ -836,28 +821,14 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 	if (flash_info->partitions) {
 		parts = flash_info->partitions;
 		count = flash_info->nr_partitions;
-	} else {
-		/* choose from default ones */
-		switch (flash->mtd.size) {
-		case 0x800000:/* 8MB */
-			parts = part_info_8M;
-			count = ARRAY_SIZE(part_info_8M);
-			break;
-		case 0x1000000:/* 16MB */
-			parts = part_info_16M;
-			count = ARRAY_SIZE(part_info_16M);
-			break;
-		default:
-			dev_err(&pdev->dev, "undefined partition\n");
-			ret = ENODEV;
-			goto err_map;
-		}
 	}
 	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL, parts, count);
-	if (ret)
+	if (ret) {
 		dev_err(&dev->pdev->dev, "Err MTD partition=%d\n", ret);
+		goto err_map;
+	}
 
-	return ret;
+	return 0;
 
 err_map:
 	iounmap(flash->base_addr);
-- 
1.7.9.2
