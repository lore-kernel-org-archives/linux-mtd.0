Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1zJl-0004P1-Gv
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:45:58 +0000
Received: by mail-pd0-f169.google.com with SMTP id g10so10297849pdj.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2014 07:45:36 -0700 (PDT)
From: Seunghun Lee <waydi1@gmail.com>
To: dedekind1@gmail.com,
	adrian.hunter@intel.com
Subject: [PATCH] UBIFS: fix some comments
Date: Tue,  1 Jul 2014 23:45:25 +0900
Message-Id: <1404225925-3347-1-git-send-email-waydi1@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, Seunghun Lee <waydi1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes some comments about return type.

Signed-off-by: Seunghun Lee <waydi1@gmail.com>
---
 fs/ubifs/recovery.c |    4 ++--
 fs/ubifs/scan.c     |    5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c14adb2..933dda5 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -629,8 +629,8 @@ static void drop_last_node(struct ubifs_scan_leb *sleb, int *offs)
  *
  * This function does a scan of a LEB, but caters for errors that might have
  * been caused by the unclean unmount from which we are attempting to recover.
- * Returns %0 in case of success, %-EUCLEAN if an unrecoverable corruption is
- * found, and a negative error code in case of failure.
+ * Returns the scaned information on success and a negative error code on
+ * failure.
  */
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 					 int offs, void *sbuf, int jhead)
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 58aa05d..327d84a 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -131,7 +131,8 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
  * @offs: offset to start at (usually zero)
  * @sbuf: scan buffer (must be c->leb_size)
  *
- * This function returns %0 on success and a negative error code on failure.
+ * This function returns the scaned information on success and a negative error
+ * code on failure.
  */
 struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 					int offs, void *sbuf)
@@ -169,8 +170,6 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
  * @sleb: scanning information
  * @lnum: logical eraseblock number
  * @offs: offset to start at (usually zero)
- *
- * This function returns %0 on success and a negative error code on failure.
  */
 void ubifs_end_scan(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		    int lnum, int offs)
-- 
1.7.9.5
