Received: from nautica.notk.org ([91.121.71.147])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RmD1j-0000Gp-EY
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 23:28:48 +0000
From: Dominique Martinet <asmadeus@codewreck.org>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] fs/ubifs: fix dbg_{jnlk, tnck,
 mntk} not defined in debug.h if debug is disabled
Date: Sun, 15 Jan 2012 00:28:03 +0100
Message-Id: <1326583683-17066-1-git-send-email-asmadeus@codewreck.org>
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 fs/ubifs/debug.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 307ab1d..741dfa5 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -350,10 +350,13 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_msg(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_gen(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_jnl(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_jnlk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_tnc(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_tnck(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_lp(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_find(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_mnt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_mntk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_io(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_cmt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_budg(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-- 
1.7.3.2
