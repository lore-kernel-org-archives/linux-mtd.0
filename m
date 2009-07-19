Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSTPJ-0004Dy-PB
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 10:14:18 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n6JAE4U5012426
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jul 2009 05:14:05 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: print a message if ECH is corrupted and VIDH is ok
Date: Sun, 19 Jul 2009 15:05:54 +0300
Message-Id: <1248005156-18662-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

If the EC header is corrupted, but the VID header is OK, UBI accepts the
PEB and treats it as "used". However, generally this should not happen.
Print a warning if this happens.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index a423131..44c8273 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -853,7 +853,9 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		}
 	}
 
-	/* Both UBI headers seem to be fine */
+	if (ec_corr)
+		ubi_warn("valid VID header but corrupted EC header at PEB %d",
+			 pnum);
 	err = ubi_scan_add_used(ubi, si, pnum, ec, vidh, bitflips);
 	if (err)
 		return err;
-- 
1.6.0.6
