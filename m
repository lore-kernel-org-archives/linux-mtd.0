Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmiHn-0005ML-D2
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:09:39 +0000
Received: by lbcao8 with SMTP id ao8so68523099lbc.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 01/10] mtd: afs: rename structs and functions for v1
Date: Thu, 15 Oct 2015 15:08:44 +0200
Message-Id: <1444914533-27782-2-git-send-email-linus.walleij@linaro.org>
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

Since we're gonna add the v2 version of flash information
structure and we want to avoid confusion, rename the old
functions to *v1. Cut the word "structure" from the struct
name, it is pretty obvious that it is a struct already from
the keyword.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/afs.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 96a33e3f7b00..9af00528586f 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -34,7 +34,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 
-struct footer_struct {
+struct footer_v1 {
 	u32 image_info_base;	/* Address of first word of ImageFooter  */
 	u32 image_start;	/* Start of area reserved by this footer */
 	u32 signature;		/* 'Magic' number proves it's a footer   */
@@ -42,7 +42,7 @@ struct footer_struct {
 	u32 checksum;		/* Just this structure                   */
 };
 
-struct image_info_struct {
+struct image_info_v1 {
 	u32 bootFlags;		/* Boot flags, compression etc.          */
 	u32 imageNumber;	/* Unique number, selects for boot etc.  */
 	u32 loadAddress;	/* Address program should be loaded to   */
@@ -67,10 +67,10 @@ static u32 word_sum(void *words, int num)
 }
 
 static int
-afs_read_footer(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
-		u_int off, u_int mask)
+afs_read_footer_v1(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
+		   u_int off, u_int mask)
 {
-	struct footer_struct fs;
+	struct footer_v1 fs;
 	u_int ptr = off + mtd->erasesize - sizeof(fs);
 	size_t sz;
 	int ret;
@@ -126,7 +126,7 @@ afs_read_footer(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 }
 
 static int
-afs_read_iis(struct mtd_info *mtd, struct image_info_struct *iis, u_int ptr)
+afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 {
 	size_t sz;
 	int ret, i;
@@ -182,16 +182,16 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * the strings.
 	 */
 	for (idx = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
-		struct image_info_struct iis;
+		struct image_info_v1 iis;
 		u_int iis_ptr, img_ptr;
 
-		ret = afs_read_footer(mtd, &img_ptr, &iis_ptr, off, mask);
+		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
 		if (ret < 0)
 			break;
 		if (ret == 0)
 			continue;
 
-		ret = afs_read_iis(mtd, &iis, iis_ptr);
+		ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
 		if (ret < 0)
 			break;
 		if (ret == 0)
@@ -215,18 +215,18 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * Identify the partitions
 	 */
 	for (idx = off = 0; off < mtd->size; off += mtd->erasesize) {
-		struct image_info_struct iis;
+		struct image_info_v1 iis;
 		u_int iis_ptr, img_ptr;
 
 		/* Read the footer. */
-		ret = afs_read_footer(mtd, &img_ptr, &iis_ptr, off, mask);
+		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
 		if (ret < 0)
 			break;
 		if (ret == 0)
 			continue;
 
 		/* Read the image info block */
-		ret = afs_read_iis(mtd, &iis, iis_ptr);
+		ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
 		if (ret < 0)
 			break;
 		if (ret == 0)
-- 
2.4.3
