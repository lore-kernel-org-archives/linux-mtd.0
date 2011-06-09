Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb7K-0002OU-9P
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:30 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wER028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 27/30] UBIFS: stop re-defining UBI operations
Date: Thu,  9 Jun 2011 12:05:07 +0300
Message-Id: <1307610310-28691-28-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Now when we use UBIFS helpers for all the I/O, we can remove the horrible hack
of re-defining UBI I/O functions.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    2 --
 fs/ubifs/debug.h |    7 -------
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index a159cfd..6502657 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -27,8 +27,6 @@
  * various local functions of those subsystems.
  */
 
-#define UBIFS_DBG_PRESERVE_UBI
-
 #include "ubifs.h"
 #include <linux/module.h>
 #include <linux/debugfs.h>
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index b0b005b..b5bc09d 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -305,13 +305,6 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head);
 int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
-#ifndef UBIFS_DBG_PRESERVE_UBI
-#define ubi_leb_write  dbg_leb_write
-#define ubi_leb_change dbg_leb_change
-#define ubi_leb_unmap  dbg_leb_unmap
-#define ubi_leb_map    dbg_leb_map
-#endif
-
 int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
 		  int offs, int len, int dtype);
 int dbg_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
-- 
1.7.2.3
