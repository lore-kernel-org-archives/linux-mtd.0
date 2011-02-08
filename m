Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmpOo-0003Uj-71
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 15:22:39 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p18FMY04016706
	for <linux-mtd@lists.infradead.org>; Tue, 8 Feb 2011 17:22:34 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: fix LEB number in printk
Date: Tue,  8 Feb 2011 17:25:00 +0200
Message-Id: <1297178700-8297-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a minor patch which fixes the LEB number we print when
corrupted empty space is found.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 6ecbc91..e2714f8 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -695,7 +695,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			ubifs_err("corrupt empty space LEB %d:%d, corruption "
 				  "starts at %d", lnum, offs, corruption);
 			/* Make sure we dump interesting non-0xFF data */
-			offs = corruption;
+			offs += corruption;
 			buf += corruption;
 			goto corrupted;
 		}
-- 
1.7.2.3
