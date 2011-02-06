Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8Xb-0001xQ-Om
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:36:55 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p16Han8C014624
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2011 19:36:50 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] UBI: cleanup comments about corrupted PEBs
Date: Sun,  6 Feb 2011 19:39:12 +0200
Message-Id: <1297013953-28886-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
References: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Just make them a bit more readable and explanatory.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   54 ++++++++++++++++++++++++++++++-----------------
 1 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 0028bf2..b65cc08 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -39,32 +39,46 @@
  * eraseblocks are put to the @free list and the physical eraseblock to be
  * erased are put to the @erase list.
  *
+ * About corruptions
+ * ~~~~~~~~~~~~~~~~~
+ *
+ * UBI protects EC and VID headers with CRC-32 checksums, so it can detect
+ * whether the headers are corrupted or not. Sometimes UBI also protects the
+ * data with CRC-32, e.g., when it executes the atomic LEB change operation, or
+ * when it moves the contents of a PEB for wear-leveling purposes.
+ *
  * UBI tries to distinguish between 2 types of corruptions.
- * 1. Corruptions caused by power cuts. These are harmless and expected
- *    corruptions and UBI tries to handle them gracefully, without printing too
- *    many warnings and error messages. The idea is that we do not lose
- *    important data in these case - we may lose only the data which was being
- *    written to the media just before the power cut happened, and the upper
- *    layers (e.g., UBIFS) are supposed to handle these situations. UBI puts
- *    these PEBs to the head of the @erase list and they are scheduled for
- *    erasure.
+ *
+ * 1. Corruptions caused by power cuts. These are expected corruptions and UBI
+ * tries to handle them gracefully, without printing too many warnings and
+ * error messages. The idea is that we do not lose important data in these case
+ * - we may lose only the data which was being written to the media just before
+ * the power cut happened, and the upper layers (e.g., UBIFS) are supposed to
+ * handle such data losses (e.g., by using the FS journal).
+ *
+ * When UBI detects a corruption (CRC-32 mismatch) in a PEB, and it looks like
+ * the reason is a power cut, UBI puts this PEB to the @erase list, and all
+ * PEBs in the @erase list are scheduled for erasure later.
  *
  * 2. Unexpected corruptions which are not caused by power cuts. During
- *    scanning, such PEBs are put to the @corr list and UBI preserves them.
- *    Obviously, this lessens the amount of available PEBs, and if at some
- *    point UBI runs out of free PEBs, it switches to R/O mode. UBI also loudly
- *    informs about such PEBs every time the MTD device is attached.
+ * scanning, such PEBs are put to the @corr list and UBI preserves them.
+ * Obviously, this lessens the amount of available PEBs, and if at some  point
+ * UBI runs out of free PEBs, it switches to R/O mode. UBI also loudly informs
+ * about such PEBs every time the MTD device is attached.
  *
  * However, it is difficult to reliably distinguish between these types of
- * corruptions and UBI's strategy is as follows. UBI assumes (2.) if the VID
- * header is corrupted and the data area does not contain all 0xFFs, and there
- * were not bit-flips or integrity errors while reading the data area. Otherwise
- * UBI assumes (1.). The assumptions are:
- *   o if the data area contains only 0xFFs, there is no data, and it is safe
- *     to just erase this PEB.
- *   o if the data area has bit-flips and data integrity errors (ECC errors on
+ * corruptions and UBI's strategy is as follows. UBI assumes corruption type 2
+ * if the VID header is corrupted and the data area does not contain all 0xFFs,
+ * and there were no bit-flips or integrity errors while reading the data area.
+ * Otherwise UBI assumes corruption type 1. So the decision criteria are as
+ * follows.
+ *   o If the data area contains only 0xFFs, there is no data, and it is safe
+ *     to just erase this PEB - this is corruption type 1.
+ *   o If the data area has bit-flips or data integrity errors (ECC errors on
  *     NAND), it is probably a PEB which was being erased when power cut
- *     happened.
+ *     happened, so this is corruption type 1. However, this is just a guess,
+ *     which might be wrong.
+ *   o Otherwise this it corruption type 2.
  */
 
 #include <linux/err.h>
-- 
1.7.2.3
