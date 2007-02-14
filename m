Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HHG5H-0000sG-4x
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 09:05:51 +0000
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: fix typo and wrong comments
Date: Wed, 14 Feb 2007 18:05:46 +0900
Message-ID: <005101c75017$52f55c30$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's some fix of typo and wrong comments.

Thank you,
Kyungmin Park

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
index c433ded..5142baf 100644
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
index d657cf6..5dc9951 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -643,7 +643,7 @@ static struct ubi_vol_tbl_record *process_lvol(const
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
