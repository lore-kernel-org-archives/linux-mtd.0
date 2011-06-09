Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6y-0002NV-5N
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:10 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEL028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:06 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/30] UBIFS: remove unused and unneeded debugging function
Date: Thu,  9 Jun 2011 12:05:01 +0300
Message-Id: <1307610310-28691-22-git-send-email-dedekind1@gmail.com>
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

This patch contains several minor clean-up and preparational cahnges.

1. Remove 'dbg_read()', 'dbg_write()', 'dbg_change()', and 'dbg_leb_erase()'
   functions as they are not used.
2. Remove 'dbg_leb_read()' and 'dbg_is_mapped()' as they are not really needed,
   it is fine to let reads go through in failure mode.
3. Rename 'offset' argument to 'offs' to be consistent with the rest of UBIFS
   code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   33 ++-------------------------------
 fs/ubifs/debug.h |   27 +--------------------------
 2 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 741f939..a159cfd 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2718,16 +2718,8 @@ static void cut_data(const void *buf, int len)
 		p[i] = 0xff;
 }
 
-int dbg_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf, int offset,
-		 int len, int check)
-{
-	if (in_failure_mode(desc))
-		return -EROFS;
-	return ubi_leb_read(desc, lnum, buf, offset, len, check);
-}
-
 int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
-		  int offset, int len, int dtype)
+		  int offs, int len, int dtype)
 {
 	int err, failing;
 
@@ -2736,7 +2728,7 @@ int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
 	failing = do_fail(desc, lnum, 1);
 	if (failing)
 		cut_data(buf, len);
-	err = ubi_leb_write(desc, lnum, buf, offset, len, dtype);
+	err = ubi_leb_write(desc, lnum, buf, offs, len, dtype);
 	if (err)
 		return err;
 	if (failing)
@@ -2759,20 +2751,6 @@ int dbg_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
 	return 0;
 }
 
-int dbg_leb_erase(struct ubi_volume_desc *desc, int lnum)
-{
-	int err;
-
-	if (do_fail(desc, lnum, 0))
-		return -EROFS;
-	err = ubi_leb_erase(desc, lnum);
-	if (err)
-		return err;
-	if (do_fail(desc, lnum, 0))
-		return -EROFS;
-	return 0;
-}
-
 int dbg_leb_unmap(struct ubi_volume_desc *desc, int lnum)
 {
 	int err;
@@ -2787,13 +2765,6 @@ int dbg_leb_unmap(struct ubi_volume_desc *desc, int lnum)
 	return 0;
 }
 
-int dbg_is_mapped(struct ubi_volume_desc *desc, int lnum)
-{
-	if (in_failure_mode(desc))
-		return -EROFS;
-	return ubi_is_mapped(desc, lnum);
-}
-
 int dbg_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype)
 {
 	int err;
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 43ec5d1..e1dcfd2 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -302,44 +302,19 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head);
 int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
 #ifndef UBIFS_DBG_PRESERVE_UBI
-#define ubi_leb_read   dbg_leb_read
 #define ubi_leb_write  dbg_leb_write
 #define ubi_leb_change dbg_leb_change
-#define ubi_leb_erase  dbg_leb_erase
 #define ubi_leb_unmap  dbg_leb_unmap
-#define ubi_is_mapped  dbg_is_mapped
 #define ubi_leb_map    dbg_leb_map
 #endif
 
-int dbg_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf, int offset,
-		 int len, int check);
 int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
-		  int offset, int len, int dtype);
+		  int offs, int len, int dtype);
 int dbg_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
 		   int len, int dtype);
-int dbg_leb_erase(struct ubi_volume_desc *desc, int lnum);
 int dbg_leb_unmap(struct ubi_volume_desc *desc, int lnum);
-int dbg_is_mapped(struct ubi_volume_desc *desc, int lnum);
 int dbg_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype);
 
-static inline int dbg_read(struct ubi_volume_desc *desc, int lnum, char *buf,
-			   int offset, int len)
-{
-	return dbg_leb_read(desc, lnum, buf, offset, len, 0);
-}
-
-static inline int dbg_write(struct ubi_volume_desc *desc, int lnum,
-			    const void *buf, int offset, int len)
-{
-	return dbg_leb_write(desc, lnum, buf, offset, len, UBI_UNKNOWN);
-}
-
-static inline int dbg_change(struct ubi_volume_desc *desc, int lnum,
-				    const void *buf, int len)
-{
-	return dbg_leb_change(desc, lnum, buf, len, UBI_UNKNOWN);
-}
-
 /* Debugfs-related stuff */
 int dbg_debugfs_init(void);
 void dbg_debugfs_exit(void);
-- 
1.7.2.3
