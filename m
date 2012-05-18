Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxf-0005Vd-IP
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:09 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/22] UBI: amend comments after renaming in scan.c
Date: Fri, 18 May 2012 14:03:47 +0300
Message-Id: <1337339045-8199-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

Now some commentaries are out-of-date, after we re-named the data
structures - amend them.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.h |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index d32f183..9ba00c8 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -25,7 +25,7 @@
 #define UBI_SCAN_UNKNOWN_EC (-1)
 
 /**
- * struct ubi_ainf_peb - scanning information about a physical eraseblock.
+ * struct ubi_ainf_peb - attach information about a physical eraseblock.
  * @ec: erase counter (%UBI_SCAN_UNKNOWN_EC if it is unknown)
  * @pnum: physical eraseblock number
  * @lnum: logical eraseblock number
@@ -36,8 +36,8 @@
  * @u.rb: link in the per-volume RB-tree of &struct ubi_ainf_peb objects
  * @u.list: link in one of the eraseblock lists
  *
- * One object of this type is allocated for each physical eraseblock during
- * scanning.
+ * One object of this type is allocated for each physical eraseblock when
+ * attaching an MTD device.
  */
 struct ubi_ainf_peb {
 	int ec;
@@ -53,7 +53,7 @@ struct ubi_ainf_peb {
 };
 
 /**
- * struct ubi_ainf_volume - scanning information about a volume.
+ * struct ubi_ainf_volume - attaching information about a volume.
  * @vol_id: volume ID
  * @highest_lnum: highest logical eraseblock number in this volume
  * @leb_count: number of logical eraseblocks in this volume
@@ -70,7 +70,8 @@ struct ubi_ainf_peb {
  * @root: root of the RB-tree containing all the eraseblock belonging to this
  *        volume (&struct ubi_ainf_peb objects)
  *
- * One object of this type is allocated for each volume during scanning.
+ * One object of this type is allocated for each volume when attaching an MTD
+ * device.
  */
 struct ubi_ainf_volume {
 	int vol_id;
@@ -86,7 +87,7 @@ struct ubi_ainf_volume {
 };
 
 /**
- * struct ubi_attach_info - UBI scanning information.
+ * struct ubi_attach_info - MTD device attaching information.
  * @volumes: root of the volume RB-tree
  * @corr: list of corrupted physical eraseblocks
  * @free: list of free physical eraseblocks
@@ -100,7 +101,7 @@ struct ubi_ainf_volume {
  * @bad_peb_count: count of bad physical eraseblocks
  * @maybe_bad_peb_count: count of bad physical eraseblocks which are not marked
  *                       as bad yet, but which look like bad
- * @vols_found: number of volumes found during scanning
+ * @vols_found: number of volumes found
  * @highest_vol_id: highest volume ID
  * @is_empty: flag indicating whether the MTD device is empty or not
  * @min_ec: lowest erase counter value
@@ -111,9 +112,9 @@ struct ubi_ainf_volume {
  * @ec_count: a temporary variable used when calculating @mean_ec
  * @scan_leb_slab: slab cache for &struct ubi_ainf_peb objects
  *
- * This data structure contains the result of scanning and may be used by other
- * UBI sub-systems to build final UBI data structures, further error-recovery
- * and so on.
+ * This data structure contains the result of attaching an MTD device and may
+ * be used by other UBI sub-systems to build final UBI data structures, further
+ * error-recovery and so on.
  */
 struct ubi_attach_info {
 	struct rb_root volumes;
-- 
1.7.10
