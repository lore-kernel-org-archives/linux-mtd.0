Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RkfmA-0008UQ-63
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:46:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: fix debugging messages
Date: Tue, 10 Jan 2012 19:48:42 +0200
Message-Id: <1326217722-20707-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1326217722-20707-1-git-send-email-dedekind1@gmail.com>
References: <1326217722-20707-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Patch ab50ff684707031ed4bad2fdd313208ae392e5bb broke UBI debugging messages:
before that commit when UBI debugging was enabled, users saw few useful
debugging messages after attaching an MTD device. However, that patch turned
'dbg_msg()' into 'pr_debug()', so to enable the debugging messages users have
to enable them first via /sys/kernel/debug/dynamic_debug/control, which is
very impractical.

This commit makes 'dbg_msg()' to use 'printk()' instead of 'pr_debug()', just
as it was before the breakage.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org [3.0+]
---
 drivers/mtd/ubi/debug.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 64fbb00..ead2cd1 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -43,7 +43,10 @@
 	pr_debug("UBI DBG " type ": " fmt "\n", ##__VA_ARGS__)
 
 /* Just a debugging messages not related to any specific UBI subsystem */
-#define dbg_msg(fmt, ...) ubi_dbg_msg("msg", fmt, ##__VA_ARGS__)
+#define dbg_msg(fmt, ...)                                    \
+	printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n", \
+	       current->pid, __func__, ##__VA_ARGS__)
+
 /* General debugging messages */
 #define dbg_gen(fmt, ...) ubi_dbg_msg("gen", fmt, ##__VA_ARGS__)
 /* Messages from the eraseblock association sub-system */
-- 
1.7.6.5
