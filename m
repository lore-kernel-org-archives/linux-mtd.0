Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBrO4-00075m-Lg
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 06:42:59 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0UBeYtd007978
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jan 2007 13:40:57 +0200
Subject: [PATCH] [MTD] remove unused fields
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-YLHBBrZdLA+y2fg6W4Ek"
Date: Tue, 30 Jan 2007 13:42:26 +0200
Message-Id: <1170157346.9477.81.camel@sauron>
Mime-Version: 1.0
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YLHBBrZdLA+y2fg6W4Ek
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQotLSANCkJlc3QgcmVnYXJkcywNCkFydGVtIEJpdHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg
0JDRgNGC0ZHQvCkNCg==


--=-YLHBBrZdLA+y2fg6W4Ek
Content-Disposition: attachment; filename=remove-unused-fields.patch
Content-Type: application/mbox; name=remove-unused-fields.patch
Content-Transfer-Encoding: 7bit

>From 82877512297dcd9dcc6a37b3adec1c2a2349aac5 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 30 Jan 2007 10:50:43 +0200
Subject: [PATCH] [MTD] remove unused fields

Remove unused and broken mtd->ecctype and mtd->eccsize fields
from struct mtd_info. Do not remove them from userspace API
data structures (don't want to breake userspace) but mark them
as obsolete by a comment. Any userspace program which uses them
should be half-broken anyway, so this is more about saving
data structure size.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/devices/doc2000.c      |    1 -
 drivers/mtd/devices/doc2001.c      |    1 -
 drivers/mtd/devices/doc2001plus.c  |    1 -
 drivers/mtd/mtdchar.c              |    5 +++--
 drivers/mtd/mtdconcat.c            |    4 ----
 drivers/mtd/mtdpart.c              |    2 --
 drivers/mtd/nand/nand_base.c       |    1 -
 drivers/mtd/onenand/onenand_base.c |    1 -
 include/linux/mtd/mtd.h            |    2 --
 include/mtd/mtd-abi.h              |    8 ++------
 10 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index 603a795..8a0c4de 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -569,7 +569,6 @@ void DoC2k_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->ecctype = MTD_ECC_RS_DiskOnChip;
 	mtd->size = 0;
 	mtd->erasesize = 0;
 	mtd->writesize = 512;
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 0e2a932..22a3b9e 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -349,7 +349,6 @@ void DoCMil_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->ecctype = MTD_ECC_RS_DiskOnChip;
 	mtd->size = 0;
 
 	/* FIXME: erase size is not always 8KiB */
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 92dbb47..0118559 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -473,7 +473,6 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->ecctype = MTD_ECC_RS_DiskOnChip;
 	mtd->size = 0;
 
 	mtd->erasesize = 0;
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3013d08..3731523 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -419,8 +419,9 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		info.erasesize	= mtd->erasesize;
 		info.writesize	= mtd->writesize;
 		info.oobsize	= mtd->oobsize;
-		info.ecctype	= mtd->ecctype;
-		info.eccsize	= mtd->eccsize;
+		/* The below fields are obsolete */
+		info.ecctype	= -1;
+		info.eccsize	= 0;
 		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
 			return -EFAULT;
 		break;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 0690268..880580c 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -727,8 +727,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.erasesize = subdev[0]->erasesize;
 	concat->mtd.writesize = subdev[0]->writesize;
 	concat->mtd.oobsize = subdev[0]->oobsize;
-	concat->mtd.ecctype = subdev[0]->ecctype;
-	concat->mtd.eccsize = subdev[0]->eccsize;
 	if (subdev[0]->writev)
 		concat->mtd.writev = concat_writev;
 	if (subdev[0]->read_oob)
@@ -774,8 +772,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 		if (concat->mtd.writesize   !=  subdev[i]->writesize ||
 		    concat->mtd.subpage_sft != subdev[i]->subpage_sft ||
 		    concat->mtd.oobsize    !=  subdev[i]->oobsize ||
-		    concat->mtd.ecctype    !=  subdev[i]->ecctype ||
-		    concat->mtd.eccsize    !=  subdev[i]->eccsize ||
 		    !concat->mtd.read_oob  != !subdev[i]->read_oob ||
 		    !concat->mtd.write_oob != !subdev[i]->write_oob) {
 			kfree(concat);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bafd2fb..633def3 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -338,8 +338,6 @@ int add_mtd_partitions(struct mtd_info *master,
 		slave->mtd.size = parts[i].size;
 		slave->mtd.writesize = master->writesize;
 		slave->mtd.oobsize = master->oobsize;
-		slave->mtd.ecctype = master->ecctype;
-		slave->mtd.eccsize = master->eccsize;
 		slave->mtd.subpage_sft = master->subpage_sft;
 
 		slave->mtd.name = parts[i].name;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dfe56e0..00ea1fd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2530,7 +2530,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->ecctype = MTD_ECC_SW;
 	mtd->erase = nand_erase;
 	mtd->point = NULL;
 	mtd->unpoint = NULL;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 2da6bb2..00e61c3 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2097,7 +2097,6 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->ecctype = MTD_ECC_SW;
 	mtd->erase = onenand_erase;
 	mtd->point = NULL;
 	mtd->unpoint = NULL;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index afab253..8a2e8bf 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -117,8 +117,6 @@ struct mtd_info {
 	u_int32_t writesize;
 
 	u_int32_t oobsize;   // Amount of OOB data per block (e.g. 16)
-	u_int32_t ecctype;
-	u_int32_t eccsize;
 
 	// Kernel-only stuff starts here.
 	char *name;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index f913c30..8e501a7 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -36,12 +36,6 @@ struct mtd_oob_buf {
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
 
-
-// Types of automatic ECC/Checksum available
-#define MTD_ECC_NONE		0 	// No automatic ECC available
-#define MTD_ECC_RS_DiskOnChip	1	// Automatic ECC on DiskOnChip
-#define MTD_ECC_SW		2	// SW ECC for Toshiba & Samsung devices
-
 /* ECC byte placement */
 #define MTD_NANDECC_OFF		0	// Switch off ECC (Not recommended)
 #define MTD_NANDECC_PLACE	1	// Use the given placement in the structure (YAFFS1 legacy mode)
@@ -61,6 +55,8 @@ struct mtd_info_user {
 	uint32_t erasesize;
 	uint32_t writesize;
 	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+	/* The below two fields are obsolete and broken, do not use them
+	 * (TODO: remove at some point) */
 	uint32_t ecctype;
 	uint32_t eccsize;
 };
-- 
1.4.4.2


--=-YLHBBrZdLA+y2fg6W4Ek--
