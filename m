Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2lQs-0000Pi-D0
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 14:22:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2OEMaih031531
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 16:22:36 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: use GFP_NOFS properly
Date: Thu, 24 Mar 2011 16:25:16 +0200
Message-Id: <1300976717-396-1-git-send-email-dedekind1@gmail.com>
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

This patch fixes a brown-paperbag bug which was introduced by me:
I used incorrect "GFP_KERNEL | GFP_NOFS" allocation flags to make
sure my allocations do not cause write-back. But the correct form
is "GFP_NOFS".

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index aaa6e1e..eededf9 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1345,7 +1345,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 	if (!(ubi_chk_flags & UBI_CHK_IO))
 		return 0;
 
-	buf1 = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf1 = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
 	if (!buf1) {
 		ubi_err("cannot allocate memory to check writes");
 		return 0;
@@ -1409,7 +1409,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	if (!(ubi_chk_flags & UBI_CHK_IO))
 		return 0;
 
-	buf = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubi_err("cannot allocate memory to check for 0xFFs");
 		return 0;
-- 
1.7.2.3
