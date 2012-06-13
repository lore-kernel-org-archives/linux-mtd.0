Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2E-0007Bx-Fj
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 20/21] UBI: Fastmap: Torture fastmap PEBs that showed bit flips
Date: Wed, 13 Jun 2012 12:42:17 +0200
Message-Id: <1339584138-69914-21-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |    8 +++++-
 drivers/mtd/ubi/fastmap.c |   46 ++++++++++++++++++++++++++++----------------
 drivers/mtd/ubi/ubi.h     |    5 ++-
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 2a0c1ba..4c6b97b 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1371,8 +1371,12 @@ void ubi_destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 	/* Return all PEBs back to the WL sub-system */
 	if (ai->fm) {
-		while(ai->fm->used_blocks--)
-			ubi_wl_put_fm_peb(ubi, ai->fm->e[ai->fm->used_blocks], 0);
+		int i, torture;
+
+		for (i = 0; i < ai->fm->used_blocks; i++) {
+			torture = ai->fm->to_be_tortured[i];
+			ubi_wl_put_fm_peb(ubi, ai->fm->e[i], torture);
+		}
 
 		kfree(ai->fm);
 	}
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 8b09c29..ecc313d 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -713,7 +713,7 @@ fail:
  */
 static int ubi_find_fastmap(struct ubi_device *ubi, int *fm_start)
 {
-	int i, ret;
+	int i, ret = -ENOENT;
 	struct ubi_vid_hdr *vhdr;
 	unsigned long long max_sqnum = 0, sqnum;
 
@@ -772,8 +772,8 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	struct ubi_fm_sb *fmsb;
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
-	int ret, i, used_blocks, pnum, sb_pnum = 0;
-	void *fm_raw;
+	int i, used_blocks, pnum, sb_pnum = 0, ret = 0;
+	void *fm_raw = NULL;
 	size_t fm_size;
 	__be32 crc, tmp_crc;
 	unsigned long long sqnum = 0;
@@ -790,15 +790,20 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto out;
 	}
 
-	/* TODO: If 'ubi_io_read()' returns you UBI_IO_BITFLIP, this means that
-	 * the PEB has a bit-flip and has to be scrubbed. How will the
-	 * superblock be scrubbed or how is the bit-flip guaranteed to be taken
-	 * care of? */
+	ai->fm = kzalloc(sizeof(*ai->fm), GFP_KERNEL);
+	if (!ai->fm) {
+		ret = -ENOMEM;
+		kfree(fmsb);
+		goto free_raw;
+	}
+
 	ret = ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fmsb));
 	if (ret && ret != UBI_IO_BITFLIPS) {
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto out;
-	}
+	} else if (ret == UBI_IO_BITFLIPS)
+		ai->fm->to_be_tortured[0] = 1;
 
 	if (be32_to_cpu(fmsb->magic) != UBI_FM_SB_MAGIC) {
 		/* TODO: not urgent, but examine all the error messages and
@@ -811,6 +816,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_err("super block magic does not match");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto out;
 	}
 
@@ -818,6 +824,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_err("unknown fastmap format version!");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto out;
 	}
 
@@ -826,6 +833,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_err("number of fastmap blocks is invalid");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto out;
 	}
 
@@ -835,6 +843,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!fm_raw) {
 		ret = -ENOMEM;
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto out;
 	}
 
@@ -842,6 +851,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!ech) {
 		ret = -ENOMEM;
 		kfree(fmsb);
+		kfree(ai->fm);
 		goto free_raw;
 	}
 
@@ -849,6 +859,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!vh) {
 		ret = -ENOMEM;
 		kfree(fmsb);
+		kfree(ai->fm);
 		kfree(ech);
 		goto free_raw;
 	}
@@ -858,6 +869,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 		if (ubi_io_is_bad(ubi, pnum)) {
 			ret = UBI_BAD_FASTMAP;
+			kfree(ai->fm);
 			kfree(fmsb);
 			goto free_hdr;
 		}
@@ -869,8 +881,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
+			kfree(ai->fm);
 			goto free_hdr;
-		}
+		} else if (ret == UBI_IO_BITFLIPS)
+			ai->fm->to_be_tortured[i] = 1;
 
 		if (!ubi->image_seq)
 			ubi->image_seq = be32_to_cpu(ech->image_seq);
@@ -878,6 +892,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
 			ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
+			kfree(ai->fm);
 			goto free_hdr;
 		}
 
@@ -886,6 +901,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
 			kfree(fmsb);
+			kfree(ai->fm);
 			goto free_hdr;
 		}
 
@@ -893,7 +909,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (be32_to_cpu(vh->vol_id) != UBI_FM_SB_VOLUME_ID) {
 				ret = UBI_BAD_FASTMAP;
 				kfree(fmsb);
-
+				kfree(ai->fm);
 				goto free_hdr;
 			}
 		} else {
@@ -913,6 +929,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
 			kfree(fmsb);
+			kfree(ai->fm);
 			goto free_hdr;
 		}
 	}
@@ -926,7 +943,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (crc != tmp_crc) {
 		ubi_err("fastmap data CRC is invalid");
 		ret = UBI_BAD_FASTMAP;
-
+		kfree(ai->fm);
 		goto free_hdr;
 	}
 
@@ -936,12 +953,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (ret) {
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
-		goto free_hdr;
-	}
-
-	ai->fm = kzalloc(sizeof(*ai->fm), GFP_KERNEL);
-	if (!ai->fm) {
-		ret = -ENOMEM;
+		kfree(ai->fm);
 		goto free_hdr;
 	}
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index ccd0da7..ba6bfd1 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -214,13 +214,14 @@ struct ubi_volume_desc;
 
 /**
  * struct ubi_fastmap_layout - in-memory fastmap data structure.
- * @peb: PEBs used by the current fastmap
- * @ec: the erase counter of each used PEB
+ * @e: PEBs used by the current fastmap
+ * @to_be_tortured: if non-zero tortured this PEB
  * @size: size of the fastmap in bytes
  * @used_blocks: number of used PEBs
  */
 struct ubi_fastmap_layout {
 	struct ubi_wl_entry *e[UBI_FM_MAX_BLOCKS];
+	int to_be_tortured[UBI_FM_MAX_BLOCKS];
 	size_t size;
 	int used_blocks;
 };
-- 
1.7.6.5
