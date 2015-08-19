Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0O-0005ke-4M
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:45:58 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 11/27] ubifs: copy some important data in ubifs.h from kernel
 to ubifs-utils
Date: Wed, 19 Aug 2015 16:39:16 +0800
Message-ID: <1439973572-12489-12-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There are some definitions in ubifs.h in kernel we need but
not in userspace currently. Then copy it here.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/ubifs.h | 96 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 91 insertions(+), 5 deletions(-)

diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
index 434b651..3696f1a 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -25,6 +25,10 @@
 #ifndef __UBIFS_H__
 #define __UBIFS_H__
 
+#include "defs.h"
+#include "list.h"
+#include "libubi.h"
+
 /* Maximum logical eraseblock size in bytes */
 #define UBIFS_MAX_LEB_SZ (2*1024*1024)
 
@@ -34,6 +38,7 @@
 /* Largest key size supported in this implementation */
 #define CUR_MAX_KEY_LEN UBIFS_SK_LEN
 
+#define NONDATA_JHEADS_CNT 2
 /*
  * There is no notion of truncation key because truncation nodes do not exist
  * in TNC. However, when replaying, it is handy to introduce fake "truncation"
@@ -41,6 +46,7 @@
  * %UBIFS_TRUN_KEY type.
  */
 #define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT
+#define UBIFS_INVALID_KEY UBIFS_KEY_TYPES_CNT
 
 /* The below union makes it easier to deal with keys */
 union ubifs_key
@@ -85,25 +91,34 @@ enum {
  * @free: amount of free space in bytes
  * @dirty: amount of dirty space in bytes
  * @flags: LEB properties flags (see above)
+ * @lnum: LEB number
+ * @list: list of same-category lprops (for LPROPS_EMPTY and LPROPS_FREEABLE)
+ * @hpos: heap position in heap of same-category lprops (other categories)
  */
-struct ubifs_lprops
-{
+struct ubifs_lprops {
 	int free;
 	int dirty;
 	int flags;
+	int lnum;
+	union {
+		struct list_head list;
+		int hpos;
+	};
 };
 
 /**
  * struct ubifs_lpt_lprops - LPT logical eraseblock properties.
  * @free: amount of free space in bytes
  * @dirty: amount of dirty space in bytes
+ * @tgc: trivial GC flag (1 => unmap after commit end)
+ * @cmt: commit flag (1 => reserved for commit)
  */
-struct ubifs_lpt_lprops
-{
+struct ubifs_lpt_lprops {
 	int free;
 	int dirty;
+	unsigned tgc:1;
+	unsigned cmt:1;
 };
-
 struct ubifs_nnode;
 
 /**
@@ -254,6 +269,12 @@ struct ubifs_znode
 	struct ubifs_zbranch zbranch[];
 };
 
+enum {
+	LPT_SCAN_CONTINUE = 0,
+	LPT_SCAN_ADD = 1,
+	LPT_SCAN_STOP = 2,
+};
+
 /**
  * struct ubifs_info - UBIFS file-system description data structure
  * (per-superblock).
@@ -392,6 +413,7 @@ struct ubifs_info
 	int pnode_cnt;
 	int nnode_cnt;
 	int lpt_hght;
+	void *lpt_nod_buf;
 
 	int lpt_lnum;
 	int lpt_offs;
@@ -411,8 +433,68 @@ struct ubifs_info
 	int *lsave;
 	int lscan_lnum;
 
+	struct ubifs_nnode *nroot;
+	struct ubifs_cnode *lpt_cnext;
+
+	int min_idx_node_sz;
+	int max_idx_node_sz;
+
+	int max_znode_sz;
+};
+/**
+ * struct ubifs_scan_node - UBIFS scanned node information.
+ * @list: list of scanned nodes
+ * @key: key of node scanned (if it has one)
+ * @sqnum: sequence number
+ * @type: type of node scanned
+ * @offs: offset with LEB of node scanned
+ * @len: length of node scanned
+ * @node: raw node
+ */
+struct ubifs_scan_node {
+	struct list_head list;
+	union ubifs_key key;
+	unsigned long long sqnum;
+	int type;
+	int offs;
+	int len;
+	void *node;
+};
+
+/**
+ * struct ubifs_scan_leb - UBIFS scanned LEB information.
+ * @lnum: logical eraseblock number
+ * @nodes_cnt: number of nodes scanned
+ * @nodes: list of struct ubifs_scan_node
+ * @endpt: end point (and therefore the start of empty space)
+ * @buf: buffer containing entire LEB scanned
+ */
+struct ubifs_scan_leb {
+	int lnum;
+	int nodes_cnt;
+	struct list_head nodes;
+	int endpt;
+	void *buf;
 };
 
+/*
+ * 'ubifs_scan_a_node()' return values.
+ *
+ * SCANNED_GARBAGE:  scanned garbage
+ * SCANNED_EMPTY_SPACE: scanned empty space
+ * SCANNED_A_NODE: scanned a valid node
+ * SCANNED_A_CORRUPT_NODE: scanned a corrupted node
+ * SCANNED_A_BAD_PAD_NODE: scanned a padding node with invalid pad length
+ *
+ * Greater than zero means: 'scanned that number of padding bytes'
+ */
+enum {
+	SCANNED_GARBAGE        = 0,
+	SCANNED_EMPTY_SPACE    = -1,
+	SCANNED_A_NODE         = -2,
+	SCANNED_A_CORRUPT_NODE = -3,
+	SCANNED_A_BAD_PAD_NODE = -4,
+};
 /**
  * ubifs_idx_node_sz - return index node size.
  * @c: the UBIFS file-system description object
@@ -438,4 +520,8 @@ struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
 				       (UBIFS_BRANCH_SZ + c->key_len) * bnum);
 }
 
+/* Callback used by the 'ubifs_lpt_scan_nolock()' function */
+typedef int (*ubifs_lpt_scan_callback)(struct ubifs_info *c,
+				       const struct ubifs_lprops *lprops,
+				       int in_tree, void *data);
 #endif /* __UBIFS_H__ */
-- 
1.8.4.2
