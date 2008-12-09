Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA5nd-0000BM-SQ
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 16:51:06 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 3E72765449
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Dec 2008 16:51:01 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: fix "smal" typo
Date: Tue,  9 Dec 2008 11:51:00 -0500
Message-Id: <1228841460-3350-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.ubifs/mkfs.ubifs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index beadd43..e72b44c 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -339,7 +339,7 @@ static int validate_options(void)
 	if (c->leb_size < c->min_io_size)
 		return err_msg("min. I/O unit cannot be larger than LEB size");
 	if (c->leb_size < UBIFS_MIN_LEB_SZ)
-		return err_msg("too smal LEB size %d, minimum is %d",
+		return err_msg("too small LEB size %d, minimum is %d",
 			       c->min_io_size, UBIFS_MIN_LEB_SZ);
 	if (c->leb_size % c->min_io_size)
 		return err_msg("LEB should be multiple of min. I/O units");
-- 
1.6.0.4
