Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkfm9-0008U5-JL
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:46:23 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: fix debugging messages
Date: Tue, 10 Jan 2012 19:48:41 +0200
Message-Id: <1326217722-20707-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Patch 56e46742e846e4de167dde0e1e1071ace1c882a5 broke UBIFS debugging messages:
before that commit when UBIFS debugging was enabled, users saw few useful
debugging messages after mount. However, that patch turned 'dbg_msg()' into
'pr_debug()', so to enable the debugging messages users have to enable them
first via /sys/kernel/debug/dynamic_debug/control, which is very impractical.

This commit makes 'dbg_msg()' to use 'printk()' instead of 'pr_debug()', just
as it was before the breakage.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org [3.0+]
---
 fs/ubifs/debug.h |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 8d9c468..d36fe4e 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -190,7 +190,13 @@ extern spinlock_t dbg_lock;
 } while (0)
 
 /* Just a debugging messages not related to any specific UBIFS subsystem */
-#define dbg_msg(fmt, ...)   ubifs_dbg_msg("msg", fmt, ##__VA_ARGS__)
+#define dbg_msg(fmt, ...) do {                                                \
+	spin_lock(&dbg_lock);                                                 \
+	printk(KERN_DEBUG "UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,  \
+	       __func__, ##__VA_ARGS__);                                      \
+	spin_unlock(&dbg_lock);                                               \
+} while (0)
+
 /* General messages */
 #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARGS__)
 /* Additional journal messages */
-- 
1.7.6.5
