Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2F-0007CE-62
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/21] UBI: Fastmap: make checkpatch.pl happy Signed-off-by:
 Richard Weinberger <richard@nod.at>
Date: Wed, 13 Jun 2012 12:42:18 +0200
Message-Id: <1339584138-69914-22-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |   10 ++++++----
 drivers/mtd/ubi/wl.c      |    3 ++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ecc313d..8b033e5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -402,12 +402,13 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS) {
+			unsigned long long ec = be64_to_cpu(ech->ec);
 			unmap_peb(ai, pnum);
 			dbg_bld("Adding PEB to free: %i", pnum);
 			if (err == UBI_IO_FF_BITFLIPS)
-				add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 1);
+				add_aeb(ai, &ai->free, pnum, ec, 1);
 			else
-				add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 0);
+				add_aeb(ai, &ai->free, pnum, ec, 0);
 			continue;
 		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
 			dbg_bld("Found non empty PEB:%i in pool", pnum);
@@ -575,7 +576,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
 			     be32_to_cpu(fmvhdr->used_ebs),
 			     be32_to_cpu(fmvhdr->data_pad),
-			     fmvhdr->vol_type, be32_to_cpu(fmvhdr->last_eb_bytes));
+			     fmvhdr->vol_type,
+			     be32_to_cpu(fmvhdr->last_eb_bytes));
 
 		if (!av)
 			goto fail_bad;
@@ -688,7 +690,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
 		list_del(&tmp_aeb->u.list);
-		dbg_bld("adding PEB from used to erase list: %i", tmp_aeb->pnum);
+		dbg_bld("moving PEB from used to erase: %i", tmp_aeb->pnum);
 		add_aeb(ai, &ai->erase, tmp_aeb->pnum, tmp_aeb->ec, 0);
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index c4d8273..a64cd83 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -827,7 +827,8 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
  *
  * see: ubi_wl_put_peb()
  */
-int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e, int torture)
+int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
+    int torture)
 {
 	struct ubi_wl_entry *e;
 	int pnum = used_e->pnum;
-- 
1.7.6.5
