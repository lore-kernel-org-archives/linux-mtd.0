Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3NQW-0005j5-6C
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 08:33:36 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] ubifs: make debug messages more silent
Date: Mon, 20 Aug 2012 10:33:22 +0200
Message-Id: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With pr_debug being used instead of printk(KERN_DEBUG ...) the messages
don't make it into the bootlog without further actions. This saves 32
lines of ubifs messages for me that are not needed most of the time on a
system with / on ubifs.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 fs/ubifs/debug.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 8b8cc4e..39828f2 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -176,7 +176,7 @@ struct ubifs_global_debug_info {
 
 /* Just a debugging messages not related to any specific UBIFS subsystem */
 #define dbg_msg(fmt, ...)                                                      \
-	printk(KERN_DEBUG "UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,   \
+	pr_debug("UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,   \
 	       __func__, ##__VA_ARGS__)
 
 /* General messages */
-- 
1.7.10.4
