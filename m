Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel25-00077X-Jv
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/21] UBI: Fastmap: Rewrite scan_pool()
Date: Wed, 13 Jun 2012 12:42:02 +0200
Message-Id: <1339584138-69914-6-git-send-email-richard@nod.at>
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

Rewrite scan_pool() and make sure that free PEBs are added
to the free list.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   51 +++++++++++++++++++-------------------------
 1 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 97d694f..a82a604 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -349,6 +349,8 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	 * after the creation of the fastmap
 	 */
 	for (i = 0; i < pool_size; i++) {
+		int scrub = 0;
+
 		pnum = be32_to_cpu(pebs[i]);
 
 		if (ubi_io_is_bad(ubi, pnum)) {
@@ -358,42 +360,33 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			goto out;
 		}
 
+		err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
+		if (err && err != UBI_IO_BITFLIPS) {
+			dbg_bld("unable to read EC header!");
+			ret = err > 0 ? UBI_BAD_FASTMAP : err;
+			goto out;
+		} else if (ret == UBI_IO_BITFLIPS)
+			scrub = 1;
+
+		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
+			dbg_bld("image seq mismatch!");
+			err = UBI_BAD_FASTMAP;
+			goto out;
+		}
+
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
+		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS) {
+			scrub = 1;
+			//TODO SCRUB!
+			add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec));
 
-		/* TODO: so here again - calling the function and checking what
-		 * it returns I consider to be one logical block which should
-		 * not contain newlines inbetween. You are inconsistent about
-		 * this and in some places you have a newline, in some you
-		 * don't. Could we please remove them globally in cases like
-		 * this?
-		 * Again my disclaimer: sorry, I hope this is not too annoying
-		 * for you. */
-		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS)
 			continue;
-		else if (err == 0 || err == UBI_IO_BITFLIPS) {
-			int scrub = 0;
-
-			ubi_msg("Found non empty PEB:%i in pool", pnum);
+		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
+			dbg_bld("Found non empty PEB:%i in pool", pnum);
 
 			if (err == UBI_IO_BITFLIPS)
 				scrub = 1;
 
-			err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
-			if (err && err != UBI_IO_BITFLIPS) {
-				dbg_bld("unable to read EC header!");
-				ret = err > 0 ? UBI_BAD_FASTMAP : err;
-
-				goto out;
-			} else if (ret == UBI_IO_BITFLIPS)
-				scrub = 1;
-
-			if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
-				dbg_bld("image seq mismatch!");
-				err = UBI_BAD_FASTMAP;
-
-				goto out;
-			}
-
 			found_orphan = 0;
 			list_for_each_entry(tmp_aeb, eba_orphans, u.list) {
 				if (tmp_aeb->pnum == pnum) {
-- 
1.7.6.5
