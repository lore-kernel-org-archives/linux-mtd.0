Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel27-00078J-4x
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:41 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/21] UBI: Fastmap: Add scrub support to add_aeb()
Date: Wed, 13 Jun 2012 12:42:05 +0200
Message-Id: <1339584138-69914-9-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 82a011d..1d3f724 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -47,9 +47,10 @@ out:
  * @list: the target list
  * @pnum: PEB number of the new attach erase block
  * @ec: erease counter of the new LEB
+ * @scrub: scrub this PEB after attaching
  */
 static int add_aeb(struct ubi_attach_info *ai, struct list_head *list,
-		   int pnum, int ec)
+		   int pnum, int ec, int scrub)
 {
 	struct ubi_ainf_peb *aeb;
 
@@ -64,7 +65,8 @@ static int add_aeb(struct ubi_attach_info *ai, struct list_head *list,
 	aeb->pnum = pnum;
 	aeb->ec = ec;
 	aeb->lnum = -1;
-	aeb->scrub = aeb->copy_flag = aeb->sqnum = 0;
+	aeb->scrub = scrub;
+	aeb->copy_flag = aeb->sqnum = 0;
 
 	ai->ec_sum += aeb->ec;
 	ai->ec_count++;
@@ -376,10 +378,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS) {
-			scrub = 1;
-			//TODO SCRUB!
-			add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec));
-
+			add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 1);
 			continue;
 		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
 			dbg_bld("Found non empty PEB:%i in pool", pnum);
@@ -530,7 +529,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			goto fail_bad;
 
 		add_aeb(ai, &ai->free, be32_to_cpu(fmec->pnum),
-			be32_to_cpu(fmec->ec));
+			be32_to_cpu(fmec->ec), 0);
 	}
 
 	/* read EC values from used list */
@@ -541,7 +540,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			goto fail_bad;
 
 		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
-			be32_to_cpu(fmec->ec));
+			be32_to_cpu(fmec->ec), 0);
 	}
 
 	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
-- 
1.7.6.5
