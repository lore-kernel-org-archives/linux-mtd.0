Received: from mail-lb0-f172.google.com ([209.85.217.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmiHz-0005O4-OM
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:09:49 +0000
Received: by lbbwb3 with SMTP id wb3so6357365lbb.1
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 07/10] mtd: factor out v1 partition parsing
Date: Thu, 15 Oct 2015 15:08:50 +0200
Message-Id: <1444914533-27782-8-git-send-email-linus.walleij@linaro.org>
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

This breaks out the parsing of v1 partitions so we can later add
a v2 partition parser.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/afs.c | 88 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 2307f54195f5..ace27f447abc 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -181,14 +181,18 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 	return ret;
 }
 
-static int parse_afs_partitions(struct mtd_info *mtd,
-				struct mtd_partition **pparts,
-				struct mtd_part_parser_data *data)
+static int afs_parse_v1_partition(struct mtd_info *mtd,
+				  u_int off, struct mtd_partition *part)
 {
-	struct mtd_partition *parts;
-	u_int mask, off, sz;
-	int ret = 0;
-	int i;
+	struct image_info_v1 iis;
+	u_int mask;
+	/*
+	 * Static checks cannot see that we bail out if we have an error
+	 * reading the footer.
+	 */
+	u_int uninitialized_var(iis_ptr);
+	u_int uninitialized_var(img_ptr);
+	int ret;
 
 	/*
 	 * This is the address mask; we use this to mask off out of
@@ -196,6 +200,39 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 */
 	mask = mtd->size - 1;
 
+	ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
+	if (ret < 0)
+		return ret;
+
+	/* Read the image info block */
+	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
+	if (ret < 0)
+		return ret;
+
+	part->name = kstrdup(iis.name, GFP_KERNEL);
+	if (!part->name)
+		return -ENOMEM;
+
+	part->size = (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
+	part->offset = img_ptr;
+	part->mask_flags = 0;
+
+	printk("  mtd: at 0x%08x, %5lluKiB, %8u, %s\n",
+	       img_ptr, part->size / 1024,
+	       iis.imageNumber, part->name);
+
+	return 0;
+}
+
+static int parse_afs_partitions(struct mtd_info *mtd,
+				struct mtd_partition **pparts,
+				struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	u_int off, sz;
+	int ret = 0;
+	int i;
+
 	/* Count the partitions by looping over all erase blocks */
 	for (i = off = sz = 0; off < mtd->size; off += mtd->erasesize) {
 		if (afs_is_v1(mtd, off)) {
@@ -215,38 +252,13 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	 * Identify the partitions
 	 */
 	for (i = off = 0; off < mtd->size; off += mtd->erasesize) {
-		struct image_info_v1 iis;
-		u_int iis_ptr, img_ptr;
-
-		/* Read the footer. */
-		ret = afs_read_footer_v1(mtd, &img_ptr, &iis_ptr, off, mask);
-		if (ret < 0)
-			goto out_free_parts;
-		if (ret == 0)
-			continue;
-
-		/* Read the image info block */
-		ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-		if (ret < 0)
-			goto out_free_parts;
-		if (ret == 0)
-			continue;
-
-		parts[i].name = kstrdup(iis.name, GFP_KERNEL);
-		if (!parts[i].name) {
-			ret = -ENOMEM;
-			goto out_free_parts;
-		}
 
-		parts[i].size		= (iis.length + mtd->erasesize - 1) & ~(mtd->erasesize - 1);
-		parts[i].offset	= img_ptr;
-		parts[i].mask_flags	= 0;
-
-		printk("  mtd%d: at 0x%08x, %5lluKiB, %8u, %s\n",
-			i, img_ptr, parts[i].size / 1024,
-			iis.imageNumber, parts[i].name);
-
-		i += 1;
+		if (afs_is_v1(mtd, off)) {
+			ret = afs_parse_v1_partition(mtd, off, &parts[i]);
+			if (ret)
+				goto out_free_parts;
+			i++;
+		}
 	}
 
 	*pparts = parts;
-- 
2.4.3
