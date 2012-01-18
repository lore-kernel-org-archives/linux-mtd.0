Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWsB-0003UP-P1
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:52:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] UBIFS: make the dbg_lock spinlock static
Date: Wed, 18 Jan 2012 16:54:14 +0200
Message-Id: <1326898454-1957-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1326898454-1957-1-git-send-email-dedekind1@gmail.com>
References: <1326898454-1957-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove the usage of the 'dbg_lock' spinlock from 'dbg_err()' and make
it static.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c |    2 +-
 fs/ubifs/debug.h |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 3050628..1934084 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -36,7 +36,7 @@
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
-DEFINE_SPINLOCK(dbg_lock);
+static DEFINE_SPINLOCK(dbg_lock);
 
 static const char *get_key_fmt(int fmt)
 {
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index ad1a6fe..9f71765 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -164,9 +164,7 @@ struct ubifs_global_debug_info {
 #define dbg_dump_stack() dump_stack()
 
 #define dbg_err(fmt, ...) do {                                                 \
-	spin_lock(&dbg_lock);                                                  \
 	ubifs_err(fmt, ##__VA_ARGS__);                                         \
-	spin_unlock(&dbg_lock);                                                \
 } while (0)
 
 #define ubifs_dbg_msg(type, fmt, ...) \
@@ -217,7 +215,6 @@ struct ubifs_global_debug_info {
 /* Additional recovery messages */
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
 
-extern spinlock_t dbg_lock;
 extern struct ubifs_global_debug_info ubifs_dbg;
 
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)
-- 
1.7.7.5
