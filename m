Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=AM1EHSOBE004.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RyLTs-0001R7-TR
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2012 10:56:05 +0000
From: Huang Shijie <b32955@freescale.com>
To: <artem.bityutskiy@intel.com>
Subject: [PATCH] mtd: use the full-id string as the keyword to search the id
 table
Date: Fri, 17 Feb 2012 18:57:53 +0800
Message-ID: <1329476273-14381-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <shijie8@gmail.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>,
 ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

There are many nand chips.
The followings are the reasons why i send this patch, take Hynix's nands for example:

[1] Diffrent Hynix's nands may use different methods to parse the id
    string. H27UBG8T2A uses one method, while HY27UW08CGFM uses another.
    If we code each parsing function for each NAND, we will feel frustrated.

[2] The same Device ID.
    It's common that two nands shares the same Device ID.
    How to distinguish the two nands? The only way is to use the full id
    string as the keyword.

So add some new fields to nand_flash_dev{}:
    @id[8]  : extend this field to an array to store the full id data.
    @id_len : Some nands use 8 bytes as id data, while some use 5 or 6.
    @oobsize: The oob size of this nand.

With this patch, during the scanning, the kernel will first checks
the nand_flash_full_ids, then the lagacy nand_flash_ids,
and the last to check whether it is an ONFI nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c   |   38 ++++++--
 drivers/mtd/nand/nand_ids.c    |  189 +++++++++++++++++++++------------------
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 drivers/mtd/nand/sm_common.c   |   60 +++++++-------
 include/linux/mtd/nand.h       |    9 ++-
 5 files changed, 168 insertions(+), 130 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1e907dc..27ab376 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2906,6 +2906,27 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	return 1;
 }
 
+static struct nand_flash_dev *find_nand_type_by_fullid(struct mtd_info *mtd,
+				struct nand_chip *chip, u8 *id_data, int *busw)
+{
+	struct nand_flash_dev *type = nand_flash_full_ids;
+
+	for (; type->name != NULL; type++)
+		if (!strncmp(type->id, id_data, type->id_len)) {
+			mtd->writesize = type->pagesize;
+			mtd->erasesize = type->erasesize;
+			mtd->oobsize = type->oobsize;
+			*busw = type->options & NAND_BUSWIDTH_16;
+
+			chip->chipsize = (uint64_t)type->chipsize << 20;
+			chip->options &= ~NAND_CHIPOPTIONS_MSK;
+			chip->options |= (NAND_NO_READRDY |
+				NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+			return type;
+		}
+	return type;
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -2944,7 +2965,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
@@ -2954,11 +2975,15 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		return ERR_PTR(-ENODEV);
 	}
 
-	if (!type)
+	if (!type) {
+		type = find_nand_type_by_fullid(mtd, chip, id_data, &busw);
+		if (type->name != NULL)
+			goto ident_done;
 		type = nand_flash_ids;
+	}
 
 	for (; type->name != NULL; type++)
-		if (*dev_id == type->id)
+		if (*dev_id == type->id[1])
 			break;
 
 	chip->onfi_version = 0;
@@ -2969,13 +2994,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			goto ident_done;
 	}
 
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
-
-	/* Read entire ID string */
-
-	for (i = 0; i < 8; i++)
-		id_data[i] = chip->read_byte(mtd);
-
 	if (!type->name)
 		return ERR_PTR(-ENODEV);
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index af4fe8c..cfdc9da 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -10,6 +10,21 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
+
+/* This table uses the full ID data as the keyword. */
+struct nand_flash_dev nand_flash_full_ids[] = {
+	/* Hynix */
+	{"H27UBG8T2A 32G 3.3V 8-bit ", {0xad, 0xd7, 0x94, 0x9a, 0x74, 0x42},
+				SZ_8K, SZ_4K, SZ_2M, 0, 6, 448},
+	{"HY27UW08CGFM 64G 3.3V 8-bit", {0xad, 0xd5, 0x55, 0xa5, 0x68},
+				SZ_2K, SZ_8K, SZ_256K, 0, 5, 64},
+	{"HY27UT088G2M 8G 3.3V 8-bit", {0xad, 0xd3, 0x14, 0xa5, 0x64},
+				SZ_2K, SZ_1K, SZ_256K, 0, 5, 64},
+
+	/* end here */
+	{NULL,}
+};
+
 /*
 *	Chip ID list
 *
@@ -24,47 +39,47 @@
 struct nand_flash_dev nand_flash_ids[] = {
 
 #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
-	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 5V 8-bit",		0x6b, 512, 4, 0x2000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xe8, 256, 1, 0x1000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xec, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 3,3V 8-bit",	0xea, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xd5, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe3, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe5, 512, 4, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xd6, 512, 8, 0x2000, 0},
-
-	{"NAND 8MiB 1,8V 8-bit",	0x39, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xe6, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 1,8V 16-bit",	0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-	{"NAND 8MiB 3,3V 16-bit",	0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
+	{"NAND 1MiB 5V 8-bit",		{0, 0x6e}, 256, 1, 0x1000, 0},
+	{"NAND 2MiB 5V 8-bit",		{0, 0x64}, 256, 2, 0x1000, 0},
+	{"NAND 4MiB 5V 8-bit",		{0, 0x6b}, 512, 4, 0x2000, 0},
+	{"NAND 1MiB 3,3V 8-bit",	{0, 0xe8}, 256, 1, 0x1000, 0},
+	{"NAND 1MiB 3,3V 8-bit",	{0, 0xec}, 256, 1, 0x1000, 0},
+	{"NAND 2MiB 3,3V 8-bit",	{0, 0xea}, 256, 2, 0x1000, 0},
+	{"NAND 4MiB 3,3V 8-bit",	{0, 0xd5}, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit",	{0, 0xe3}, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit",	{0, 0xe5}, 512, 4, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit",	{0, 0xd6}, 512, 8, 0x2000, 0},
+
+	{"NAND 8MiB 1,8V 8-bit",	{0, 0x39}, 512, 8, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit",	{0, 0xe6}, 512, 8, 0x2000, 0},
+	{"NAND 8MiB 1,8V 16-bit",	{0, 0x49}, 512, 8, 0x2000, NAND_BUSWIDTH_16},
+	{"NAND 8MiB 3,3V 16-bit",	{0, 0x59}, 512, 8, 0x2000, NAND_BUSWIDTH_16},
 #endif
 
-	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 1,8V 16-bit",	0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 16MiB 3,3V 16-bit",	0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 16MiB 1,8V 8-bit",	{0, 0x33}, 512, 16, 0x4000, 0},
+	{"NAND 16MiB 3,3V 8-bit",	{0, 0x73}, 512, 16, 0x4000, 0},
+	{"NAND 16MiB 1,8V 16-bit",	{0, 0x43}, 512, 16, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 16MiB 3,3V 16-bit",	{0, 0x53}, 512, 16, 0x4000, NAND_BUSWIDTH_16},
 
-	{"NAND 32MiB 1,8V 8-bit",	0x35, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 3,3V 8-bit",	0x75, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 1,8V 16-bit",	0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 32MiB 3,3V 16-bit",	0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 32MiB 1,8V 8-bit",	{0, 0x35}, 512, 32, 0x4000, 0},
+	{"NAND 32MiB 3,3V 8-bit",	{0, 0x75}, 512, 32, 0x4000, 0},
+	{"NAND 32MiB 1,8V 16-bit",	{0, 0x45}, 512, 32, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 32MiB 3,3V 16-bit",	{0, 0x55}, 512, 32, 0x4000, NAND_BUSWIDTH_16},
 
-	{"NAND 64MiB 1,8V 8-bit",	0x36, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 3,3V 8-bit",	0x76, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 1,8V 16-bit",	0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 64MiB 3,3V 16-bit",	0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 64MiB 1,8V 8-bit",	{0, 0x36}, 512, 64, 0x4000, 0},
+	{"NAND 64MiB 3,3V 8-bit",	{0, 0x76}, 512, 64, 0x4000, 0},
+	{"NAND 64MiB 1,8V 16-bit",	{0, 0x46}, 512, 64, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 64MiB 3,3V 16-bit",	{0, 0x56}, 512, 64, 0x4000, NAND_BUSWIDTH_16},
 
-	{"NAND 128MiB 1,8V 8-bit",	0x78, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 8-bit",	0x39, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 3,3V 8-bit",	0x79, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 16-bit",	0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 1,8V 16-bit",	0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 128MiB 1,8V 8-bit",	{0, 0x78}, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 1,8V 8-bit",	{0, 0x39}, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 3,3V 8-bit",	{0, 0x79}, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 1,8V 16-bit",	{0, 0x72}, 512, 128, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 128MiB 1,8V 16-bit",	{0, 0x49}, 512, 128, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit",	{0, 0x74}, 512, 128, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit",	{0, 0x59}, 512, 128, 0x4000, NAND_BUSWIDTH_16},
 
-	{"NAND 256MiB 3,3V 8-bit",	0x71, 512, 256, 0x4000, 0},
+	{"NAND 256MiB 3,3V 8-bit",	{0, 0x71}, 512, 256, 0x4000, 0},
 
 	/*
 	 * These are the new chips with large page size. The pagesize and the
@@ -74,77 +89,77 @@ struct nand_flash_dev nand_flash_ids[] = {
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 	/* 512 Megabit */
-	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 1,8V 8-bit",	0xA0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xD0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xF0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 1,8V 16-bit",	0xB0, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 3,3V 16-bit",	0xC0, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 1,8V 8-bit",	{0, 0xA2}, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 1,8V 8-bit",	{0, 0xA0}, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	{0, 0xF2}, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	{0, 0xD0}, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	{0, 0xF0}, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 1,8V 16-bit",	{0, 0xB2}, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 1,8V 16-bit",	{0, 0xB0}, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 3,3V 16-bit",	{0, 0xC2}, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 3,3V 16-bit",	{0, 0xC0}, 0,  64, 0, LP_OPTIONS16},
 
 	/* 1 Gigabit */
-	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 1,8V 16-bit",     0xAD, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 1,8V 8-bit",	{0, 0xA1}, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 3,3V 8-bit",	{0, 0xF1}, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 3,3V 8-bit",	{0, 0xD1}, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 1,8V 16-bit",	{0, 0xB1}, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 3,3V 16-bit",	{0, 0xC1}, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 1,8V 16-bit",     {0, 0xAD}, 0, 128, 0, LP_OPTIONS16},
 
 	/* 2 Gigabit */
-	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 3,3V 8-bit",	0xDA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 1,8V 16-bit",	0xBA, 0, 256, 0, LP_OPTIONS16},
-	{"NAND 256MiB 3,3V 16-bit",	0xCA, 0, 256, 0, LP_OPTIONS16},
+	{"NAND 256MiB 1,8V 8-bit",	{0, 0xAA}, 0, 256, 0, LP_OPTIONS},
+	{"NAND 256MiB 3,3V 8-bit",	{0, 0xDA}, 0, 256, 0, LP_OPTIONS},
+	{"NAND 256MiB 1,8V 16-bit",	{0, 0xBA}, 0, 256, 0, LP_OPTIONS16},
+	{"NAND 256MiB 3,3V 16-bit",	{0, 0xCA}, 0, 256, 0, LP_OPTIONS16},
 
 	/* 4 Gigabit */
-	{"NAND 512MiB 1,8V 8-bit",	0xAC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 3,3V 8-bit",	0xDC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 1,8V 16-bit",	0xBC, 0, 512, 0, LP_OPTIONS16},
-	{"NAND 512MiB 3,3V 16-bit",	0xCC, 0, 512, 0, LP_OPTIONS16},
+	{"NAND 512MiB 1,8V 8-bit",	{0, 0xAC}, 0, 512, 0, LP_OPTIONS},
+	{"NAND 512MiB 3,3V 8-bit",	{0, 0xDC}, 0, 512, 0, LP_OPTIONS},
+	{"NAND 512MiB 1,8V 16-bit",	{0, 0xBC}, 0, 512, 0, LP_OPTIONS16},
+	{"NAND 512MiB 3,3V 16-bit",	{0, 0xCC}, 0, 512, 0, LP_OPTIONS16},
 
 	/* 8 Gigabit */
-	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
-	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
+	{"NAND 1GiB 1,8V 8-bit",	{0, 0xA3}, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",	{0, 0xD3}, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 1,8V 16-bit",	{0, 0xB3}, 0, 1024, 0, LP_OPTIONS16},
+	{"NAND 1GiB 3,3V 16-bit",	{0, 0xC3}, 0, 1024, 0, LP_OPTIONS16},
 
 	/* 16 Gigabit */
-	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
-	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
+	{"NAND 2GiB 1,8V 8-bit",	{0, 0xA5}, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	{0, 0xD5}, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 1,8V 16-bit",	{0, 0xB5}, 0, 2048, 0, LP_OPTIONS16},
+	{"NAND 2GiB 3,3V 16-bit",	{0, 0xC5}, 0, 2048, 0, LP_OPTIONS16},
 
 	/* 32 Gigabit */
-	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
-	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
-	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
-	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
+	{"NAND 4GiB 1,8V 8-bit",	{0, 0xA7}, 0, 4096, 0, LP_OPTIONS},
+	{"NAND 4GiB 3,3V 8-bit",	{0, 0xD7}, 0, 4096, 0, LP_OPTIONS},
+	{"NAND 4GiB 1,8V 16-bit",	{0, 0xB7}, 0, 4096, 0, LP_OPTIONS16},
+	{"NAND 4GiB 3,3V 16-bit",	{0, 0xC7}, 0, 4096, 0, LP_OPTIONS16},
 
 	/* 64 Gigabit */
-	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
-	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
-	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
-	{"NAND 8GiB 3,3V 16-bit",	0xCE, 0, 8192, 0, LP_OPTIONS16},
+	{"NAND 8GiB 1,8V 8-bit",	{0, 0xAE}, 0, 8192, 0, LP_OPTIONS},
+	{"NAND 8GiB 3,3V 8-bit",	{0, 0xDE}, 0, 8192, 0, LP_OPTIONS},
+	{"NAND 8GiB 1,8V 16-bit",	{0, 0xBE}, 0, 8192, 0, LP_OPTIONS16},
+	{"NAND 8GiB 3,3V 16-bit",	{0, 0xCE}, 0, 8192, 0, LP_OPTIONS16},
 
 	/* 128 Gigabit */
-	{"NAND 16GiB 1,8V 8-bit",	0x1A, 0, 16384, 0, LP_OPTIONS},
-	{"NAND 16GiB 3,3V 8-bit",	0x3A, 0, 16384, 0, LP_OPTIONS},
-	{"NAND 16GiB 1,8V 16-bit",	0x2A, 0, 16384, 0, LP_OPTIONS16},
-	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
+	{"NAND 16GiB 1,8V 8-bit",	{0, 0x1A}, 0, 16384, 0, LP_OPTIONS},
+	{"NAND 16GiB 3,3V 8-bit",	{0, 0x3A}, 0, 16384, 0, LP_OPTIONS},
+	{"NAND 16GiB 1,8V 16-bit",	{0, 0x2A}, 0, 16384, 0, LP_OPTIONS16},
+	{"NAND 16GiB 3,3V 16-bit",	{0, 0x4A}, 0, 16384, 0, LP_OPTIONS16},
 
 	/* 256 Gigabit */
-	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
-	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
-	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
-	{"NAND 32GiB 3,3V 16-bit",	0x4C, 0, 32768, 0, LP_OPTIONS16},
+	{"NAND 32GiB 1,8V 8-bit",	{0, 0x1C}, 0, 32768, 0, LP_OPTIONS},
+	{"NAND 32GiB 3,3V 8-bit",	{0, 0x3C}, 0, 32768, 0, LP_OPTIONS},
+	{"NAND 32GiB 1,8V 16-bit",	{0, 0x2C}, 0, 32768, 0, LP_OPTIONS16},
+	{"NAND 32GiB 3,3V 16-bit",	{0, 0x4C}, 0, 32768, 0, LP_OPTIONS16},
 
 	/* 512 Gigabit */
-	{"NAND 64GiB 1,8V 8-bit",	0x1E, 0, 65536, 0, LP_OPTIONS},
-	{"NAND 64GiB 3,3V 8-bit",	0x3E, 0, 65536, 0, LP_OPTIONS},
-	{"NAND 64GiB 1,8V 16-bit",	0x2E, 0, 65536, 0, LP_OPTIONS16},
-	{"NAND 64GiB 3,3V 16-bit",	0x4E, 0, 65536, 0, LP_OPTIONS16},
+	{"NAND 64GiB 1,8V 8-bit",	{0, 0x1E}, 0, 65536, 0, LP_OPTIONS},
+	{"NAND 64GiB 3,3V 8-bit",	{0, 0x3E}, 0, 65536, 0, LP_OPTIONS},
+	{"NAND 64GiB 1,8V 16-bit",	{0, 0x2E}, 0, 65536, 0, LP_OPTIONS16},
+	{"NAND 64GiB 3,3V 16-bit",	{0, 0x4E}, 0, 65536, 0, LP_OPTIONS16},
 
 	/*
 	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
@@ -156,7 +171,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 * erased in one go There are more speed improvements for reads and
 	 * writes possible, but not implemented now
 	 */
-	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000,
+	{"AND 128MiB 3,3V 8-bit",	{0, 0x01}, 2048, 128, 0x4000,
 	 NAND_IS_AND | NAND_NO_AUTOINCR |NAND_NO_READRDY | NAND_4PAGE_ARRAY |
 	 BBT_AUTO_REFRESH
 	},
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 5c3d719..a3773b3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -990,7 +990,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	}
 
 	pxa3xx_flash_ids[0].name = f->name;
-	pxa3xx_flash_ids[0].id = (f->chip_id >> 8) & 0xffff;
+	pxa3xx_flash_ids[0].id[1] = (f->chip_id >> 8) & 0xffff;
 	pxa3xx_flash_ids[0].pagesize = f->page_size;
 	chipsize = (uint64_t)f->num_blocks * f->page_per_block * f->page_size;
 	pxa3xx_flash_ids[0].chipsize = chipsize >> 20;
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 774c3c2..be9572d 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -69,42 +69,42 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {
-	{"SmartMedia 1MiB 5V",          0x6e, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xe8, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xec, 256, 1, 0x1000, 0},
-	{"SmartMedia 2MiB 3,3V",        0xea, 256, 2, 0x1000, 0},
-	{"SmartMedia 2MiB 5V",          0x64, 256, 2, 0x1000, 0},
-	{"SmartMedia 2MiB 3,3V ROM",    0x5d, 512, 2, 0x2000, NAND_ROM},
-	{"SmartMedia 4MiB 3,3V",        0xe3, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 3,3/5V",      0xe5, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 5V",          0x6b, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 3,3V ROM",    0xd5, 512, 4, 0x2000, NAND_ROM},
-	{"SmartMedia 8MiB 3,3V",        0xe6, 512, 8, 0x2000, 0},
-	{"SmartMedia 8MiB 3,3V ROM",    0xd6, 512, 8, 0x2000, NAND_ROM},
-	{"SmartMedia 16MiB 3,3V",       0x73, 512, 16, 0x4000, 0},
-	{"SmartMedia 16MiB 3,3V ROM",   0x57, 512, 16, 0x4000, NAND_ROM},
-	{"SmartMedia 32MiB 3,3V",       0x75, 512, 32, 0x4000, 0},
-	{"SmartMedia 32MiB 3,3V ROM",   0x58, 512, 32, 0x4000, NAND_ROM},
-	{"SmartMedia 64MiB 3,3V",       0x76, 512, 64, 0x4000, 0},
-	{"SmartMedia 64MiB 3,3V ROM",   0xd9, 512, 64, 0x4000, NAND_ROM},
-	{"SmartMedia 128MiB 3,3V",      0x79, 512, 128, 0x4000, 0},
-	{"SmartMedia 128MiB 3,3V ROM",  0xda, 512, 128, 0x4000, NAND_ROM},
-	{"SmartMedia 256MiB 3,3V",      0x71, 512, 256, 0x4000 },
-	{"SmartMedia 256MiB 3,3V ROM",  0x5b, 512, 256, 0x4000, NAND_ROM},
+	{"SmartMedia 1MiB 5V",          {0, 0x6e}, 256, 1, 0x1000, 0},
+	{"SmartMedia 1MiB 3,3V",        {0, 0xe8}, 256, 1, 0x1000, 0},
+	{"SmartMedia 1MiB 3,3V",        {0, 0xec}, 256, 1, 0x1000, 0},
+	{"SmartMedia 2MiB 3,3V",        {0, 0xea}, 256, 2, 0x1000, 0},
+	{"SmartMedia 2MiB 5V",          {0, 0x64}, 256, 2, 0x1000, 0},
+	{"SmartMedia 2MiB 3,3V ROM",    {0, 0x5d}, 512, 2, 0x2000, NAND_ROM},
+	{"SmartMedia 4MiB 3,3V",        {0, 0xe3}, 512, 4, 0x2000, 0},
+	{"SmartMedia 4MiB 3,3/5V",      {0, 0xe5}, 512, 4, 0x2000, 0},
+	{"SmartMedia 4MiB 5V",          {0, 0x6b}, 512, 4, 0x2000, 0},
+	{"SmartMedia 4MiB 3,3V ROM",    {0, 0xd5}, 512, 4, 0x2000, NAND_ROM},
+	{"SmartMedia 8MiB 3,3V",        {0, 0xe6}, 512, 8, 0x2000, 0},
+	{"SmartMedia 8MiB 3,3V ROM",    {0, 0xd6}, 512, 8, 0x2000, NAND_ROM},
+	{"SmartMedia 16MiB 3,3V",       {0, 0x73}, 512, 16, 0x4000, 0},
+	{"SmartMedia 16MiB 3,3V ROM",   {0, 0x57}, 512, 16, 0x4000, NAND_ROM},
+	{"SmartMedia 32MiB 3,3V",       {0, 0x75}, 512, 32, 0x4000, 0},
+	{"SmartMedia 32MiB 3,3V ROM",   {0, 0x58}, 512, 32, 0x4000, NAND_ROM},
+	{"SmartMedia 64MiB 3,3V",       {0, 0x76}, 512, 64, 0x4000, 0},
+	{"SmartMedia 64MiB 3,3V ROM",   {0, 0xd9}, 512, 64, 0x4000, NAND_ROM},
+	{"SmartMedia 128MiB 3,3V",      {0, 0x79}, 512, 128, 0x4000, 0},
+	{"SmartMedia 128MiB 3,3V ROM",  {0, 0xda}, 512, 128, 0x4000, NAND_ROM},
+	{"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },
+	{"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000, NAND_ROM},
 	{NULL,}
 };
 
 #define XD_TYPEM       (NAND_NO_AUTOINCR | NAND_BROKEN_XD)
 static struct nand_flash_dev nand_xd_flash_ids[] = {
 
-	{"xD 16MiB 3,3V",    0x73, 512, 16, 0x4000, 0},
-	{"xD 32MiB 3,3V",    0x75, 512, 32, 0x4000, 0},
-	{"xD 64MiB 3,3V",    0x76, 512, 64, 0x4000, 0},
-	{"xD 128MiB 3,3V",   0x79, 512, 128, 0x4000, 0},
-	{"xD 256MiB 3,3V",   0x71, 512, 256, 0x4000, XD_TYPEM},
-	{"xD 512MiB 3,3V",   0xdc, 512, 512, 0x4000, XD_TYPEM},
-	{"xD 1GiB 3,3V",     0xd3, 512, 1024, 0x4000, XD_TYPEM},
-	{"xD 2GiB 3,3V",     0xd5, 512, 2048, 0x4000, XD_TYPEM},
+	{"xD 16MiB 3,3V",    {0, 0x73}, 512, 16, 0x4000, 0},
+	{"xD 32MiB 3,3V",    {0, 0x75}, 512, 32, 0x4000, 0},
+	{"xD 64MiB 3,3V",    {0, 0x76}, 512, 64, 0x4000, 0},
+	{"xD 128MiB 3,3V",   {0, 0x79}, 512, 128, 0x4000, 0},
+	{"xD 256MiB 3,3V",   {0, 0x71}, 512, 256, 0x4000, XD_TYPEM},
+	{"xD 512MiB 3,3V",   {0, 0xdc}, 512, 512, 0x4000, XD_TYPEM},
+	{"xD 1GiB 3,3V",     {0, 0xd3}, 512, 1024, 0x4000, XD_TYPEM},
+	{"xD 2GiB 3,3V",     {0, 0xd5}, 512, 2048, 0x4000, XD_TYPEM},
 	{NULL,}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 609868f..7d5ae3c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -561,7 +561,7 @@ struct nand_chip {
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name:	Identify the device type
- * @id:		device ID code
+ * @id:		ID data
  * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
  *		If the pagesize is 0, then the real pagesize
  *		and the eraseize are determined from the
@@ -569,14 +569,18 @@ struct nand_chip {
  * @erasesize:	Size of an erase block in the flash device.
  * @chipsize:	Total chipsize in Mega Bytes
  * @options:	Bitfield to store chip relevant options
+ * @id_len      The valid length of the id data.
+ * @oobsize:   OOB size
  */
 struct nand_flash_dev {
 	char *name;
-	int id;
+	u8 id[8];
 	unsigned long pagesize;
 	unsigned long chipsize;
 	unsigned long erasesize;
 	unsigned long options;
+	unsigned int id_len;
+	unsigned long oobsize;
 };
 
 /**
@@ -589,6 +593,7 @@ struct nand_manufacturers {
 	char *name;
 };
 
+extern struct nand_flash_dev nand_flash_full_ids[];
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-- 
1.7.0.4
