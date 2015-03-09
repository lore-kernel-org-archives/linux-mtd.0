Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUpHP-0008Lk-SM
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 04:27:01 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <adrian.hunter@intel.com>, <richard@nod.at>
Subject: [PATCH] ubifs: remove unused header files
Date: Mon, 9 Mar 2015 04:37:15 +0000
Message-ID: <1425875835-159577-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unused header files that are already inclued in "ubifs.h".

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/commit.c     | 1 -
 fs/ubifs/file.c       | 1 -
 fs/ubifs/gc.c         | 2 --
 fs/ubifs/io.c         | 1 -
 fs/ubifs/lpt.c        | 1 -
 fs/ubifs/lpt_commit.c | 1 -
 fs/ubifs/recovery.c   | 1 -
 fs/ubifs/sb.c         | 1 -
 fs/ubifs/super.c      | 1 -
 fs/ubifs/tnc.c        | 1 -
 fs/ubifs/xattr.c      | 2 --
 11 files changed, 13 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 26b69b2..63e76b0 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -45,7 +45,6 @@
 
 #include <linux/freezer.h>
 #include <linux/kthread.h>
-#include <linux/slab.h>
 #include "ubifs.h"
 
 /*
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e627c0a..a3bdaec 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -53,7 +53,6 @@
 #include <linux/aio.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
-#include <linux/slab.h>
 
 static int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 9718da8..bd43ee2 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -53,8 +53,6 @@
  * good, and GC takes extra care when moving them.
  */
 
-#include <linux/slab.h>
-#include <linux/pagemap.h>
 #include <linux/list_sort.h>
 #include "ubifs.h"
 
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index fb08b0c..07ab034 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -71,7 +71,6 @@
  */
 
 #include <linux/crc32.h>
-#include <linux/slab.h>
 #include "ubifs.h"
 
 /**
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 421bd0a..8c6b30d 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -46,7 +46,6 @@
 #include "ubifs.h"
 #include <linux/crc16.h>
 #include <linux/math64.h>
-#include <linux/slab.h>
 
 /**
  * do_calc_lpt_geom - calculate sizes for the LPT area.
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index d9c0292..ac0bffa 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -26,7 +26,6 @@
  */
 
 #include <linux/crc16.h>
-#include <linux/slab.h>
 #include <linux/random.h>
 #include "ubifs.h"
 
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c640938..1431820 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -48,7 +48,6 @@
  */
 
 #include <linux/crc32.h>
-#include <linux/slab.h>
 #include "ubifs.h"
 
 /**
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 79c6dbb..4192a3a 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -27,7 +27,6 @@
  */
 
 #include "ubifs.h"
-#include <linux/slab.h>
 #include <linux/random.h>
 #include <linux/math64.h>
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 93e9465..e264911 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/init.h>
-#include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/kthread.h>
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 6793db0..f469f10 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -31,7 +31,6 @@
  */
 
 #include <linux/crc32.h>
-#include <linux/slab.h>
 #include "ubifs.h"
 
 /*
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a92be24..b0267e9 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -56,8 +56,6 @@
  */
 
 #include "ubifs.h"
-#include <linux/fs.h>
-#include <linux/slab.h>
 #include <linux/xattr.h>
 #include <linux/posix_acl_xattr.h>
 
-- 
1.8.3.4
