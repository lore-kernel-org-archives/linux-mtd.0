Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTbD-0001k0-48
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 23/23] UBI: Fastmap: Make checkpatch.pl happy (again)
Date: Fri,  1 Jun 2012 17:16:44 +0200
Message-Id: <1338563804-85990-24-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
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
 drivers/mtd/ubi/fastmap.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 90bcaf0..a8143da 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -570,12 +570,15 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			}
 
 			/* This can happen if a PEB is already in an EBA known
-			 * by this fastmap but the PEB itself is not in the used list.
-			 * In this case the PEB can be within the fastmap pool or
-			 * while writing the fastmap it was in the protected queue.
+			 * by this fastmap but the PEB itself is not in the used
+			 * list.
+			 * In this case the PEB can be within the fastmap pool
+			 * or while writing the fastmap it was in the protection
+			 * queue.
 			 */
 			if (!aeb) {
-				aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+				aeb = kmem_cache_alloc(ai->aeb_slab_cache,
+					GFP_KERNEL);
 				if (!aeb) {
 					ret = -ENOMEM;
 
@@ -610,7 +613,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			goto fail;
 		}
 
-		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
+		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans,
+			u.list) {
 			int err;
 
 			if (ubi_io_is_bad(ubi, tmp_aeb->pnum)) {
@@ -693,7 +697,8 @@ static int ubi_find_fastmap(struct ubi_device *ubi, int *fm_start)
 
 		if (be32_to_cpu(vhdr->vol_id) == UBI_FM_SB_VOLUME_ID) {
 			sqnum = be64_to_cpu(vhdr->sqnum);
-			dbg_bld("found a fastmap super block at PEB %i sqnum: %llu", i, sqnum);
+			dbg_bld("found a fastmap super block at PEB %i " \
+				"sqnum: %llu", i, sqnum);
 
 			if (sqnum > max_sqnum) {
 				max_sqnum = sqnum;
@@ -1229,7 +1234,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				ubi_err("unable to read EC header");
 				kfree(ec_hdr);
 
-				goto err;;
+				goto err;
 			}
 
 			ret = ubi_io_sync_erase(ubi, old_fm->e[0]->pnum,
-- 
1.7.6.5
