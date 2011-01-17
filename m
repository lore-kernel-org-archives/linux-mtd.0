Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pex0r-0007KP-Px
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 21:53:22 +0000
Received: by fxm19 with SMTP id 19so6530135fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 13:53:20 -0800 (PST)
Subject: [PATCH v2 1/3] UBIFS: re-arrange variables in ubifs_info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4D33FB78.5010208@nokia.com>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala>  <4D33FB78.5010208@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 Jan 2011 23:53:09 +0200
Message-ID: <1295301189.2470.27.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a cosmetic patch which re-arranges variables in 'struct ubifs_info'
so that all boolean-like variables which are only changed during mounting or
re-mounting to R/W mode are places together. Then they are turned into
bit-fields, which makes the structure a little bit smaller.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/ubifs.h |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 381d6b2..d1efa37 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1166,22 +1166,22 @@ struct ubifs_debug_info;
  * @rp_uid: reserved pool user ID
  * @rp_gid: reserved pool group ID
  *
- * @empty: if the UBI device is empty
+ * @empty: %1 if the UBI device is empty
+ * @need_recovery: %1 if the file-system needs recovery
+ * @replaying: %1 during journal replay
+ * @remounting_rw: %1 while re-mounting from R/O mode to R/W mode
+ * @always_chk_crc: always check CRCs (while mounting and remounting to R/W
+ *                  mode)
  * @replay_tree: temporary tree used during journal replay
  * @replay_list: temporary list used during journal replay
  * @replay_buds: list of buds to replay
  * @cs_sqnum: sequence number of first node in the log (commit start node)
  * @replay_sqnum: sequence number of node currently being replayed
- * @need_recovery: file-system needs recovery
- * @replaying: set to %1 during journal replay
  * @unclean_leb_list: LEBs to recover when re-mounting R/O mounted FS to R/W
  *                    mode
  * @rcvrd_mst_node: recovered master node to write when re-mounting R/O mounted
  *                  FS to R/W mode
  * @size_tree: inode size information for recovery
- * @remounting_rw: set while re-mounting from R/O mode to R/W mode
- * @always_chk_crc: always check CRCs (while mounting and remounting to R/W
- *                  mode)
  * @mount_opts: UBIFS-specific mount options
  *
  * @dbg: debugging-related information
@@ -1402,19 +1402,19 @@ struct ubifs_info {
 	gid_t rp_gid;
 
 	/* The below fields are used only during mounting and re-mounting */
-	int empty;
+	unsigned int empty:1;
+	unsigned int need_recovery:1;
+	unsigned int replaying:1;
+	unsigned int remounting_rw:1;
+	unsigned int always_chk_crc:1;
 	struct rb_root replay_tree;
 	struct list_head replay_list;
 	struct list_head replay_buds;
 	unsigned long long cs_sqnum;
 	unsigned long long replay_sqnum;
-	int need_recovery;
-	int replaying;
 	struct list_head unclean_leb_list;
 	struct ubifs_mst_node *rcvrd_mst_node;
 	struct rb_root size_tree;
-	int remounting_rw;
-	int always_chk_crc;
 	struct ubifs_mount_opts mount_opts;
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
-- 
1.7.3.4


-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
