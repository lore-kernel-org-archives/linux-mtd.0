Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7k7-0001uN-Jj
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:56 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 15/27] ubifs: ubifs_dump: dump super block
Date: Fri, 13 Nov 2015 14:13:26 +0800
Message-ID: <1447395218-7061-16-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Read the super block from ubi volume and dump it out.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/lpt.h           |   1 +
 ubifs-utils/lib/lpt.c               |  29 +++++++
 ubifs-utils/ubifs_dump/ubifs_dump.c | 151 ++++++++++++++++++++++++++++++++++--
 3 files changed, 173 insertions(+), 8 deletions(-)

diff --git a/ubifs-utils/include/lpt.h b/ubifs-utils/include/lpt.h
index 4cde59d..e2f7348 100644
--- a/ubifs-utils/include/lpt.h
+++ b/ubifs-utils/include/lpt.h
@@ -24,5 +24,6 @@
 
 int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt);
 int create_lpt(struct ubifs_info *c);
+int ubifs_calc_lpt_geom(struct ubifs_info *c);
 
 #endif
diff --git a/ubifs-utils/lib/lpt.c b/ubifs-utils/lib/lpt.c
index 100d747..26fb4dd 100644
--- a/ubifs-utils/lib/lpt.c
+++ b/ubifs-utils/lib/lpt.c
@@ -585,3 +585,32 @@ out:
 	free(pnode);
 	return err;
 }
+
+/**
+ * ubifs_calc_lpt_geom - calculate and check sizes for the LPT area.
+ * @c: the UBIFS file-system description object
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_calc_lpt_geom(struct ubifs_info *c)
+{
+	int lebs_needed;
+	long long sz;
+
+	do_calc_lpt_geom(c);
+
+	/* Verify that lpt_lebs is big enough */
+	sz = c->lpt_sz * 2; /* Must have at least 2 times the size */
+	lebs_needed = (sz + c->leb_size - 1) / c->leb_size;
+	if (lebs_needed > c->lpt_lebs) {
+		ubifs_err(c, "too few LPT LEBs, %d", lebs_needed);
+		return -EINVAL;
+	}
+
+	/* Verify that ltab fits in a single LEB (since ltab is a single node */
+	if (c->ltab_sz > c->leb_size) {
+		ubifs_err(c, "LPT ltab too big");
+		return -EINVAL;
+	}
+	return 0;
+}
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index a510aeb..9ddb0f7 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -4,6 +4,7 @@
 
 #include "io.h"
 #include "key.h"
+#include "lpt.h"
 
 #define DBG_KEY_BUF_LEN		48
 
@@ -16,6 +17,13 @@ static const struct option longopts[] = {
 struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
 
+/* Global buffers */
+static void *leb_buf;
+
+/* Global nodes*/
+struct ubifs_mst_node mst;
+struct ubifs_sb_node sup;
+
 static int get_options(int argc, char**argv)
 {
 	int opt, i;
@@ -73,13 +81,6 @@ static const char *hash_type_to_str[] = {
 		"UBIFS_KEY_HASH_TEST"
 };
 
-static const char *compr_type_to_str[] = {
-		"UBIFS_COMPR_NONE",
-		"UBIFS_COMPR_LZO",
-		"UBIFS_COMPR_ZLIB",
-		"UBIFS_COMPR_TYPES_CNT",
-};
-
 static const char *key_fmt_to_str[] = {
 	"UBIFS_SIMPLE_KEY_FMT"
 };
@@ -375,11 +376,145 @@ void dump_node(const struct ubifs_info *c, const void *node)
 	printf("\n");
 }
 
-static int dump()
+/**
+ * init - initialize things.
+ */
+static int init(void)
+{
+	leb_buf = malloc(c->leb_size);
+	if (!leb_buf)
+		return err_msg("out of memory");
+
+	return 0;
+}
+
+/**
+ * deinit - deinitialize things.
+ */
+static void deinit(void)
+{
+	free(leb_buf);
+}
+
+/*
+ * init_constants_sb - initialize UBIFS constants.
+ * @c: UBIFS file-system description object
+ *
+ * This is a helper function which initializes various UBIFS constants after
+ * the superblock has been read. It also checks various UBIFS parameters and
+ * makes sure they are all right. Returns zero in case of success and a
+ * negative error code in case of failure.
+ */
+static int init_constants_sb(struct ubifs_info *c)
 {
+	int tmp, err;
+
+	tmp = ubifs_idx_node_sz(c, 1);
+	c->min_idx_node_sz = ALIGN(tmp, 8);
+
+	tmp = ubifs_idx_node_sz(c, c->fanout);
+	c->max_idx_node_sz = ALIGN(tmp, 8);
+
+	c->max_znode_sz = sizeof(struct ubifs_znode) +
+			c->fanout * sizeof(struct ubifs_zbranch);
+	/* Make sure LEB size is large enough to fit full commit */
+	tmp = UBIFS_CS_NODE_SZ + UBIFS_REF_NODE_SZ * c->jhead_cnt;
+	tmp = ALIGN(tmp, c->min_io_size);
+	if (tmp > c->leb_size) {
+		printf("too small LEB size %d, at least %d needed",
+			  c->leb_size, tmp);
+		return -EINVAL;
+	}
+
+	err = ubifs_calc_lpt_geom(c);
+	if (err)
+		return err;
+
 	return 0;
 }
 
+static int dump_super(void)
+{
+	int err = 0;
+	unsigned long sup_flags;
+
+	memset(&sup, 0, UBIFS_SB_NODE_SZ);
+	err = ubifs_read(0, UBIFS_SB_NODE_SZ, &sup);
+	if (err)
+		return err;
+
+	printf("SUPER BLOCK: \n");
+	dump_node(c, &sup);
+
+        switch (sup.key_hash) {
+        case UBIFS_KEY_HASH_R5:
+                c->key_hash = key_r5_hash;
+                c->key_hash_type = UBIFS_KEY_HASH_R5;
+                break;
+
+        case UBIFS_KEY_HASH_TEST:
+                c->key_hash = key_test_hash;
+                c->key_hash_type = UBIFS_KEY_HASH_TEST;
+                break;
+        };
+
+	c->key_fmt = sup.key_fmt;
+
+	switch (c->key_fmt) {
+	case UBIFS_SIMPLE_KEY_FMT:
+		c->key_len = UBIFS_SK_LEN;
+		break;
+	default:
+		printf("unsupported key format");
+		err = -EINVAL;
+		return err;
+	}
+
+	c->leb_size	 = le32_to_cpu(sup.leb_size);
+	c->min_io_size	 = le32_to_cpu(sup.min_io_size);
+	c->leb_cnt       = le32_to_cpu(sup.leb_cnt);
+	c->max_leb_cnt   = le32_to_cpu(sup.max_leb_cnt);
+	c->max_bud_bytes = le64_to_cpu(sup.max_bud_bytes);
+	c->log_lebs      = le32_to_cpu(sup.log_lebs);
+	c->lpt_lebs      = le32_to_cpu(sup.lpt_lebs);
+	c->orph_lebs     = le32_to_cpu(sup.orph_lebs);
+	c->jhead_cnt     = le32_to_cpu(sup.jhead_cnt) + NONDATA_JHEADS_CNT;
+	c->fanout        = le32_to_cpu(sup.fanout);
+	c->lsave_cnt     = le32_to_cpu(sup.lsave_cnt);
+	c->rp_size       = le64_to_cpu(sup.rp_size);
+	sup_flags        = le32_to_cpu(sup.flags);
+	c->default_compr = le16_to_cpu(sup.default_compr);
+
+	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
+	c->space_fixup = !!(sup_flags & UBIFS_FLG_SPACE_FIXUP);
+
+	/* Automatically increase file system size to the maximum size */
+	c->lpt_first = UBIFS_LOG_LNUM + c->log_lebs;
+	c->lpt_last = c->lpt_first + c->lpt_lebs - 1;
+	c->main_lebs = c->leb_cnt - UBIFS_SB_LEBS - UBIFS_MST_LEBS;
+	c->main_lebs -= c->log_lebs + c->lpt_lebs + c->orph_lebs;
+	c->main_first = c->leb_cnt - c->main_lebs;
+
+	return init_constants_sb(c);
+}
+
+static int dump()
+{
+	int err = 0;
+
+	err = init();
+	if (err)
+		goto out;
+
+	err = dump_super();
+	if (err)
+		goto out;
+
+out:
+	deinit();
+	return err;
+}
+
 int main(int argc, char *argv[])
 {
 	int err;
-- 
1.8.4.2
