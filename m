Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7kD-0001uN-P8
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:22:02 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 18/27] ubifs: ubifs_dump: dump master node
Date: Fri, 13 Nov 2015 14:13:29 +0800
Message-ID: <1447395218-7061-19-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Search the master lebs and found the latest master node.
Then dump it out.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |   1 +
 ubifs-utils/ubifs_dump/ubifs_dump.c | 139 +++++++++++++++++++++++++++++-------
 2 files changed, 115 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index a1aaa6e..1d7e5f2 100644
--- a/Makefile
+++ b/Makefile
@@ -130,6 +130,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 $(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
 obj-ubifs_dump = $(UBIFS_LIBS)
+obj-ubifs_dump += ../lib/scan.o
 LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 9ddb0f7..4f67621 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -2,9 +2,11 @@
 #define PROGRAM_NAME "ubifs-dump"
 #include "common.h"
 
+#include "ubifs.h"
 #include "io.h"
 #include "key.h"
 #include "lpt.h"
+#include "scan.h"
 
 #define DBG_KEY_BUF_LEN		48
 
@@ -17,7 +19,6 @@ static const struct option longopts[] = {
 struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
 
-/* Global buffers */
 static void *leb_buf;
 
 /* Global nodes*/
@@ -376,26 +377,6 @@ void dump_node(const struct ubifs_info *c, const void *node)
 	printf("\n");
 }
 
-/**
- * init - initialize things.
- */
-static int init(void)
-{
-	leb_buf = malloc(c->leb_size);
-	if (!leb_buf)
-		return err_msg("out of memory");
-
-	return 0;
-}
-
-/**
- * deinit - deinitialize things.
- */
-static void deinit(void)
-{
-	free(leb_buf);
-}
-
 /*
  * init_constants_sb - initialize UBIFS constants.
  * @c: UBIFS file-system description object
@@ -498,20 +479,128 @@ static int dump_super(void)
 	return init_constants_sb(c);
 }
 
-static int dump()
+/**
+ * scan_for_master - search the valid master node.
+ * @c: UBIFS file-system description object
+ *
+ * This function scans the master node LEBs and search for the latest master
+ * node. Returns zero in case of success, %-EUCLEAN if there master area is
+ * corrupted and requires recovery, and a negative error code in case of
+ * failure.
+ */
+static int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node)
 {
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	int lnum, offs = 0, nodes_cnt;
 	int err = 0;
 
-	err = init();
-	if (err)
+	lnum = UBIFS_MST_LNUM;
+
+	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
+	if (IS_ERR(sleb))
+		return PTR_ERR(sleb);
+	nodes_cnt = sleb->nodes_cnt;
+	if (nodes_cnt > 0) {
+		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
+				  list);
+		if (snod->type != UBIFS_MST_NODE) {
+			err = -EINVAL;
+			goto out;
+		}
+		memcpy(mst_node, snod->node, snod->len);
+		offs = snod->offs;
+	}
+	ubifs_scan_destroy(sleb);
+
+	lnum += 1;
+
+	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
+	if (IS_ERR(sleb)) {
+		return PTR_ERR(sleb);
+	}
+	err = -EUCLEAN;
+	if (sleb->nodes_cnt != nodes_cnt)
+		goto out;
+	if (!sleb->nodes_cnt)
+		goto out;
+	snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node, list);
+	if (snod->type != UBIFS_MST_NODE) {
+		err = -EINVAL;
+		goto out;
+	}
+	if (snod->offs != offs)
+		goto out;
+	if (memcmp((void *)mst_node + UBIFS_CH_SZ,
+		   (void *)snod->node + UBIFS_CH_SZ,
+		   UBIFS_MST_NODE_SZ - UBIFS_CH_SZ))
 		goto out;
+	err = 0;
+
+out:
+	ubifs_scan_destroy(sleb);
+	return err;
+}
+
+static int dump_master(void)
+{
+	int err = 0;
+
+	printf("MASTER: \n");
+	err = scan_for_master(c, &mst);
+	if (err)
+		return err;
+	dump_node(c, &mst);
+	mst.flags &= cpu_to_le32(~UBIFS_MST_RCVRY);
+
+	c->max_sqnum       = le64_to_cpu(mst.ch.sqnum);
+	c->highest_inum    = le64_to_cpu(mst.highest_inum);
+	c->zroot.lnum      = le32_to_cpu(mst.root_lnum);
+	c->zroot.offs      = le32_to_cpu(mst.root_offs);
+	c->zroot.len       = le32_to_cpu(mst.root_len);
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
+	return 0;
+}
+
+static int dump()
+{
+	int err = 0;
 
 	err = dump_super();
 	if (err)
 		goto out;
 
+	leb_buf = malloc(c->leb_size);
+	if (!leb_buf) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	err = dump_master();
+	if (err)
+		goto free;
+free:
+	free(leb_buf);
 out:
-	deinit();
 	return err;
 }
 
-- 
1.8.4.2
