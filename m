Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001gA-R9
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/23] UBI: Fastmap: Fix find_fastmap() logic.
Date: Fri,  1 Jun 2012 17:16:24 +0200
Message-Id: <1338563804-85990-4-git-send-email-richard@nod.at>
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

To grantee that we always use the newest fastmap we have to find
the fastmap super block with the highest sqnum.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   62 ++++++++++++++------------------------------
 1 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 75e067b..2326e5a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -595,58 +595,45 @@ fail:
  * ubi_find_fastmap - searches the first UBI_FM_MAX_START PEBs for the
  * fastmap super block.
  * @ubi: UBI device object
+ * @fm_start: Pointer where the fastmap suber block PEB number will be stored.
  *
- * TODO: clearly document return codes
+ * Returns:
+ *  - 0 on success: (fm_start contains suber block PEB number)
+ *  - < 0 on failure (fm_start is -1)
  */
 static int ubi_find_fastmap(struct ubi_device *ubi, int *fm_start)
 {
 	int i, ret;
 	struct ubi_vid_hdr *vhdr;
+	unsigned long long max_sqnum = 0, sqnum;
 
 	vhdr = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vhdr)
 		return -ENOMEM;
 
+	*fm_start = -1;
 	for (i = 0; i < UBI_FM_MAX_START; i++) {
 		ret = ubi_io_read_vid_hdr(ubi, i, vhdr, 0);
 		if (ret < 0)
-			break;
+			goto out;
 		else if (ret > 0)
 			continue;
 
 		if (be32_to_cpu(vhdr->vol_id) == UBI_FM_SB_VOLUME_ID) {
-			*fm_start = i;
-			/* TODO: fix globally: all UBI prints:
-			 *  a) do not need the '\n' at the end
-			 *  b) start with a small letter, because the macros
-			 *     add several prefixes.
-			 */
-			dbg_bld("Found fastmap super block at PEB %i\n", i);
-			ret = 0;
+			sqnum = be64_to_cpu(vhdr->sqnum);
+			dbg_bld("found a fastmap super block at PEB %i sqnum: %llu", i, sqnum);
 
-			break;
+			if (sqnum > max_sqnum) {
+				max_sqnum = sqnum;
+				*fm_start = i;
+			}
 		}
 	}
 
+	if (*fm_start > -1)
+		ret = 0;
+out:
 	ubi_free_vid_hdr(ubi, vhdr);
-
-	/* TODO: we can return:
-	 * < 0 - error
-	 * 0 - fastmap found
-	 * 0 - also if we did not find fastmap and the last
-	 *     'ubi_io_read_vid_hdr()' call returned 0. This was not
-	 *     tested with volumes which do not contain fastmap? We need to
-	 *     test this - we need to have a testcase for this in mtd-utils. I
-	 *     can create a branch there and we should agree on which tests are
-	 *     run before anything goes into the git repo.
-	 * > 0 - ignore?
-	 *
-	 * Please, make it instead:
-	 * return 0 - no errors
-	 * return < 0 - error
-	 * If FM not found, fm_start = -1
-	 * If FM found, fm_start is set properly
-	 */
 	return ret;
 }
 
@@ -668,19 +655,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	unsigned long long sqnum = 0;
 
 	ret = ubi_find_fastmap(ubi, &sb_pnum);
-	if (ret) {
-		if (ret > 0)
-			ret = UBI_NO_FASTMAP;
-
-		goto out;
-	}
-	/* TODO: then this will be:
-	 * if (ret)
-	 *         return ret;
-	 * if (sb_pnum == -1)
-	 *         return UBI_NO_FASTMAP;
-	 *
-	 * Much better, I think */
+	if (ret)
+		return ret;
+	if (sb_pnum == -1)
+		return UBI_NO_FASTMAP;
 
 	fmsb = kmalloc(sizeof(*fmsb), GFP_KERNEL);
 	if (!fmsb) {
-- 
1.7.6.5
