From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <005101c75017$52f55c30$c7a3580a@swcenter.sec.samsung.co.kr>
	<1171448182.8593.2.camel@sauron>
Subject: RE: [PATCH] UBI: fix typo and wrong comments
Date: Thu, 15 Feb 2007 10:05:30 +0900
Message-ID: <001e01c7509d$6970dbc0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1171448182.8593.2.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 116743c0db0bfaac73d1d5b302a67bbb2231f8a1 Mon Sep 17 00:00:00 2001
From: Kyungmin Park <kyungmin.park@samsung.com>
Date: Thu, 15 Feb 2007 10:00:42 +0900
Subject: [PATCH] UBI: fix typo & wrong comments

fix typo & wrong comments

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/ubi/gluebi.c |    3 +--
 drivers/mtd/ubi/scan.c   |    2 +-
 drivers/mtd/ubi/uif.c    |    2 +-
 drivers/mtd/ubi/vtbl.c   |    2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 63def5d..d396c59 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -168,8 +168,7 @@ static int gluebi_get_device(struct mtd_info *mtd)
  *
  * @mtd: the MTD device description object
  *
- * This function is called every time the MTD device is being put. Returns
- * zero in case of success and a negative error code in case of failure.
+ * This function is called every time the MTD device is being put.
  */
 static void gluebi_put_device(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index c695b81..9e77a3a 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -767,7 +767,7 @@ static struct ubi_scan_volume  *add_volume(const struct
ubi_info *ubi,
  *     o bit 1 is cleared: no bit-flips were detected in the newer PEB;
  *     o bit 1 is set: bit-flips were detected in the newer PEB;
  *     o bit 2 is cleared: the older PEB is not corrupted;
- *     o bit 2 is set: the older PEB is not corrupted.
+ *     o bit 2 is set: the older PEB is corrupted.
  */
 static int compare_lebs(const struct ubi_info *ubi,
 			const struct ubi_scan_leb *seb, int pnum,
diff --git a/drivers/mtd/ubi/uif.c b/drivers/mtd/ubi/uif.c
index bdce784..65b6865 100644
--- a/drivers/mtd/ubi/uif.c
+++ b/drivers/mtd/ubi/uif.c
@@ -508,7 +508,7 @@ int ubi_eraseblock_unmap(struct ubi_vol_desc *udesc,
int lnum)
 	const struct ubi_info *ubi = desc->vol->ubi;
 	int err, vol_id = desc->vol->vol_id;
 
-	dbg_uif("erase LEB %d:%d", vol_id, lnum);
+	dbg_uif("unmap LEB %d:%d", vol_id, lnum);
 	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
 	ubi_assert(!IS_ERR(vtr));
 
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index ac48c7d..9d9d98d 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -645,7 +645,7 @@ static struct ubi_vol_tbl_record *process_lvol(const
struct ubi_info *ubi,
 	 * recent information.
 	 *
 	 * So the plan is to first check LEB 0. Then
-	 * a. if LEB 0 is OK, it contains the most resent data; then we
+	 * a. if LEB 0 is OK, it contains the most recent data; then we
 	 * compare its contents with LEB 1, and if they are different, we
copy
 	 * LEB 0 to LEB 1.
 	 * b. if LEB 0 is corrupted, but LEB 1 is OK, we copy LEB 1 to LEB
0.
-- 
1.4.4.2
> 
