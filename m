Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004u6-Ni
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:25:01 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 05/14] ubi: fastmap: Implement PEB translation
Date: Wed, 13 Jun 2018 23:23:35 +0200
Message-Id: <20180613212344.11608-6-richard@nod.at>
In-Reply-To: <20180613212344.11608-1-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a fastmap is preseeded we have to translate PEB numbers because
during the creation of the fastmap the creation tool cannot know
which blocks are bad on the target(s).

Therefore fastmap has to learn all bad blocks during attach and
changes PEB numbers accordingly.
This feature assumes that bad blocks are skipped while the image was
flashed, what nandwrite does by default.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |  1 +
 drivers/mtd/ubi/fastmap.c | 74 +++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/ubi.h     |  2 ++
 3 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4f27d5..9a8072cf458c 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1370,6 +1370,7 @@ static void destroy_ai(struct ubi_attach_info *ai)
 	}
 
 	kmem_cache_destroy(ai->aeb_slab_cache);
+	kfree(ai->bb_trans);
 	kfree(ai);
 }
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1ebb5d15ab1a..279d02874297 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -107,6 +107,9 @@ static bool read_pnum(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	int ret = true;
 	int max_pnum = ubi->peb_count;
 
+	if (ai->bb_trans)
+		max_pnum -= ai->bad_peb_count;
+
 	pnum = be32_to_cpu(pnum);
 	if (pnum == UBI_UNKNOWN) {
 		*out_pnum = pnum;
@@ -117,10 +120,13 @@ static bool read_pnum(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		ubi_err(ubi, "fastmap references PEB out of range: %i", pnum);
 		ret = false;
 		goto out;
-	} else {
-		*out_pnum = pnum;
 	}
 
+	if (!ai->bb_trans)
+		*out_pnum = pnum;
+	else
+		*out_pnum = ai->bb_trans[pnum];
+
 out:
 	return ret;
 }
@@ -880,6 +886,61 @@ static struct ubi_ainf_peb *clone_aeb(struct ubi_attach_info *ai,
 	return new;
 }
 
+/*
+ * build_bb_trans_table - create a translation table to fix PEB numbers.
+ * @ubi: UBI device object
+ * @ai: UBI attach info object
+ *
+ * A preseeded Fastmap has no knowledge of bad blocks. During first attach
+ * UBI has to update PEB numbers to leave out existing bad blocks.
+ */
+static int build_bb_trans_table(struct ubi_device *ubi,
+				struct ubi_attach_info *ai)
+{
+	int pnum, new_pnum, ret;
+	unsigned long *claimed_blocks;
+
+	ret = -ENOMEM;
+	claimed_blocks = kcalloc(BITS_TO_LONGS(ubi->peb_count),
+			       sizeof(unsigned long), GFP_KERNEL);
+	if (!claimed_blocks)
+		goto out;
+
+	/* ai->bb_trans will get free'ed via destroy_ai() */
+	ai->bb_trans = kcalloc(ubi->peb_count, sizeof(int), GFP_KERNEL);
+	if (!ai->bb_trans)
+		goto out;
+
+	/* Find all bad blocks and mark them as claimed */
+	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
+		ret = ubi_io_is_bad(ubi, pnum);
+		if (ret < 0)
+			goto out;
+
+		if (ret == 1) {
+			set_bit(pnum, claimed_blocks);
+			ai->bad_peb_count++;
+		}
+	}
+
+	/*
+	 * Start with PEB 0 and try to place each PEB around all bad blocks
+	 * to create the translation table.
+	 */
+	for (pnum = 0; pnum < ubi->peb_count - ai->bad_peb_count; pnum++) {
+		ubi_assert(!bitmap_full(claimed_blocks, ubi->peb_count));
+
+		new_pnum = find_first_zero_bit(claimed_blocks, ubi->peb_count);
+		ai->bb_trans[pnum] = new_pnum;
+		set_bit(new_pnum, claimed_blocks);
+	}
+
+out:
+	kfree(claimed_blocks);
+
+	return ret;
+}
+
 /**
  * ubi_scan_fastmap - scan the fastmap.
  * @ubi: UBI device object
@@ -987,6 +1048,15 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		goto free_fm_sb;
 	}
 
+	if (fm->flags & UBI_FM_SB_PRESEEDED_FLG) {
+		ubi_msg(ubi, "preseeded fastmap found");
+		ret = build_bb_trans_table(ubi, ai);
+		if (ret) {
+			ubi_err(ubi, "failed to construct bb translation table");
+			goto free_fm_sb;
+		}
+	}
+
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech) {
 		ret = -ENOMEM;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 4fab3790733b..28af5115d180 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -760,6 +760,7 @@ struct ubi_ainf_volume {
  * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
  * @ech: temporary EC header. Only available during scan
  * @vidh: temporary VID buffer. Only available during scan
+ * @bb_trans: bad block translation table, used by fastmap, NULL otherwise
  *
  * This data structure contains the result of attaching an MTD device and may
  * be used by other UBI sub-systems to build final UBI data structures, further
@@ -790,6 +791,7 @@ struct ubi_attach_info {
 	struct kmem_cache *aeb_slab_cache;
 	struct ubi_ec_hdr *ech;
 	struct ubi_vid_io_buf *vidb;
+	int *bb_trans;
 };
 
 /**
-- 
2.13.6
