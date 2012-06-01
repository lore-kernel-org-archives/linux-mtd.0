Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb9-0001jE-HJ
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/23] UBI: Fastmap: Handle bitflipps correctly
Date: Fri,  1 Jun 2012 17:16:39 +0200
Message-Id: <1338563804-85990-19-git-send-email-richard@nod.at>
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

Do not treat UBI_IO_BITFLIPS and UBI_FF_BITFLIPS as errors.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   37 ++++++++++++++++++++-----------------
 1 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index a0919ec..9edc6a1 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -226,6 +226,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			aeb->ec = new_aeb->ec;
 			aeb->pnum = new_aeb->pnum;
 			aeb->copy_flag = new_vh->copy_flag;
+			aeb->scrub = new_aeb->scrub;
 			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 
 		/* new_aeb is older */
@@ -352,16 +353,24 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 
-		if (err == UBI_IO_FF)
+		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS)
 			continue;
-		else if (err == 0) {
+		else if (err == 0 || err == UBI_IO_BITFLIPS) {
+			int scrub = 0;
+
+			ubi_msg("Found non empty PEB:%i in pool", pnum);
+
+			if (err == UBI_IO_BITFLIPS)
+				scrub = 1;
+
 			err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
-			if (err) {
+			if (err && err != UBI_IO_BITFLIPS) {
 				dbg_bld("unable to read EC header!");
 				ret = err > 0 ? UBI_BAD_FASTMAP : err;
 
 				goto out;
-			}
+			} else if (ret == UBI_IO_BITFLIPS)
+				scrub = 1;
 
 			if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
 				dbg_bld("image seq mismatch!");
@@ -383,7 +392,10 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			new_aeb->lnum = be32_to_cpu(vh->lnum);
 			new_aeb->sqnum = be64_to_cpu(vh->sqnum);
 			new_aeb->copy_flag = vh->copy_flag;
-			new_aeb->scrub = 0;
+			new_aeb->scrub = scrub;
+
+			if (*max_sqnum < new_aeb->sqnum)
+				*max_sqnum = new_aeb->sqnum;
 
 			err = process_pool_aeb(ubi, ai, vh, new_aeb);
 			if (err) {
@@ -391,9 +403,6 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 				goto out;
 			}
-
-			if (*max_sqnum < new_aeb->sqnum)
-				*max_sqnum = new_aeb->sqnum;
 		} else {
 			/* We are paranoid and fall back to scanning mode */
 			ubi_err("fastmap pool PEBs contains damaged PEBs!");
@@ -661,13 +670,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	ret = ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fmsb));
-	if (ret) {
-		ubi_err("unable to read fastmap super block");
-		/* TODO: please, read what 'ubi_io_read()' returns.
-		 * This code is incorrect. All return codes are carefully
-		 * documented there. And do it globally, I see you ignore the
-		 * bitflips error code and treat it as error everywhere.
-		 * Please, start testing with UBI bit-flips emulation enabled */
+	if (ret && ret != UBI_IO_BITFLIPS) {
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
 
@@ -740,7 +743,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		}
 
 		ret = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
-		if (ret) {
+		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err("unable to read fastmap block# %i EC (PEB: %i)",
 				i, pnum);
 			if (ret > 0)
@@ -1149,7 +1152,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			ret = ubi_io_read_ec_hdr(ubi, old_fm->e[0]->pnum,
 				ec_hdr, 0);
-			if (ret) {
+			if (ret && ret != UBI_IO_BITFLIPS) {
 				ubi_err("unable to read EC header");
 				kfree(ec_hdr);
 
-- 
1.7.6.5
