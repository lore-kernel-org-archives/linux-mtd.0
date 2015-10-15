Received: from mail-lf0-f51.google.com ([209.85.215.51])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmiI7-0006hU-FH
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:09:56 +0000
Received: by lffy185 with SMTP id y185so27266720lff.2
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 08/10] mtd: afs: factor footer parsing into the v1 part parsing
Date: Thu, 15 Oct 2015 15:08:51 +0200
Message-Id: <1444914533-27782-9-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This simplifies the code by factoring in the image footer
parsing into the single function parsing the AFSv1 partitions.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/afs.c | 98 ++++++++++++++++++++++---------------------------------
 1 file changed, 39 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index ace27f447abc..cdee8295d4c0 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -89,63 +89,6 @@ static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 }
 
 static int
-afs_read_footer_v1(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
-		   u_int off, u_int mask)
-{
-	struct footer_v1 fs;
-	u_int ptr = off + mtd->erasesize - sizeof(fs);
-	size_t sz;
-	int ret;
-
-	ret = mtd_read(mtd, ptr, sizeof(fs), &sz, (u_char *)&fs);
-	if (ret >= 0 && sz != sizeof(fs))
-		ret = -EINVAL;
-
-	if (ret < 0) {
-		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
-			ptr, ret);
-		return ret;
-	}
-
-	/*
-	 * Does it contain the magic number?
-	 */
-	if (fs.signature != AFSV1_FOOTER_MAGIC)
-		return 0;
-
-	/*
-	 * Check the checksum.
-	 */
-	if (word_sum(&fs, sizeof(fs) / sizeof(u32)) != 0xffffffff)
-		return 0;
-
-	/*
-	 * Don't touch the SIB.
-	 */
-	if (fs.type == 2)
-		return 0;
-
-	*iis_start = fs.image_info_base & mask;
-	*img_start = fs.image_start & mask;
-
-	/*
-	 * Check the image info base.  This can not
-	 * be located after the footer structure.
-	 */
-	if (*iis_start >= ptr)
-		return 0;
-
-	/*
-	 * Check the start of this image.  The image
-	 * data can not be located after this block.
-	 */
-	if (*img_start > off)
-		return 0;
-
-	return 1;
-}
-
-static int
 afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 {
 	size_t sz;
@@ -184,6 +127,7 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 static int afs_parse_v1_partition(struct mtd_info *mtd,
 				  u_int off, struct mtd_partition *part)
 {
+	struct footer_v1 fs;
 	struct image_info_v1 iis;
 	u_int mask;
 	/*
@@ -192,6 +136,8 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	 */
 	u_int uninitialized_var(iis_ptr);
 	u_int uninitialized_var(img_ptr);
+	u_int ptr;
+	size_t sz;
 	int ret;
 
 	/*
@@ -200,9 +146,43 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	 */
 	mask = mtd->size - 1;
 
-	ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
-	if (ret < 0)
+	ptr = off + mtd->erasesize - sizeof(fs);
+	ret = mtd_read(mtd, ptr, sizeof(fs), &sz, (u_char *)&fs);
+	if (ret >= 0 && sz != sizeof(fs))
+		ret = -EINVAL;
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       ptr, ret);
 		return ret;
+	}
+	/*
+	 * Check the checksum.
+	 */
+	if (word_sum(&fs, sizeof(fs) / sizeof(u32)) != 0xffffffff)
+		return -EINVAL;
+
+	/*
+	 * Hide the SIB (System Information Block)
+	 */
+	if (fs.type == 2)
+		return 0;
+
+	iis_ptr = fs.image_info_base & mask;
+	img_ptr = fs.image_start & mask;
+
+	/*
+	 * Check the image info base.  This can not
+	 * be located after the footer structure.
+	 */
+	if (iis_ptr >= ptr)
+		return 0;
+
+	/*
+	 * Check the start of this image.  The image
+	 * data can not be located after this block.
+	 */
+	if (img_ptr > off)
+		return 0;
 
 	/* Read the image info block */
 	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-- 
2.4.3
