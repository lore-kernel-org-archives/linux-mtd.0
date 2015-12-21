Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBA-0000mf-SX
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:51:02 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 34/38] ubifs: extend master scanning code
Date: Mon, 21 Dec 2015 16:41:57 +0800
Message-ID: <1450687321-12381-35-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Move to dedicated file and add master node validation

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |   2 +-
 ubifs-utils/include/master.h        |   7 +
 ubifs-utils/include/ubifs.h         |  22 +++
 ubifs-utils/lib/master.c            | 311 ++++++++++++++++++++++++++++++++++++
 ubifs-utils/ubifs_dump/ubifs_dump.c |  64 +-------
 5 files changed, 342 insertions(+), 64 deletions(-)
 create mode 100644 ubifs-utils/include/master.h
 create mode 100644 ubifs-utils/lib/master.c

diff --git a/Makefile b/Makefile
index c9dbc58..c892787 100644
--- a/Makefile
+++ b/Makefile
@@ -130,7 +130,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 $(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
 obj-ubifs_dump = $(UBIFS_LIBS)
-obj-ubifs_dump += ../lib/scan.o ../lib/lprops.o ../lib/hexdump.o
+obj-ubifs_dump += ../lib/scan.o ../lib/master.o ../lib/lprops.o ../lib/hexdump.o
 LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/include/master.h b/ubifs-utils/include/master.h
new file mode 100644
index 0000000..0e51455
--- /dev/null
+++ b/ubifs-utils/include/master.h
@@ -0,0 +1,7 @@
+#ifndef __UBIFS_MASTER_H__
+#define __UBIFS_MASTER_H__
+
+int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node);
+int ubifs_read_master(struct ubifs_info *c);
+
+#endif
diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
index 4a3212f..54ca865 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -32,9 +32,22 @@
 /* Maximum logical eraseblock size in bytes */
 #define UBIFS_MAX_LEB_SZ (2*1024*1024)
 
+/* "File system end of life" sequence number watermark */
+#define SQNUM_WARN_WATERMARK 0xFFFFFFFF00000000ULL
+#define SQNUM_WATERMARK      0xFFFFFFFFFF000000ULL
+
 /* Minimum amount of data UBIFS writes to the flash */
 #define MIN_WRITE_SZ (UBIFS_DATA_NODE_SZ + 8)
 
+/*
+ * Currently we do not support inode number overlapping and re-using, so this
+ * watermark defines dangerous inode number level. This should be fixed later,
+ * although it is difficult to exceed current limit. Another option is to use
+ * 64-bit inode numbers, but this means more overhead.
+ */
+#define INUM_WARN_WATERMARK 0xFFF00000
+#define INUM_WATERMARK      0xFFFFFF00
+
 /* Largest key size supported in this implementation */
 #define CUR_MAX_KEY_LEN UBIFS_SK_LEN
 
@@ -291,6 +304,10 @@ enum {
  * @highest_inum: highest used inode number
  * @max_sqnum: current global sequence number
  *
+ * @cmt_no: commit number of the last successfully completed commit, protected
+ *          by @commit_sem
+ *
+ * @lhead_lnum: log head logical eraseblock number
  * @jhead_cnt: count of journal heads
  * @max_bud_bytes: maximum number of bytes allowed in buds
  *
@@ -363,11 +380,15 @@ enum {
  * @lsave_offs: offset of LPT's save table
  * @lsave: LPT's save table
  * @lscan_lnum: LEB number of last LPT scan
+ * @verbose: verbose mode enabled
  */
 struct ubifs_info
 {
 	ino_t highest_inum;
 	unsigned long long max_sqnum;
+	unsigned long long cmt_no;
+
+	int lhead_lnum;
 
 	int jhead_cnt;
 	long long max_bud_bytes;
@@ -451,6 +472,7 @@ struct ubifs_info
 	int max_idx_node_sz;
 
 	int max_znode_sz;
+	int verbose;
 };
 /**
  * struct ubifs_scan_node - UBIFS scanned node information.
diff --git a/ubifs-utils/lib/master.c b/ubifs-utils/lib/master.c
new file mode 100644
index 0000000..ee640c7
--- /dev/null
+++ b/ubifs-utils/lib/master.c
@@ -0,0 +1,311 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2006-2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy (Битюцкий Артём)
+ *          Adrian Hunter
+ */
+/*
+ * Modifications for mtd-utils.
+ *
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+/* This file implements reading and writing the master node */
+
+#define PROGRAM_NAME "master"
+
+#include "ubifs_common.h"
+#include "common.h"
+#include "ubifs.h"
+#include "scan.h"
+#include "master.h"
+
+
+/**
+ * scan_for_master - search the valid master node.
+ * @c: UBIFS file-system description object
+ * @mst_node: output master node
+ *
+ * This function scans the master node LEBs and search for the latest master
+ * node. Returns zero in case of success, %-EUCLEAN if there master area is
+ * corrupted and requires recovery, and a negative error code in case of
+ * failure.
+ */
+int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node)
+{
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	int lnum, offs = 0, nodes_cnt;
+	int err = -EUCLEAN;
+
+	lnum = UBIFS_MST_LNUM;
+
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
+	if (IS_ERR(sleb)) {
+		err = PTR_ERR(sleb);
+		goto out;
+	}
+	nodes_cnt = sleb->nodes_cnt;
+	if (nodes_cnt > 0) {
+		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
+				  list);
+		if (snod->type != UBIFS_MST_NODE)
+			goto out_dump;
+		memcpy(mst_node, snod->node, snod->len);
+		offs = snod->offs;
+	}
+	ubifs_scan_destroy(sleb);
+
+	lnum += 1;
+
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
+	if (IS_ERR(sleb)) {
+		err = PTR_ERR(sleb);
+		goto out;
+	}
+	if (sleb->nodes_cnt != nodes_cnt)
+		goto out_destroy;
+	if (!sleb->nodes_cnt)
+		goto out_destroy;
+	snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node, list);
+	if (snod->type != UBIFS_MST_NODE)
+		goto out_dump;
+	if (snod->offs != offs)
+		goto out_destroy;
+	if (memcmp((void *)mst_node + UBIFS_CH_SZ,
+		   (void *)snod->node + UBIFS_CH_SZ,
+		   UBIFS_MST_NODE_SZ - UBIFS_CH_SZ))
+		goto out_destroy;
+
+	err = 0;
+
+out_destroy:
+	ubifs_scan_destroy(sleb);
+out:
+	return err;
+
+out_dump:
+	errmsg("unexpected node type %d master LEB %d:%d",
+		  snod->type, lnum, snod->offs);
+	err = -EINVAL;
+	goto out_destroy;
+}
+/**
+ * validate_master - validate master node.
+ * @c: UBIFS file-system description object
+ *
+ * This function validates data which was read from master node. Returns zero
+ * if the data is all right and %-EINVAL if not.
+ */
+static int validate_master(const struct ubifs_info *c)
+{
+	long long main_sz;
+	int err;
+
+	if (c->max_sqnum >= SQNUM_WATERMARK) {
+		err = 1;
+		goto out;
+	}
+
+	if (c->cmt_no >= c->max_sqnum) {
+		err = 2;
+		goto out;
+	}
+
+	if (c->highest_inum >= INUM_WATERMARK) {
+		err = 3;
+		goto out;
+	}
+
+	if (c->lhead_lnum < UBIFS_LOG_LNUM ||
+	    c->lhead_lnum >= UBIFS_LOG_LNUM + c->log_lebs) {
+		err = 4;
+		goto out;
+	}
+
+	if (c->zroot.lnum >= c->leb_cnt || c->zroot.lnum < c->main_first ||
+	    c->zroot.offs >= c->leb_size || c->zroot.offs & 7) {
+		err = 5;
+		goto out;
+	}
+
+	if (c->zroot.len < UBIFS_IDX_NODE_SZ + UBIFS_BRANCH_SZ ||
+	    c->zroot.len > INT_MAX) {
+		err = 6;
+		goto out;
+	}
+
+	if (c->gc_lnum >= c->leb_cnt || c->gc_lnum < c->main_first) {
+		err = 7;
+		goto out;
+	}
+
+	if (c->ihead_lnum >= c->leb_cnt || c->ihead_lnum < c->main_first ||
+	    c->ihead_offs % c->min_io_size || c->ihead_offs < 0 ||
+	    c->ihead_offs > c->leb_size || c->ihead_offs & 7) {
+		err = 8;
+		goto out;
+	}
+
+	main_sz = (long long)c->main_lebs * c->leb_size;
+
+	if (c->lpt_lnum < c->lpt_first || c->lpt_lnum > c->lpt_last ||
+	    c->lpt_offs < 0 || c->lpt_offs + c->nnode_sz > c->leb_size) {
+		err = 10;
+		goto out;
+	}
+
+	if (c->nhead_lnum < c->lpt_first || c->nhead_lnum > c->lpt_last ||
+	    c->nhead_offs < 0 || c->nhead_offs % c->min_io_size ||
+	    c->nhead_offs > c->leb_size) {
+		err = 11;
+		goto out;
+	}
+
+	if (c->ltab_lnum < c->lpt_first || c->ltab_lnum > c->lpt_last ||
+	    c->ltab_offs < 0 ||
+	    c->ltab_offs + c->ltab_sz > c->leb_size) {
+		err = 12;
+		goto out;
+	}
+
+	if (c->big_lpt && (c->lsave_lnum < c->lpt_first ||
+	    c->lsave_lnum > c->lpt_last || c->lsave_offs < 0 ||
+	    c->lsave_offs + c->lsave_sz > c->leb_size)) {
+		err = 13;
+		goto out;
+	}
+
+	if (c->lscan_lnum < c->main_first || c->lscan_lnum >= c->leb_cnt) {
+		err = 14;
+		goto out;
+	}
+
+	if (c->lst.empty_lebs < 0 || c->lst.empty_lebs > c->main_lebs - 2) {
+		err = 15;
+		goto out;
+	}
+
+	if (c->lst.idx_lebs < 0 || c->lst.idx_lebs > c->main_lebs - 1) {
+		err = 16;
+		goto out;
+	}
+
+	if (c->lst.total_free < 0 || c->lst.total_free > main_sz ||
+	    c->lst.total_free & 7) {
+		err = 17;
+		goto out;
+	}
+
+	if (c->lst.total_dirty < 0 || (c->lst.total_dirty & 7)) {
+		err = 18;
+		goto out;
+	}
+
+	if (c->lst.total_used < 0 || (c->lst.total_used & 7)) {
+		err = 19;
+		goto out;
+	}
+
+	if (c->lst.total_free + c->lst.total_dirty +
+	    c->lst.total_used > main_sz) {
+		err = 20;
+		goto out;
+	}
+
+	if (c->lst.total_dead < 0 ||
+	    c->lst.total_dead > c->lst.total_free + c->lst.total_dirty ||
+	    c->lst.total_dead & 7) {
+		err = 22;
+		goto out;
+	}
+
+	if (c->lst.total_dark < 0 ||
+	    c->lst.total_dark > c->lst.total_free + c->lst.total_dirty ||
+	    c->lst.total_dark & 7) {
+		err = 23;
+		goto out;
+	}
+
+	return 0;
+
+out:
+	errmsg("bad master node, error %d", err);
+	return -EINVAL;
+}
+
+/**
+ * ubifs_read_master - read master node.
+ * @c: UBIFS file-system description object
+ *
+ * This function finds and reads the master node during file-system mount. If
+ * the flash is empty, it creates default master node as well. Returns zero in
+ * case of success and a negative error code in case of failure.
+ */
+int ubifs_read_master(struct ubifs_info *c)
+{
+	int err;
+	struct ubifs_mst_node mst;
+
+	err = scan_for_master(c, &mst);
+	if (err) {
+		if (err == -EUCLEAN) {
+			normsg("master node requires recovery");
+			// TODO recover master node
+			// err = ubifs_recover_master_node(c);
+		} else
+			errmsg("failed to load master node");
+
+		if (err)
+			return err;
+	}
+
+	c->max_sqnum       = le64_to_cpu(mst.ch.sqnum);
+	c->highest_inum    = le64_to_cpu(mst.highest_inum);
+	c->cmt_no          = le64_to_cpu(mst.cmt_no);
+	c->zroot.lnum      = le32_to_cpu(mst.root_lnum);
+	c->zroot.offs      = le32_to_cpu(mst.root_offs);
+	c->zroot.len       = le32_to_cpu(mst.root_len);
+	c->lhead_lnum      = le32_to_cpu(mst.log_lnum);
+	c->gc_lnum         = le32_to_cpu(mst.gc_lnum);
+	c->ihead_lnum      = le32_to_cpu(mst.ihead_lnum);
+	c->ihead_offs      = le32_to_cpu(mst.ihead_offs);
+	c->lpt_lnum        = le32_to_cpu(mst.lpt_lnum);
+	c->lpt_offs        = le32_to_cpu(mst.lpt_offs);
+	c->nhead_lnum      = le32_to_cpu(mst.nhead_lnum);
+	c->nhead_offs      = le32_to_cpu(mst.nhead_offs);
+	c->ltab_lnum       = le32_to_cpu(mst.ltab_lnum);
+	c->ltab_offs       = le32_to_cpu(mst.ltab_offs);
+	c->lsave_lnum      = le32_to_cpu(mst.lsave_lnum);
+	c->lsave_offs      = le32_to_cpu(mst.lsave_offs);
+	c->lscan_lnum      = le32_to_cpu(mst.lscan_lnum);
+	c->lst.empty_lebs  = le32_to_cpu(mst.empty_lebs);
+	c->lst.idx_lebs    = le32_to_cpu(mst.idx_lebs);
+	c->lst.total_free  = le64_to_cpu(mst.total_free);
+	c->lst.total_dirty = le64_to_cpu(mst.total_dirty);
+	c->lst.total_used  = le64_to_cpu(mst.total_used);
+	c->lst.total_dead  = le64_to_cpu(mst.total_dead);
+	c->lst.total_dark  = le64_to_cpu(mst.total_dark);
+
+	verbose(c->verbose, "found master node with max sqnum %llu", c->max_sqnum);
+
+	return validate_master(c);
+}
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 4cbf755..2f5ef84 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -8,6 +8,7 @@
 #include "lpt.h"
 #include "scan.h"
 #include "hexdump.h"
+#include "master.h"
 
 #define DBG_KEY_BUF_LEN		48
 
@@ -483,69 +484,6 @@ static int dump_super(void)
 	return init_constants_sb(c);
 }
 
-/**
- * scan_for_master - search the valid master node.
- * @c: UBIFS file-system description object
- *
- * This function scans the master node LEBs and search for the latest master
- * node. Returns zero in case of success, %-EUCLEAN if there master area is
- * corrupted and requires recovery, and a negative error code in case of
- * failure.
- */
-static int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node)
-{
-	struct ubifs_scan_leb *sleb;
-	struct ubifs_scan_node *snod;
-	int lnum, offs = 0, nodes_cnt;
-	int err = 0;
-
-	lnum = UBIFS_MST_LNUM;
-
-	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
-	if (IS_ERR(sleb))
-		return PTR_ERR(sleb);
-	nodes_cnt = sleb->nodes_cnt;
-	if (nodes_cnt > 0) {
-		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
-				  list);
-		if (snod->type != UBIFS_MST_NODE) {
-			err = -EINVAL;
-			goto out;
-		}
-		memcpy(mst_node, snod->node, snod->len);
-		offs = snod->offs;
-	}
-	ubifs_scan_destroy(sleb);
-
-	lnum += 1;
-
-	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
-	if (IS_ERR(sleb)) {
-		return PTR_ERR(sleb);
-	}
-	err = -EUCLEAN;
-	if (sleb->nodes_cnt != nodes_cnt)
-		goto out;
-	if (!sleb->nodes_cnt)
-		goto out;
-	snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node, list);
-	if (snod->type != UBIFS_MST_NODE) {
-		err = -EINVAL;
-		goto out;
-	}
-	if (snod->offs != offs)
-		goto out;
-	if (memcmp((void *)mst_node + UBIFS_CH_SZ,
-		   (void *)snod->node + UBIFS_CH_SZ,
-		   UBIFS_MST_NODE_SZ - UBIFS_CH_SZ))
-		goto out;
-	err = 0;
-
-out:
-	ubifs_scan_destroy(sleb);
-	return err;
-}
-
 static int dump_master(void)
 {
 	int err = 0;
-- 
1.8.4.2
