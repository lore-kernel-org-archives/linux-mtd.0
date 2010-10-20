Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8Uda-0004X5-7Y
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 09:07:13 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96uRT030672
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 04:07:02 -0500
Received: from eru.research.nokia.com (helruo-dhcp022226.ntc.nokia.com
	[172.21.22.226])
	by mgw-da02.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96aq0014311
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 12:06:38 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] UBI: tighten the corrupted PEB criteria
Date: Wed, 20 Oct 2010 12:07:16 +0300
Message-Id: <1287565636-18825-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1287565636-18825-1-git-send-email-dedekind1@gmail.com>
References: <1287565636-18825-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

If we get a bit-flip of ECC error while reading the data area, do not add it to
corrupted list, because it is possible that this is just unstable PEB with
corruptions caused by unclean reboots.

This patch also improves commentaries.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   41 ++++++++++++++++++++++++++++++++---------
 1 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index e7b800b..c1191b7 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -45,14 +45,26 @@
  *    many warnings and error messages. The idea is that we do not lose
  *    important data in these case - we may lose only the data which was being
  *    written to the media just before the power cut happened, and the upper
- *    layers are supposed to handle these situations. UBI puts these PEBs to
- *    the head of the @erase list and they are scheduled for erasure.
+ *    layers (e.g., UBIFS) are supposed to handle these situations. UBI puts
+ *    these PEBs to the head of the @erase list and they are scheduled for
+ *    erasure.
  *
  * 2. Unexpected corruptions which are not caused by power cuts. During
  *    scanning, such PEBs are put to the @corr list and UBI preserves them.
  *    Obviously, this lessens the amount of available PEBs, and if at some
  *    point UBI runs out of free PEBs, it switches to R/O mode. UBI also loudly
  *    informs about such PEBs every time the MTD device is attached.
+ *
+ * However, it is difficult to reliably distinguish between these types of
+ * corruptions and UBI's strategy is as follows. UBI assumes (2.) if the VID
+ * header is corrupted and the data area does not contain all 0xFFs, and there
+ * were not bit-flips or integrity errors while reading the data area. Otherwise
+ * UBI assumes (1.). The assumptions are:
+ *   o if the data area contains only 0xFFs, there is no data, and it is safe
+ *     to just erase this PEB.
+ *   o if the data area has bit-flips and data integrity errors (ECC errors on
+ *     NAND), it is probably a PEB which was being erased when power cut
+ *     happened.
  */
 
 #include <linux/err.h>
@@ -741,23 +753,23 @@ struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 }
 
 /**
- * check_data_ff - make sure PEB contains only 0xFF data.
+ * check_corruption - check the data area of PEB.
  * @ubi: UBI device description object
  * @vid_hrd: the (corrupted) VID header of this PEB
  * @pnum: the physical eraseblock number to check
  *
  * This is a helper function which is used to distinguish between VID header
  * corruptions caused by power cuts and other reasons. If the PEB contains only
- * 0xFF bytes at the data area, the VID header is most probably corrupted
+ * 0xFF bytes in the data area, the VID header is most probably corrupted
  * because of a power cut (%0 is returned in this case). Otherwise, it was
- * corrupted for some other reasons (%1 is returned in this case). A negative
- * error code is returned if a read error occurred.
+ * probably corrupted for some other reasons (%1 is returned in this case). A
+ * negative error code is returned if a read error occurred.
  *
  * If the corruption reason was a power cut, UBI can safely erase this PEB.
  * Otherwise, it should preserve it to avoid possibly destroying important
  * information.
  */
-static int check_data_ff(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
+static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 			 int pnum)
 {
 	int err;
@@ -767,7 +779,18 @@ static int check_data_ff(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 
 	err = ubi_io_read(ubi, ubi->peb_buf1, pnum, ubi->leb_start,
 			  ubi->leb_size);
-	if (err && err != UBI_IO_BITFLIPS && err != -EBADMSG)
+	if (err == UBI_IO_BITFLIPS || err == -EBADMSG) {
+		/*
+		 * Bit-flips or integrity errors while reading the data area.
+		 * It is difficult to say for sure what type of corruption is
+		 * this, but presumably a power cut happened while this PEB was
+		 * erased, so it became unstable and corrupted, and should be
+		 * erased.
+		 */
+		return 0;
+	}
+
+	if (err)
 		return err;
 
 	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size)) {
@@ -926,7 +949,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * that this a valid UBI PEB which has corresponding
 			 * LEB, but the headers are corrupted. However, it is
 			 * impossible to distinguish it from a PEB which just
-			 * contains garbage because a power cut during erase
+			 * contains garbage because of a power cut during erase
 			 * operation. So we just schedule this PEB for erasure.
 			 */
 			err = 0;
-- 
1.7.2.3
