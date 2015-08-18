Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRYz4-0006f1-Td
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 04:58:51 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] mkfs.ubifs: remove the check for UBIFS_MAX_LEB_SZ
Date: Tue, 18 Aug 2015 12:52:35 +0800
Message-ID: <1439873555-5352-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a commit 92ed6c0 to increase UBIFS_MAX_LEB_SZ
to 2MiB. But recently, as the leb size become larger and
larger, 2MiB is not a suitable limit any more.

Then remove this check in mkfs.ubifs

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
NOTE:
	I am not sure the reason why we have to
limit the leb size in mkfs.ubifs. Because
I did not find any reason for it, I send
this patch out. It's very possible I am
mising something.

 mkfs.ubifs/mkfs.ubifs.c | 3 ---
 mkfs.ubifs/ubifs.h      | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ca17e2b..8ea0e4c 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -356,9 +356,6 @@ static int validate_options(void)
 		return err_msg("LEB should be multiple of min. I/O units");
 	if (c->leb_size % 8)
 		return err_msg("LEB size has to be multiple of 8");
-	if (c->leb_size > UBIFS_MAX_LEB_SZ)
-		return err_msg("too large LEB size %d, maximum is %d",
-				c->leb_size, UBIFS_MAX_LEB_SZ);
 	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
 		return err_msg("too low max. count of LEBs, minimum is %d",
 			       UBIFS_MIN_LEB_CNT);
diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 434b651..f94a52c 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -25,9 +25,6 @@
 #ifndef __UBIFS_H__
 #define __UBIFS_H__
 
-/* Maximum logical eraseblock size in bytes */
-#define UBIFS_MAX_LEB_SZ (2*1024*1024)
-
 /* Minimum amount of data UBIFS writes to the flash */
 #define MIN_WRITE_SZ (UBIFS_DATA_NODE_SZ + 8)
 
-- 
1.8.4.2
