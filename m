Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXXG-00026r-5J
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 12:52:43 +0000
Received: by mail-wi0-f176.google.com with SMTP id cb5so769322wib.15
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 05:52:20 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: fastmap: fix backward compatibility with image_seq
Date: Fri, 27 Sep 2013 14:51:55 +0200
Message-Id: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some old UBI implementations (e.g. U-Boot) have not implemented the image
sequence feature.
So, when erase blocks are written, the image sequence in the ec header
is lost (set to zero).
UBI scan_all() takes this case into account (commits
32bc4820287a1a03982979515949e8ea56eac641 and
2eadaad67b2b6bd132eda105128d2d466298b8e3)

But fastmap scan functions (ubi_scan_fastmap() and scan_pool()) didn't.

This patch fixes the issue.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/fastmap.c |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 9b42add..05067f5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -407,6 +407,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	 */
 	for (i = 0; i < pool_size; i++) {
 		int scrub = 0;
+		int image_seq;
 
 		pnum = be32_to_cpu(pebs[i]);
 
@@ -425,7 +426,13 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		} else if (ret == UBI_IO_BITFLIPS)
 			scrub = 1;
 
-		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
+		/*
+		 * Older UBI implementations have image_seq set to zero, so
+		 * we shouldn't fail if image_seq == 0.
+		 */
+		image_seq = be32_to_cpu(ech->image_seq);
+
+		if (image_seq && (image_seq != ubi->image_seq)) {
 			ubi_err("bad image seq: 0x%x, expected: 0x%x",
 				be32_to_cpu(ech->image_seq), ubi->image_seq);
 			ret = UBI_BAD_FASTMAP;
@@ -923,6 +930,8 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	}
 
 	for (i = 0; i < used_blocks; i++) {
+		int image_seq;
+
 		pnum = be32_to_cpu(fmsb->block_loc[i]);
 
 		if (ubi_io_is_bad(ubi, pnum)) {
@@ -940,10 +949,17 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		} else if (ret == UBI_IO_BITFLIPS)
 			fm->to_be_tortured[i] = 1;
 
+		image_seq = be32_to_cpu(ech->image_seq);
 		if (!ubi->image_seq)
-			ubi->image_seq = be32_to_cpu(ech->image_seq);
+			ubi->image_seq = image_seq;
 
-		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
+		/*
+		 * Older UBI implementations have image_seq set to zero, so
+		 * we shouldn't fail if image_seq == 0.
+		 */
+		if (image_seq && (image_seq != ubi->image_seq)) {
+			ubi_err("wrong image seq:%d instead of %d",
+				be32_to_cpu(ech->image_seq), ubi->image_seq);
 			ret = UBI_BAD_FASTMAP;
 			goto free_hdr;
 		}
-- 
1.7.10.4
