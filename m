Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWs9-0003U3-Mr
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:52:22 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] UBIFS: amend recovery debugging message
Date: Wed, 18 Jan 2012 16:54:12 +0200
Message-Id: <1326898454-1957-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Print LEB and offset as well.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/recovery.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index ee4f43f..2a935b3 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -679,7 +679,8 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			   ret == SCANNED_GARBAGE     ||
 			   ret == SCANNED_A_BAD_PAD_NODE ||
 			   ret == SCANNED_A_CORRUPT_NODE) {
-			dbg_rcvry("found corruption - %d", ret);
+			dbg_rcvry("found corruption (%d) at %d:%d",
+				  ret, lnum, offs);
 			break;
 		} else {
 			dbg_err("unexpected return value %d", ret);
-- 
1.7.7.5
