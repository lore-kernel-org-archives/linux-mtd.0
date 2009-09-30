Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MstK8-00046V-N4
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 07:10:09 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sven Luther <sven@powerlinux.fr>
Subject: [PATCH] UBI: fix backward compatibility
Date: Wed, 30 Sep 2009 10:09:20 +0300
Message-Id: <1254294560-6884-1-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 32bc4820287a1a03982979515949e8ea56eac641 did not fully fix
the backward compatibility issues. We still fail to properly handle
situations when the first PEB contains non-zero image sequence
number, but one of the following PEBs contains zero image sequence
number. For example, this may happen if we mount a new image with
an old kernel, and then try to mount it in the new kernel.

This patch should fix the issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |    7 +++----
 drivers/mtd/ubi/scan.h |    2 --
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index b847745..6db7ce5 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -793,16 +793,15 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		 * number.
 		 */
 		image_seq = be32_to_cpu(ech->image_seq);
-		if (!si->image_seq_set) {
+		if (!ubi->image_seq && image_seq)
 			ubi->image_seq = image_seq;
-			si->image_seq_set = 1;
-		} else if (ubi->image_seq && ubi->image_seq != image_seq) {
+		if (ubi->image_seq && image_seq &&
+		    ubi->image_seq != image_seq) {
 			ubi_err("bad image sequence number %d in PEB %d, "
 				"expected %d", image_seq, pnum, ubi->image_seq);
 			ubi_dbg_dump_ec_hdr(ech);
 			return -EINVAL;
 		}
-
 	}
 
 	/* OK, we've done with the EC header, let's look at the VID header */
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 1017cf1..61df208 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -102,7 +102,6 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
- * @image_seq_set: indicates @ubi->image_seq is known
  *
  * This data structure contains the result of scanning and may be used by other
  * UBI sub-systems to build final UBI data structures, further error-recovery
@@ -125,7 +124,6 @@ struct ubi_scan_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
-	int image_seq_set;
 };
 
 struct ubi_device;
-- 
1.6.2.5
