Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvT7-0008DP-2D
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:58 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 10/17] UBI: move the global ech and vidh variables into
 struct ubi_attach_info
Date: Mon,  5 Sep 2016 17:05:01 +0200
Message-Id: <1473087908-27862-11-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Even if it works fine with those global variables, attaching the
temporary ech and vidh objects used during UBI scan to the
ubi_attach_info object sounds like a more future-proof option.

For example, attaching several UBI devices in parallel is prevented by
this use of global variable. And also because global variables should
be avoided in general.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c | 39 +++++++++++++++++++--------------------
 drivers/mtd/ubi/ubi.h    |  4 ++++
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 82b30c959a28..507f5d6b6114 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -91,10 +91,6 @@
 
 static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
-/* Temporary variables used during scanning */
-static struct ubi_ec_hdr *ech;
-static struct ubi_vid_hdr *vidh;
-
 #define AV_FIND		BIT(0)
 #define AV_ADD		BIT(1)
 #define AV_FIND_OR_ADD	(AV_FIND | AV_ADD)
@@ -958,6 +954,8 @@ static bool vol_ignored(int vol_id)
 static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		    int pnum, bool fast)
 {
+	struct ubi_ec_hdr *ech = ai->ech;
+	struct ubi_vid_hdr *vidh = ai->vidh;
 	long long ec;
 	int err, bitflips = 0, vol_id = -1, ec_err = 0;
 
@@ -1394,12 +1392,12 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 	err = -ENOMEM;
 
-	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
-	if (!ech)
+	ai->ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+	if (!ai->ech)
 		return err;
 
-	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
-	if (!vidh)
+	ai->vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
+	if (!ai->vidh)
 		goto out_ech;
 
 	for (pnum = start; pnum < ubi->peb_count; pnum++) {
@@ -1448,15 +1446,15 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (err)
 		goto out_vidh;
 
-	ubi_free_vid_hdr(ubi, vidh);
-	kfree(ech);
+	ubi_free_vid_hdr(ubi, ai->vidh);
+	kfree(ai->ech);
 
 	return 0;
 
 out_vidh:
-	ubi_free_vid_hdr(ubi, vidh);
+	ubi_free_vid_hdr(ubi, ai->vidh);
 out_ech:
-	kfree(ech);
+	kfree(ai->ech);
 	return err;
 }
 
@@ -1508,12 +1506,12 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	if (!scan_ai)
 		goto out;
 
-	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
-	if (!ech)
+	scan_ai->ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+	if (!scan_ai->ech)
 		goto out_ai;
 
-	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
-	if (!vidh)
+	scan_ai->vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
+	if (!scan_ai->vidh)
 		goto out_ech;
 
 	for (pnum = 0; pnum < UBI_FM_MAX_START; pnum++) {
@@ -1525,8 +1523,8 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 			goto out_vidh;
 	}
 
-	ubi_free_vid_hdr(ubi, vidh);
-	kfree(ech);
+	ubi_free_vid_hdr(ubi, scan_ai->vidh);
+	kfree(scan_ai->ech);
 
 	if (scan_ai->force_full_scan)
 		err = UBI_NO_FASTMAP;
@@ -1546,9 +1544,9 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	return err;
 
 out_vidh:
-	ubi_free_vid_hdr(ubi, vidh);
+	ubi_free_vid_hdr(ubi, scan_ai->vidh);
 out_ech:
-	kfree(ech);
+	kfree(scan_ai->ech);
 out_ai:
 	destroy_ai(scan_ai);
 out:
@@ -1670,6 +1668,7 @@ out_ai:
  */
 static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
+	struct ubi_vid_hdr *vidh = ai->vidh;
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *av;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f22c6c2e980f..b51d398f2356 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -724,6 +724,8 @@ struct ubi_ainf_volume {
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
  * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
+ * @ech: temporary EC header. Only available during scan
+ * @vidh: temporary VID header. Only available during scan
  *
  * This data structure contains the result of attaching an MTD device and may
  * be used by other UBI sub-systems to build final UBI data structures, further
@@ -752,6 +754,8 @@ struct ubi_attach_info {
 	uint64_t ec_sum;
 	int ec_count;
 	struct kmem_cache *aeb_slab_cache;
+	struct ubi_ec_hdr *ech;
+	struct ubi_vid_hdr *vidh;
 };
 
 /**
-- 
2.7.4
