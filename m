Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aungQ-000542-UF
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 21:04:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: ezequiel@vanguardiasur.com.ar, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] UBI: Fix static volume checks when Fastmap is used
Date: Mon, 25 Apr 2016 23:04:05 +0200
Message-Id: <1461618245-11202-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel reported that he's facing UBI going into read-only
mode after power cut. It turned out that this behavior happens
only when updating a static volume is interrupted and Fastmap is
used.

UBI checks static volumes for data consistency and reads the
whole volume upon first open. If the volume is found erroneous
users of UBI cannot read from it, but another volume update is
possible to fix it. The check is performed by running
ubi_eba_read_leb() on every allocated LEB of the volume.
For static volumes ubi_eba_read_leb() computes the checksum of all
data stored in a LEB. To verify the computed checksum it has to read
the LEB's volume header which stores the original checksum.
If the volume header is not found UBI treats this as fatal internal
error and switches to RO mode. If the UBI device was attached via a
full scan the assumption is correct, the volume header has to be
present as it had to be there while scanning to get known as mapped.
If the attach operation happened via Fastmap the assumption is no
longer correct. When attaching via Fastmap UBI learns the mapping
table from Fastmap's snapshot of the system state and not via a full
scan. It can happen that a LEB got unmapped after a Fastmap was
written to the flash. Then UBI can learn the LEB still as mapped and
accessing it returns only 0xFF bytes. As UBI is not a FTL it is
allowed to have mappings to empty PEBs, it assumes that the layer
above takes care of LEB accounting and referencing.
UBIFS does so using the LEB property tree (LPT).
For static volumes UBI blindly assumes that all LEBs are present and
therefore special actions have to be taken.

The described situation can happen when updating a static volume is
interrupted, either by a user or a power cut.
The volume update code first unmaps all LEBs of a volume and then
writes LEB by LEB. If the sequence of operations is interrupted UBI
detects this either by the absence of LEBs, no volume header present
at scan time, or corrupted payload, detected via checksum.
In the Fastmap case the former method won't trigger as no scan
happened and UBI automatically thinks all LEBs are present.
Only by reading data from a LEB it detects that the volume header is
missing and incorrectly treats this as fatal error.
To deal with the situation ubi_eba_read_leb() from now on checks
whether we attached via Fastmap and handles the absence of a
volume header like a data corruption error.
This way interrupted static volume updates will correctly get detected
also when Fastmap is used.

Cc: stable@vger.kernel.org
Reported-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c     | 21 +++++++++++++++++++--
 drivers/mtd/ubi/fastmap.c |  1 +
 drivers/mtd/ubi/ubi.h     |  2 ++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 5b9834c..96fddb0 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -426,8 +426,25 @@ retry:
 						 pnum, vol_id, lnum);
 					err = -EBADMSG;
 				} else {
-					err = -EINVAL;
-					ubi_ro_mode(ubi);
+					/*
+					 * Ending up here in the non-Fastmap case
+					 * is a clear bug as the VID header had to
+					 * be present at scan time to have it referenced.
+					 * With fastmap the story is more complicated.
+					 * Fastmap has the mapping info without the need
+					 * of a full scan. So the LEB could have been
+					 * unmapped, Fastmap cannot know this and keeps
+					 * the LEB referenced.
+					 * This is valid and works as the layer above UBI
+					 * has to do bookkeeping about used/referenced
+					 * LEBs in any case.
+					 */
+					if (ubi->fast_attach) {
+						err = -EBADMSG;
+					} else {
+						err = -EINVAL;
+						ubi_ro_mode(ubi);
+					}
 				}
 			}
 			goto out_free;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 263b439..990898b 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1058,6 +1058,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	ubi_msg(ubi, "fastmap WL pool size: %d",
 		ubi->fm_wl_pool.max_size);
 	ubi->fm_disabled = 0;
+	ubi->fast_attach = 1;
 
 	ubi_free_vid_hdr(ubi, vh);
 	kfree(ech);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index dadc6a9..61d4e99 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -466,6 +466,7 @@ struct ubi_debug_info {
  * @fm_eba_sem: allows ubi_update_fastmap() to block EBA table changes
  * @fm_work: fastmap work queue
  * @fm_work_scheduled: non-zero if fastmap work was scheduled
+ * @fast_attach: non-zero if UBI was attached by fastmap
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -574,6 +575,7 @@ struct ubi_device {
 	size_t fm_size;
 	struct work_struct fm_work;
 	int fm_work_scheduled;
+	int fast_attach;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
-- 
2.7.3
