Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q20v0-0006RC-HC
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 12:42:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2MCgaXR030507
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2011 14:42:36 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: check if we are in RO mode in the erase routine
Date: Tue, 22 Mar 2011 14:45:02 +0200
Message-Id: <1300797902-1899-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

'do_sync_erase()' has to check whether we are in R/O mode before
erasing the PEB. This patch adds the check and while on it, adds an
assertion which validates the 'pnum' argument, as well as removes
a check which is always true because it has already been done
few lines before.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index aaa6e1e..9342074 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -344,6 +344,12 @@ static int do_sync_erase(struct ubi_device *ubi, int pnum)
 	wait_queue_head_t wq;
 
 	dbg_io("erase PEB %d", pnum);
+	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
+
+	if (ubi->ro_mode) {
+		ubi_err("read-only mode");
+		return -EROFS;
+	}
 
 retry:
 	init_waitqueue_head(&wq);
@@ -390,7 +396,7 @@ retry:
 	if (err)
 		return err;
 
-	if (ubi_dbg_is_erase_failure() && !err) {
+	if (ubi_dbg_is_erase_failure()) {
 		dbg_err("cannot erase PEB %d (emulated)", pnum);
 		return -EIO;
 	}
-- 
1.7.2.3
