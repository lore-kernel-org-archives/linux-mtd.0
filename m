Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOWT-00016m-W8
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:21:51 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4N6LkPp001506
	for <linux-mtd@lists.infradead.org>; Mon, 23 May 2011 09:21:47 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: fix kernel-doc comments
Date: Mon, 23 May 2011 09:25:44 +0300
Message-Id: <1306131945-5187-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a minor fix for UBIFS kernel-doc comments - we forgot the "@" symbol
for several 'struct ubifs_debug_info'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index f3e235f..7538bf2 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -56,11 +56,11 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @saved_free: saved amount of free space
  * @saved_idx_gc_cnt: saved value of @c->idx_gc_cnt
  *
- * dfs_dir_name: name of debugfs directory containing this file-system's files
- * dfs_dir: direntry object of the file-system debugfs directory
- * dfs_dump_lprops: "dump lprops" debugfs knob
- * dfs_dump_budg: "dump budgeting information" debugfs knob
- * dfs_dump_tnc: "dump TNC" debugfs knob
+ * @dfs_dir_name: name of debugfs directory containing this file-system's files
+ * @dfs_dir: direntry object of the file-system debugfs directory
+ * @dfs_dump_lprops: "dump lprops" debugfs knob
+ * @dfs_dump_budg: "dump budgeting information" debugfs knob
+ * @dfs_dump_tnc: "dump TNC" debugfs knob
  */
 struct ubifs_debug_info {
 	struct ubifs_zbranch old_zroot;
-- 
1.7.2.3
