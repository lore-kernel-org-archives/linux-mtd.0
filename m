Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZwfV-0007Y2-MW
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 06:16:31 +0000
Message-ID: <534CCE74.9090306@huawei.com>
Date: Tue, 15 Apr 2014 14:15:16 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <adrian.hunter@intel.com>
Subject: [PATCH] ubifs: atomically set inode->i_flags in
 ubifs_set_inode_flags()
References: <1397465159-45836-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1397465159-45836-1-git-send-email-zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use set_mask_bits() to atomically set i_flags instead of clearing out the
S_IMMUTABLE, S_APPEND, etc. flags and then setting them from the
UBIFS_IMMUTABLE, UBIFS_APPEND_FL, etc. flags, since this opens up a race
where an immutable file has the immutable flag cleared for a brief
window of time.

Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
---
 fs/ubifs/ioctl.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 648b143..5d6df97 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -27,6 +27,7 @@
 #include <linux/compat.h>
 #include <linux/mount.h>
 #include "ubifs.h"
+#include <linux/bitops.h>

 /**
  * ubifs_set_inode_flags - set VFS inode flags.
@@ -37,16 +38,18 @@
 void ubifs_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = ubifs_inode(inode)->flags;
+	unsigned int new_fl = 0;

-	inode->i_flags &= ~(S_SYNC | S_APPEND | S_IMMUTABLE | S_DIRSYNC);
 	if (flags & UBIFS_SYNC_FL)
-		inode->i_flags |= S_SYNC;
+		new_fl |= S_SYNC;
 	if (flags & UBIFS_APPEND_FL)
-		inode->i_flags |= S_APPEND;
+		new_fl |= S_APPEND;
 	if (flags & UBIFS_IMMUTABLE_FL)
-		inode->i_flags |= S_IMMUTABLE;
+		new_fl |= S_IMMUTABLE;
 	if (flags & UBIFS_DIRSYNC_FL)
-		inode->i_flags |= S_DIRSYNC;
+		new_fl |= S_DIRSYNC;
+	set_mask_bits(&inode->i_flags,
+			S_SYNC|S_APPEND|S_IMMUTABLE|S_DIRSYNC, new_fl);
 }

 /*
-- 
1.8.5.5


.
