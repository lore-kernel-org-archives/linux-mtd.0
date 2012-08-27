Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T60CT-0007yk-0x
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 14:21:58 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: print less
Date: Mon, 27 Aug 2012 17:22:09 +0300
Message-Id: <1346077329-20036-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

UBIFS currently prints a lot of information when it mounts a volume, which
bothers some people. Make it less chatty - print only important information
by default.

Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/commit.c |    6 ++--
 fs/ubifs/debug.h  |    5 ---
 fs/ubifs/super.c  |   91 +++++++++++++++++++++++++----------------------------
 3 files changed, 46 insertions(+), 56 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index a054caf..ff82293 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -293,8 +293,8 @@ int ubifs_bg_thread(void *info)
 	int err;
 	struct ubifs_info *c = info;
 
-	dbg_msg("background thread \"%s\" started, PID %d",
-		c->bgt_name, current->pid);
+	ubifs_msg("background thread \"%s\" started, PID %d",
+		  c->bgt_name, current->pid);
 	set_freezable();
 
 	while (1) {
@@ -328,7 +328,7 @@ int ubifs_bg_thread(void *info)
 		cond_resched();
 	}
 
-	dbg_msg("background thread \"%s\" stops", c->bgt_name);
+	ubifs_msg("background thread \"%s\" stops", c->bgt_name);
 	return 0;
 }
 
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 38230b1..e03d517 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -176,11 +176,6 @@ struct ubifs_global_debug_info {
 		 dbg_snprintf_key(c, key, __tmp_key_buf, DBG_KEY_BUF_LEN));    \
 } while (0)
 
-/* Just a debugging messages not related to any specific UBIFS subsystem */
-#define dbg_msg(fmt, ...)                                                      \
-	pr_err("UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,              \
-	       __func__, ##__VA_ARGS__)
-
 /* General messages */
 #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARGS__)
 /* Additional journal messages */
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 448bf24..c550642 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1160,7 +1160,7 @@ static int check_free_space(struct ubifs_info *c)
 static int mount_ubifs(struct ubifs_info *c)
 {
 	int err;
-	long long x;
+	long long x, y;
 	size_t sz;
 
 	c->ro_mount = !!(c->vfs_sb->s_flags & MS_RDONLY);
@@ -1410,74 +1410,69 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	c->mounting = 0;
 
-	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"",
-		  c->vi.ubi_num, c->vi.vol_id, c->vi.name);
-	if (c->ro_mount)
-		ubifs_msg("mounted read-only");
+	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"%s",
+		  c->vi.ubi_num, c->vi.vol_id, c->vi.name,
+		  c->ro_mount ? ", R/O mode" : NULL);
 	x = (long long)c->main_lebs * c->leb_size;
-	ubifs_msg("file system size:   %lld bytes (%lld KiB, %lld MiB, %d LEBs)",
-		  x, x >> 10, x >> 20, c->main_lebs);
-	x = (long long)c->log_lebs * c->leb_size + c->max_bud_bytes;
-	ubifs_msg("journal size:       %lld bytes (%lld KiB, %lld MiB, %d LEBs)",
-		  x, x >> 10, x >> 20, c->log_lebs + c->max_bud_cnt);
-	ubifs_msg("media format:       w%d/r%d (latest is w%d/r%d)",
+	y = (long long)c->log_lebs * c->leb_size + c->max_bud_bytes;
+	ubifs_msg("LEB size: %d bytes (%d KiB), min./max. I/O unit sizes: %d bytes/%d bytes",
+		  c->leb_size, c->leb_size >> 10, c->min_io_size,
+		  c->max_write_size);
+	ubifs_msg("FS size: %lld bytes (%lld MiB, %d LEBs), journal size %lld bytes (%lld MiB, %d LEBs)",
+		  x, x >> 20, c->main_lebs,
+		  y, y >> 20, c->log_lebs + c->max_bud_cnt);
+	ubifs_msg("reserved for root: %llu bytes (%llu KiB)",
+		  c->report_rp_size, c->report_rp_size >> 10);
+	ubifs_msg("media format: w%d/r%d (latest is w%d/r%d), UUID %pUB%s",
 		  c->fmt_version, c->ro_compat_version,
-		  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION);
-	ubifs_msg("default compressor: %s", ubifs_compr_name(c->default_compr));
-	ubifs_msg("reserved for root:  %llu bytes (%llu KiB)",
-		c->report_rp_size, c->report_rp_size >> 10);
-
-	dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size);
-	dbg_msg("max. write size:     %d bytes", c->max_write_size);
-	dbg_msg("LEB size:            %d bytes (%d KiB)",
-		c->leb_size, c->leb_size >> 10);
-	dbg_msg("data journal heads:  %d",
+		  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION, c->uuid,
+		  c->big_lpt ? ", big LPT model" : ", small LPT model");
+
+	dbg_mnt("default compressor:  %s", ubifs_compr_name(c->default_compr));
+	dbg_mnt("data journal heads:  %d",
 		c->jhead_cnt - NONDATA_JHEADS_CNT);
-	dbg_msg("UUID:                %pUB", c->uuid);
-	dbg_msg("big_lpt              %d", c->big_lpt);
-	dbg_msg("log LEBs:            %d (%d - %d)",
+	dbg_mnt("log LEBs:            %d (%d - %d)",
 		c->log_lebs, UBIFS_LOG_LNUM, c->log_last);
-	dbg_msg("LPT area LEBs:       %d (%d - %d)",
+	dbg_mnt("LPT area LEBs:       %d (%d - %d)",
 		c->lpt_lebs, c->lpt_first, c->lpt_last);
-	dbg_msg("orphan area LEBs:    %d (%d - %d)",
+	dbg_mnt("orphan area LEBs:    %d (%d - %d)",
 		c->orph_lebs, c->orph_first, c->orph_last);
-	dbg_msg("main area LEBs:      %d (%d - %d)",
+	dbg_mnt("main area LEBs:      %d (%d - %d)",
 		c->main_lebs, c->main_first, c->leb_cnt - 1);
-	dbg_msg("index LEBs:          %d", c->lst.idx_lebs);
-	dbg_msg("total index bytes:   %lld (%lld KiB, %lld MiB)",
+	dbg_mnt("index LEBs:          %d", c->lst.idx_lebs);
+	dbg_mnt("total index bytes:   %lld (%lld KiB, %lld MiB)",
 		c->bi.old_idx_sz, c->bi.old_idx_sz >> 10,
 		c->bi.old_idx_sz >> 20);
-	dbg_msg("key hash type:       %d", c->key_hash_type);
-	dbg_msg("tree fanout:         %d", c->fanout);
-	dbg_msg("reserved GC LEB:     %d", c->gc_lnum);
-	dbg_msg("first main LEB:      %d", c->main_first);
-	dbg_msg("max. znode size      %d", c->max_znode_sz);
-	dbg_msg("max. index node size %d", c->max_idx_node_sz);
-	dbg_msg("node sizes:          data %zu, inode %zu, dentry %zu",
+	dbg_mnt("key hash type:       %d", c->key_hash_type);
+	dbg_mnt("tree fanout:         %d", c->fanout);
+	dbg_mnt("reserved GC LEB:     %d", c->gc_lnum);
+	dbg_mnt("max. znode size      %d", c->max_znode_sz);
+	dbg_mnt("max. index node size %d", c->max_idx_node_sz);
+	dbg_mnt("node sizes:          data %zu, inode %zu, dentry %zu",
 		UBIFS_DATA_NODE_SZ, UBIFS_INO_NODE_SZ, UBIFS_DENT_NODE_SZ);
-	dbg_msg("node sizes:          trun %zu, sb %zu, master %zu",
+	dbg_mnt("node sizes:          trun %zu, sb %zu, master %zu",
 		UBIFS_TRUN_NODE_SZ, UBIFS_SB_NODE_SZ, UBIFS_MST_NODE_SZ);
-	dbg_msg("node sizes:          ref %zu, cmt. start %zu, orph %zu",
+	dbg_mnt("node sizes:          ref %zu, cmt. start %zu, orph %zu",
 		UBIFS_REF_NODE_SZ, UBIFS_CS_NODE_SZ, UBIFS_ORPH_NODE_SZ);
-	dbg_msg("max. node sizes:     data %zu, inode %zu dentry %zu, idx %d",
+	dbg_mnt("max. node sizes:     data %zu, inode %zu dentry %zu, idx %d",
 		UBIFS_MAX_DATA_NODE_SZ, UBIFS_MAX_INO_NODE_SZ,
 		UBIFS_MAX_DENT_NODE_SZ, ubifs_idx_node_sz(c, c->fanout));
-	dbg_msg("dead watermark:      %d", c->dead_wm);
-	dbg_msg("dark watermark:      %d", c->dark_wm);
-	dbg_msg("LEB overhead:        %d", c->leb_overhead);
+	dbg_mnt("dead watermark:      %d", c->dead_wm);
+	dbg_mnt("dark watermark:      %d", c->dark_wm);
+	dbg_mnt("LEB overhead:        %d", c->leb_overhead);
 	x = (long long)c->main_lebs * c->dark_wm;
-	dbg_msg("max. dark space:     %lld (%lld KiB, %lld MiB)",
+	dbg_mnt("max. dark space:     %lld (%lld KiB, %lld MiB)",
 		x, x >> 10, x >> 20);
-	dbg_msg("maximum bud bytes:   %lld (%lld KiB, %lld MiB)",
+	dbg_mnt("maximum bud bytes:   %lld (%lld KiB, %lld MiB)",
 		c->max_bud_bytes, c->max_bud_bytes >> 10,
 		c->max_bud_bytes >> 20);
-	dbg_msg("BG commit bud bytes: %lld (%lld KiB, %lld MiB)",
+	dbg_mnt("BG commit bud bytes: %lld (%lld KiB, %lld MiB)",
 		c->bg_bud_bytes, c->bg_bud_bytes >> 10,
 		c->bg_bud_bytes >> 20);
-	dbg_msg("current bud bytes    %lld (%lld KiB, %lld MiB)",
+	dbg_mnt("current bud bytes    %lld (%lld KiB, %lld MiB)",
 		c->bud_bytes, c->bud_bytes >> 10, c->bud_bytes >> 20);
-	dbg_msg("max. seq. number:    %llu", c->max_sqnum);
-	dbg_msg("commit number:       %llu", c->cmt_no);
+	dbg_mnt("max. seq. number:    %llu", c->max_sqnum);
+	dbg_mnt("commit number:       %llu", c->cmt_no);
 
 	return 0;
 
-- 
1.7.10.4
