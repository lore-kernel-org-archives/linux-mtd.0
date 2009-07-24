Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MULkf-0003Z2-BZ
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 14:28:05 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n6OERDE2021295
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2009 09:27:46 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: compatible fallback in absense of sequence numbers
Date: Fri, 24 Jul 2009 19:18:51 +0300
Message-Id: <1248452331-18969-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Phil Carmody <ext-phil.2.carmody@nokia.com>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Adrian Hunter <Adrian.Hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Adrian Hunter <Adrian.Hunter@nokia.com>

Fall back onto thinking everything's OK if either of the sequence
numbers we are asked to compare is zero, which is what was used
before sequence numbers were introduced.

[ Artem: modified the patch to be applicable to upstream UBI, added
        big comment ]

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index be4994b..e7161ad 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -782,11 +782,22 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			return -EINVAL;
 		}
 
+		/*
+		 * Make sure that all PEBs have the same image sequence number.
+		 * This allows us to detect situations when users flash UBI
+		 * images incorrectly, so that the flash has the new UBI image
+		 * and leftovers from the old one. This feature was added
+		 * relatively recently, and the sequence number was always
+		 * zero, because old UBI implementations always set it to zero.
+		 * For this reasons, we do not panic if some PEBs have zero
+		 * sequence number, while other PEBs have non-zero sequence
+		 * number.
+		 */
 		image_seq = be32_to_cpu(ech->image_seq);
 		if (!si->image_seq_set) {
 			ubi->image_seq = image_seq;
 			si->image_seq_set = 1;
-		} else if (ubi->image_seq != image_seq) {
+		} else if (ubi->image_seq && ubi->image_seq != image_seq) {
 			ubi_err("bad image sequence number %d in PEB %d, "
 				"expected %d", image_seq, pnum, ubi->image_seq);
 			ubi_dbg_dump_ec_hdr(ech);
-- 
1.6.0.6
