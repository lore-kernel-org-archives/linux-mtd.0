Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8Udj-0004Xz-24
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 09:07:23 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96wFs004018
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 12:07:09 +0300
Received: from eru.research.nokia.com (helruo-dhcp022226.ntc.nokia.com
	[172.21.22.226])
	by mgw-da02.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96apw014311
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 12:06:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] UBI: remember copy_flag while scanning
Date: Wed, 20 Oct 2010 12:07:14 +0300
Message-Id: <1287565636-18825-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

While scanning the flash we read all VID headers and store some important
information in 'struct ubi_scan_leb'. Store also the 'copy_flag' value there
as it is needed when comparing LEBs. We do not increase memory consumption
because this is just one bit and we have plenty of spare bits in
'struct ubi_scan_leb' (sizeof(struct ubi_scan_leb) is 48 both with and
without this patch).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   20 ++++++++++----------
 drivers/mtd/ubi/scan.h |    4 +++-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 30b7102..2fbb571 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -330,12 +330,18 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 			return 1;
 		}
 	} else {
-		pnum = seb->pnum;
+		if (!seb->copy_flag) {
+			/* It is not a copy, so it is newer */
+			dbg_bld("first PEB %d is newer, copy_flag is unset",
+				pnum);
+			return bitflips << 1;
+		}
 
 		vh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 		if (!vh)
 			return -ENOMEM;
 
+		pnum = seb->pnum;
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err) {
 			if (err == UBI_IO_BITFLIPS)
@@ -350,14 +356,6 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 			}
 		}
 
-		if (!vh->copy_flag) {
-			/* It is not a copy, so it is newer */
-			dbg_bld("first PEB %d is newer, copy_flag is unset",
-				pnum);
-			err = bitflips << 1;
-			goto out_free_vidh;
-		}
-
 		vid_hdr = vh;
 	}
 
@@ -516,6 +514,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 			seb->ec = ec;
 			seb->pnum = pnum;
 			seb->scrub = ((cmp_res & 2) || bitflips);
+			seb->copy_flag = vid_hdr->copy_flag;
 			seb->sqnum = sqnum;
 
 			if (sv->highest_lnum == lnum)
@@ -549,8 +548,9 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 	seb->ec = ec;
 	seb->pnum = pnum;
 	seb->lnum = lnum;
-	seb->sqnum = sqnum;
 	seb->scrub = bitflips;
+	seb->copy_flag = vid_hdr->copy_flag;
+	seb->sqnum = sqnum;
 
 	if (sv->highest_lnum <= lnum) {
 		sv->highest_lnum = lnum;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 12ac852..a3264f0 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -30,6 +30,7 @@
  * @pnum: physical eraseblock number
  * @lnum: logical eraseblock number
  * @scrub: if this physical eraseblock needs scrubbing
+ * @copy_flag: this LEB is a copy (@copy_flag is set in VID header of this LEB)
  * @sqnum: sequence number
  * @u: unions RB-tree or @list links
  * @u.rb: link in the per-volume RB-tree of &struct ubi_scan_leb objects
@@ -42,7 +43,8 @@ struct ubi_scan_leb {
 	int ec;
 	int pnum;
 	int lnum;
-	int scrub;
+	unsigned int scrub:1;
+	unsigned int copy_flag:1;
 	unsigned long long sqnum;
 	union {
 		struct rb_node rb;
-- 
1.7.2.3
