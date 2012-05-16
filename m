Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhot-0002SA-5e
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:15:29 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] UBIFS: remove a couple of unused macros
Date: Wed, 16 May 2012 20:16:24 +0300
Message-Id: <1337188586-32293-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
References: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.h |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index f898369..b34aeff 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -331,9 +331,6 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 		ubifs_err(fmt, ##__VA_ARGS__);     \
 } while (0)
 
-#define DBGKEY(key)  ((char *)(key))
-#define DBGKEY1(key) ((char *)(key))
-
 #define ubifs_dbg_msg(fmt, ...) do {                        \
 	if (0)                                              \
 		printk(KERN_DEBUG fmt "\n", ##__VA_ARGS__); \
-- 
1.7.10
