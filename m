Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9e-0001Kj-Vo
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:17:26 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/11] ubifs: add ubifs_unpack
Date: Sat, 31 Oct 2015 12:16:00 +0100
Message-Id: <1446290160-30696-12-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

ubifs_unpack allows unpacking of ubifs volumes. Input can be either a image
file created from nanddump or a ubi volume.

ubifs_unpack also performs necessary sanity checks and prints a detailed report
of the FS-state.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 Makefile                                |   7 +-
 ubifs-utils/include/emubi.h             |   1 +
 ubifs-utils/include/list_sort.h         |  11 +
 ubifs-utils/include/ubifs.h             |  32 ++
 ubifs-utils/lib/emubi.c                 |  20 +
 ubifs-utils/lib/list_sort.c             | 157 ++++++
 ubifs-utils/ubifs_unpack/index.c        | 648 ++++++++++++++++++++++++
 ubifs-utils/ubifs_unpack/replay.c       | 865 ++++++++++++++++++++++++++++++++
 ubifs-utils/ubifs_unpack/ubifs_unpack.c | 619 +++++++++++++++++++++++
 ubifs-utils/ubifs_unpack/ubifs_unpack.h | 107 ++++
 10 files changed, 2466 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/include/list_sort.h
 create mode 100644 ubifs-utils/lib/list_sort.c
 create mode 100644 ubifs-utils/ubifs_unpack/index.c
 create mode 100644 ubifs-utils/ubifs_unpack/replay.c
 create mode 100644 ubifs-utils/ubifs_unpack/ubifs_unpack.c
 create mode 100644 ubifs-utils/ubifs_unpack/ubifs_unpack.h

diff --git a/Makefile b/Makefile
index 72681f4..ea8dcee 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,8 @@ UBI_BINS = \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
 UBIFS_BINS = \
 	mkfs.ubifs/mkfs.ubifs \
-	ubifs_dump/ubifs_dump
+	ubifs_dump/ubifs_dump \
+	ubifs_unpack/ubifs_unpack
 JFFSX_BINS = \
 	mkfs.jffs2 sumtool jffs2reader jffs2dump
 FLASH_BINS = \
@@ -138,6 +139,10 @@ LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
 
+obj-ubifs_unpack = $(UBIFS_LIBS) ../lib/list_sort.o ../lib/scan.o ../lib/lpt.o ../lib/master.o ../../lib/libcrc32.o replay.o index.o
+LDFLAGS_ubifs_unpack = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS) -lz -llzo2
+$(call mkdep,ubifs-utils/ubifs_unpack/,ubifs_unpack,,ubi-utils/libubi.a)
+
 obj-mkfs.ubifs = $(UBIFS_LIBS)
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
diff --git a/ubifs-utils/include/emubi.h b/ubifs-utils/include/emubi.h
index e06ba7d..a2883ce 100644
--- a/ubifs-utils/include/emubi.h
+++ b/ubifs-utils/include/emubi.h
@@ -73,6 +73,7 @@ struct emubi_ctx {
 };
 
 void emubi_print(struct emubi_ctx *ctx);
+void emubi_close(struct emubi_ctx *ctx);
 int emubi_scan(struct emubi_ctx *ctx);
 int emubi_open(struct emubi_ctx *ctx, char *file);
 int emubi_leb_read(struct emubi_ctx *ctx, unsigned int lnum, unsigned int offset,
diff --git a/ubifs-utils/include/list_sort.h b/ubifs-utils/include/list_sort.h
new file mode 100644
index 0000000..60c4217
--- /dev/null
+++ b/ubifs-utils/include/list_sort.h
@@ -0,0 +1,11 @@
+#ifndef _LINUX_LIST_SORT_H
+#define _LINUX_LIST_SORT_H
+
+#include "list.h"
+
+struct list_head;
+
+void list_sort(void *priv, struct list_head *head,
+	       int (*cmp)(void *priv, struct list_head *a,
+			  struct list_head *b));
+#endif
diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
index ed04383..d9a5c97 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -53,6 +53,9 @@
 /* Largest key size supported in this implementation */
 #define CUR_MAX_KEY_LEN UBIFS_SK_LEN
 
+/* Maximum possible inode number (only 32-bit inodes are supported now) */
+#define MAX_INUM 0xFFFFFFFF
+
 #define NONDATA_JHEADS_CNT 2
 /*
  * There is no notion of truncation key because truncation nodes do not exist
@@ -332,6 +335,8 @@ enum {
  * @old_idx_sz: size of index on flash
  * @lst: lprops statistics
  *
+ * @max_inode_sz: maximum possible inode size in bytes
+ *
  * @dead_wm: LEB dead space watermark
  * @dark_wm: LEB dark space watermark
  *
@@ -374,6 +379,10 @@ enum {
  * @lsave: LPT's save table
  * @lscan_lnum: LEB number of last LPT scan
  *
+ * @replay_list: temporary list used during journal replay
+ * @replay_buds: list of buds to replay
+ * @cs_sqnum: sequence number of first node in the log (commit start node)
+ *
  * @emubi: emubi context for working with image files
  * @verbose: verbose mode enabled
  */
@@ -417,6 +426,8 @@ struct ubifs_info
 	unsigned long long old_idx_sz;
 	struct ubifs_lp_stats lst;
 
+	long long max_inode_sz;
+
 	int dead_wm;
 	int dark_wm;
 
@@ -468,6 +479,10 @@ struct ubifs_info
 
 	int max_znode_sz;
 
+	struct list_head replay_list;
+	struct list_head replay_buds;
+	unsigned long long cs_sqnum;
+
 	struct emubi_ctx *emubi;
 	int verbose;
 };
@@ -550,6 +565,23 @@ struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
 				       (UBIFS_BRANCH_SZ + c->key_len) * bnum);
 }
 
+/**
+ * ubifs_next_log_lnum - switch to the next log LEB.
+ * @c: UBIFS file-system description object
+ * @lnum: current log LEB
+ *
+ * This helper function returns the log LEB number which goes next after LEB
+ * 'lnum'.
+ */
+static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
+{
+	lnum += 1;
+	if (lnum > UBIFS_LOG_LNUM + c->log_lebs - 1)
+		lnum = UBIFS_LOG_LNUM;
+
+	return lnum;
+}
+
 /* Callback used by the 'ubifs_lpt_scan_nolock()' function */
 typedef int (*ubifs_lpt_scan_callback)(struct ubifs_info *c,
 				       const struct ubifs_lprops *lprops,
diff --git a/ubifs-utils/lib/emubi.c b/ubifs-utils/lib/emubi.c
index 1c88eea..895f60c 100644
--- a/ubifs-utils/lib/emubi.c
+++ b/ubifs-utils/lib/emubi.c
@@ -225,6 +225,26 @@ void emubi_print(struct emubi_ctx *ctx)
 	printf("\n\temubi mode: %s\n", (ctx->mode == EMUBI_MODE_MMAP) ? "mmap" : "file");
 }
 
+static void destroy_scan_lebs(struct list_head *scan_lebs)
+{
+	struct ubi_scan_leb *sleb, *ltmp;
+
+	if (!list_empty(scan_lebs)) {
+		list_for_each_entry_safe(sleb, ltmp, scan_lebs, l) {
+			list_del(&sleb->l);
+			free(sleb);
+		}
+	}
+
+}
+
+void emubi_close(struct emubi_ctx *ctx)
+{
+	free(ctx->eba);
+	free(ctx->ff_peb);
+	destroy_scan_lebs(&ctx->scan_lebs);
+}
+
 static int is_empty(struct emubi_ctx *ctx, char *pbuf, size_t len)
 {
 	return memcmp(pbuf, ctx->ff_peb, len) == 0;
diff --git a/ubifs-utils/lib/list_sort.c b/ubifs-utils/lib/list_sort.c
new file mode 100644
index 0000000..7579f12
--- /dev/null
+++ b/ubifs-utils/lib/list_sort.c
@@ -0,0 +1,157 @@
+/*
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License v2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; if not, write to the
+ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
+ * Boston, MA 021110-1307, USA.
+ */
+
+#define PROGRAM_NAME "list_sort"
+
+#include "list_sort.h"
+#include "common.h"
+#include "defs.h"
+
+#define MAX_LIST_LENGTH_BITS 20
+
+/*
+ * Returns a list organized in an intermediate format suited
+ * to chaining of merge() calls: null-terminated, no reserved or
+ * sentinel head node, "prev" links not maintained.
+ */
+static struct list_head *merge(void *priv,
+				int (*cmp)(void *priv, struct list_head *a,
+					struct list_head *b),
+				struct list_head *a, struct list_head *b)
+{
+	struct list_head head, *tail = &head;
+
+	while (a && b) {
+		/* if equal, take 'a' -- important for sort stability */
+		if ((*cmp)(priv, a, b) <= 0) {
+			tail->next = a;
+			a = a->next;
+		} else {
+			tail->next = b;
+			b = b->next;
+		}
+		tail = tail->next;
+	}
+	tail->next = a?:b;
+	return head.next;
+}
+
+/*
+ * Combine final list merge with restoration of standard doubly-linked
+ * list structure.  This approach duplicates code from merge(), but
+ * runs faster than the tidier alternatives of either a separate final
+ * prev-link restoration pass, or maintaining the prev links
+ * throughout.
+ */
+static void merge_and_restore_back_links(void *priv,
+				int (*cmp)(void *priv, struct list_head *a,
+					struct list_head *b),
+				struct list_head *head,
+				struct list_head *a, struct list_head *b)
+{
+	struct list_head *tail = head;
+	u8 count = 0;
+
+	while (a && b) {
+		/* if equal, take 'a' -- important for sort stability */
+		if ((*cmp)(priv, a, b) <= 0) {
+			tail->next = a;
+			a->prev = tail;
+			a = a->next;
+		} else {
+			tail->next = b;
+			b->prev = tail;
+			b = b->next;
+		}
+		tail = tail->next;
+	}
+	tail->next = a ? : b;
+
+	do {
+		/*
+		 * In worst cases this loop may run many iterations.
+		 * Continue callbacks to the client even though no
+		 * element comparison is needed, so the client's cmp()
+		 * routine can invoke cond_resched() periodically.
+		 */
+		if (unlikely(!(++count)))
+			(*cmp)(priv, tail->next, tail->next);
+
+		tail->next->prev = tail;
+		tail = tail->next;
+	} while (tail->next);
+
+	tail->next = head;
+	head->prev = tail;
+}
+
+/**
+ * list_sort - sort a list
+ * @priv: private data, opaque to list_sort(), passed to @cmp
+ * @head: the list to sort
+ * @cmp: the elements comparison function
+ *
+ * This function implements "merge sort", which has O(nlog(n))
+ * complexity.
+ *
+ * The comparison function @cmp must return a negative value if @a
+ * should sort before @b, and a positive value if @a should sort after
+ * @b. If @a and @b are equivalent, and their original relative
+ * ordering is to be preserved, @cmp must return 0.
+ */
+void list_sort(void *priv, struct list_head *head,
+		int (*cmp)(void *priv, struct list_head *a,
+			struct list_head *b))
+{
+	struct list_head *part[MAX_LIST_LENGTH_BITS+1]; /* sorted partial lists
+						-- last slot is a sentinel */
+	int lev;  /* index into part[] */
+	int max_lev = 0;
+	struct list_head *list;
+
+	if (list_empty(head))
+		return;
+
+	memset(part, 0, sizeof(part));
+
+	head->prev->next = NULL;
+	list = head->next;
+
+	while (list) {
+		struct list_head *cur = list;
+		list = list->next;
+		cur->next = NULL;
+
+		for (lev = 0; part[lev]; lev++) {
+			cur = merge(priv, cmp, part[lev], cur);
+			part[lev] = NULL;
+		}
+		if (lev > max_lev) {
+			if (lev >= ARRAY_SIZE(part)-1) {
+				printf("list too long for efficiency\n");
+				lev--;
+			}
+			max_lev = lev;
+		}
+		part[lev] = cur;
+	}
+
+	for (lev = 0; lev < max_lev; lev++)
+		if (part[lev])
+			list = merge(priv, cmp, part[lev], list);
+
+	merge_and_restore_back_links(priv, cmp, head, part[max_lev], list);
+}
diff --git a/ubifs-utils/ubifs_unpack/index.c b/ubifs-utils/ubifs_unpack/index.c
new file mode 100644
index 0000000..e60e32f
--- /dev/null
+++ b/ubifs-utils/ubifs_unpack/index.c
@@ -0,0 +1,648 @@
+/*
+ * Copyright (C) 2015 sigma star gmbh
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
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+#define PROGRAM_NAME "index"
+
+#include "ubifs_unpack.h"
+
+
+struct ubifs_ino_list {
+	ino_t ino;
+	struct list_head *start;
+	struct list_head l;
+};
+
+static LIST_HEAD(leaf_index);
+static LIST_HEAD(ino_index);
+
+
+static void get_key(struct ubifs_branch *zbr, union ubifs_key *key)
+{
+	union ubifs_key *tmp_key;
+
+	tmp_key = (union ubifs_key *)zbr->key;
+	key->u32[0] = le32toh(tmp_key->j32[0]);
+	key->u32[1] = le32toh(tmp_key->j32[1]);
+}
+
+static void index_add_leaf(union ubifs_key *key, unsigned int lnum,
+			   unsigned int offs, unsigned int len)
+{
+	struct ubifs_leaf *ul = xmalloc(sizeof(*ul));
+	struct ubifs_leaf *last_ul = NULL;
+
+	if (!list_empty(&leaf_index))
+		last_ul = list_last_entry(&leaf_index, struct ubifs_leaf, l);
+
+	ul->lnum = lnum;
+	ul->offs = offs;
+	ul->len = len;
+	key_copy(key, &ul->key);
+
+	if (!last_ul || key->u32[0] != last_ul->key.u32[0]) {
+		struct ubifs_ino_list *uil = xmalloc(sizeof(*uil));
+		uil->ino = key_inum(key);
+		uil->start = leaf_index.prev;
+
+
+		list_add_tail(&uil->l, &ino_index);
+	}
+
+	list_add_tail(&ul->l, &leaf_index);
+}
+
+/*
+ * ubifs_destroy_index - Cleanup index
+ * @c: ubifs context
+ */
+void ubifs_destroy_index()
+{
+	struct ubifs_leaf *leaf, *ltmp;
+	struct ubifs_ino_list *uil, *itmp;
+
+	if (!list_empty(&leaf_index)) {
+		list_for_each_entry_safe(leaf, ltmp, &leaf_index, l) {
+			list_del(&leaf->l);
+			free(leaf);
+		}
+	}
+
+	if (!list_empty(&ino_index)) {
+		list_for_each_entry_safe(uil, itmp, &ino_index, l) {
+			list_del(&uil->l);
+			free(uil);
+		}
+	}
+}
+
+/*
+ * ubifs_load_index - Load full index from media
+ * @c: ubifs context
+ * @lnum: LEB where index node is located
+ * @offs: offset in LEB
+ * @len: len if index node
+ */
+void ubifs_load_index(struct ubifs_info *c, unsigned int lnum,
+		      unsigned int offs, unsigned int len)
+{
+	struct ubifs_idx_node *idx;
+	union ubifs_key tmp_key;
+	struct ubifs_ch ch;
+	unsigned int i;
+
+	idx = xmalloc(len);
+	get_idx_node(c, idx, lnum, offs, len);
+
+	for (i = 0; i < le16toh(idx->child_cnt); i++) {
+		struct ubifs_branch *br = get_branch(idx, i);
+		unsigned int br_lnum = le32toh(br->lnum);
+		unsigned int br_offs = le32toh(br->offs);
+		unsigned int br_len = le32toh(br->len);
+
+		if (le16toh(idx->level) == 0) {
+			get_key(br, &tmp_key);
+			index_add_leaf(&tmp_key, br_lnum, br_offs, br_len);
+		}
+
+		ubifs_leb_read(c, br_lnum, &ch, br_offs, sizeof(ch));
+		if (ch.node_type == UBIFS_IDX_NODE)
+			ubifs_load_index(c, br_lnum, br_offs, br_len);
+	}
+
+	free(idx);
+}
+
+static struct ubifs_ino_list *lookup_ino_list(ino_t ino)
+{
+	struct ubifs_ino_list *uil;
+
+	list_for_each_entry(uil, &ino_index, l) {
+		if (uil->ino == ino)
+			return uil;
+	}
+
+	return NULL;
+}
+
+static struct ubifs_leaf *lookup_leaf(union ubifs_key *key, int *exact)
+{
+	struct ubifs_leaf *ul, *prev_ul = NULL;
+	struct list_head *start = NULL;
+	struct ubifs_ino_list *uil;
+	int res;
+
+	*exact = 0;
+
+	uil = lookup_ino_list(key_inum(key));
+	if (!uil)
+		return NULL;
+
+	start = uil->start;
+	assert(start);
+
+	list_for_each_entry(ul, start, l) {
+		res = keys_cmp(&ul->key, key);
+		if (res == 0) {
+			*exact = 1;
+			return ul;
+		}
+
+		if (res > 0) {
+			if (is_hash_key(key))
+				return prev_ul;
+			else
+				return NULL;
+		}
+
+		prev_ul = ul;
+	}
+
+	return NULL;
+}
+
+/*
+ * ubifs_lookup_ino_node - find INO node
+ * @c: ubifs context
+ * @ino: inode number
+ *
+ * Returns pointer to found ubifs_ino_node or NULL, if node was not found.
+ */
+struct ubifs_ino_node *ubifs_lookup_ino_node(struct ubifs_info *c, ino_t ino)
+{
+	struct ubifs_ino_node *i;
+	struct ubifs_leaf *leaf;
+	union ubifs_key key;
+	int exact;
+
+	ino_key_init(&key, ino);
+
+	leaf = lookup_leaf(&key, &exact);
+	if (!leaf || !exact)
+		return NULL;
+
+	i = xmalloc(leaf->len);
+	get_ino_node(c, i, leaf->lnum, leaf->offs, leaf->len);
+
+	return i;
+}
+
+/*
+ * ubifs_lookup_data_node - find DATA node
+ * @c: ubifs context
+ * @ino: inode number
+ * @block: block number
+ *
+ * Returns pointer to found ubifs_data_node or NULL, if node was not found.
+ */
+struct ubifs_data_node *ubifs_lookup_data_node(struct ubifs_info *c, ino_t ino,
+					       unsigned int block)
+{
+	struct ubifs_data_node *d;
+	struct ubifs_leaf *leaf;
+	union ubifs_key key;
+	int exact;
+
+	data_key_init(&key, ino, block);
+
+	leaf = lookup_leaf(&key, &exact);
+	if (!leaf || !exact)
+		return NULL;
+
+	d = xmalloc(leaf->len);
+	get_data_node(c, d, leaf->lnum, leaf->offs, leaf->len);
+
+	return d;
+}
+
+/*
+ * ubifs_next_leaf - Find the next leaf node after @ul which belongs to @ino.
+ * @ul: current leaf
+ * @ino: ino of current leaf
+ *
+ * If the end is reached, NULL is returned.
+ * If @ul is NULL, the first leaf node matching @ino is returned.
+ */
+struct ubifs_leaf *ubifs_next_leaf(struct ubifs_leaf *ul, ino_t ino)
+{
+	struct ubifs_leaf *next = NULL;
+	struct ubifs_ino_list *uil;
+
+	if (ul) {
+		next = list_next_entry(ul, l);
+		if (key_inum(&next->key) != ino)
+			next = NULL;
+	} else {
+		/* we don't have a leaf yet, so find the first */
+		uil = lookup_ino_list(ino);
+		if (uil && uil->start)
+			next = list_first_entry(uil->start, struct ubifs_leaf, l);
+	}
+
+	return next;
+}
+
+/*
+ * match_name - Compare @nm with name of node @leaf.
+ * @c: ubifs context
+ * @leaf: leaf node which name we want to match. It must use a hash key
+ * @nm: required name to match on
+ *
+ * This helps to resolve collisions for hash keys where duplicate keys are
+ * possible.
+ * Returns %-1 on error, %0 on full match and %1 on no match.
+ */
+static int match_name(struct ubifs_info *c, struct ubifs_leaf *leaf,
+		      struct qstr *nm)
+{
+	int len, ret;
+	struct ubifs_dent_node *dent;
+	assert(is_hash_key(&leaf->key));
+
+	if (!nm->name)
+		return -1;
+
+	dent = xmalloc(leaf->len);
+	get_dent_node(c, dent, leaf->lnum, leaf->offs, leaf->len);
+
+	len = (nm->len > le16toh(dent->nlen)) ? nm->len : dent->nlen;
+	ret = (memcmp(nm->name, dent->name, len) == 0) ? 0 : 1;
+
+	free(dent);
+
+	return ret;
+}
+
+/*
+ * index_remove_leaf - Safely remove a leaf from the skip list
+ * @leaf: the leaf to remove
+ * @uil: the ino_list entry. If NULL, will be search.
+ *
+ * Updates and removes ino_list entries accordingly.
+ * Returns %0 on success, %1 when last leaf was removed successfully and a
+ * value < 0 on error
+ */
+static int index_remove_leaf(struct ubifs_leaf *leaf, struct ubifs_ino_list *uil)
+{
+	struct ubifs_ino_list *next_uil;
+
+	if (!uil)
+		uil = lookup_ino_list(key_inum(&leaf->key));
+
+	if (!uil)
+		return -ENOENT;
+
+	/* fix ->start of next ino_list if we remove last node for this ino */
+	if (!list_is_last(&uil->l, &ino_index)) {
+		next_uil = list_next_entry(uil, l);
+		if (next_uil->start == &leaf->l)
+			next_uil->start = leaf->l.prev;
+	}
+
+	list_del(&leaf->l);
+	free(leaf);
+
+	/* if this was the last leaf, remove ino_list entry too */
+	leaf = list_first_entry(uil->start, struct ubifs_leaf, l);
+	if (key_inum(&leaf->key) != uil->ino) {
+		list_del(&uil->l);
+		free(uil);
+		return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * ubifs_remove_inode - Remove all nodes for @ino from index
+ * @c: ubifs context
+ * @ino: the inode number to remove
+ *
+ * Returns %0 on success or when @ino was not found, %-1 on error
+ */
+int ubifs_remove_inode(struct ubifs_info *c, ino_t ino)
+{
+	struct ubifs_ino_list *uil;
+	struct ubifs_leaf *ul;
+	int err = 0;
+
+	verbose(c->verbose, "remove all nodes of ino %lu", ino);
+
+	uil = lookup_ino_list(ino);
+	if (!uil)
+		goto out;
+
+	/* remove all leafs of this inode */
+	ul = list_first_entry(uil->start, struct ubifs_leaf, l);
+	while (key_inum(&ul->key) == ino) {
+		err = index_remove_leaf(ul, uil);
+		if (err) {
+			if (err == 1)
+				/* last entry was removed, we're done */
+				err = 0;
+			goto out;
+		}
+
+		ul = list_first_entry(uil->start, struct ubifs_leaf, l);
+	}
+
+out:
+	return err;
+}
+
+/*
+ * ubifs_remove_node_nm - Remove node with @key from index
+ * @c: ubifs context
+ * @key: the key of the node to remove
+ * @nm: when @key is a hash key, this file name is used to resolve collisions
+ *
+ * Returns %0 on success or when no matching node can be found in the index.
+ */
+int ubifs_remove_node_nm(struct ubifs_info *c, union ubifs_key *key,
+			 struct qstr *nm)
+{
+	ino_t ino;
+	struct ubifs_leaf *ul = NULL;
+	int match = -1, err = 0;
+
+	assert(c);
+	assert(key);
+	assert(nm);
+
+	ino = key_inum(key);
+	verbose(c->verbose, "remove node 0x%lx (ino %lu, type %d blk/hash %d, hash_key %d name %s)",
+		key->u64[0], ino, key_type(key), key_block(key), is_hash_key(key), nm->name);
+
+	while ((ul = ubifs_next_leaf(ul, ino))) {
+		match = keys_cmp(&ul->key, key);
+
+		/* no need to search further */
+		if (match > 0) {
+			normsg("ignoring remove of non-existant leaf from index (ino %lu)", ino);
+			break;
+		}
+
+		if (is_hash_key(key) && match == 0) {
+			match = match_name(c, ul, nm);
+			if (match < 0) {
+				err = match;
+				errmsg("name matching failed for key 0x%lx", key->u64[0]);
+				goto out;
+			}
+		}
+
+		if (match == 0) {
+			err = index_remove_leaf(ul, NULL);
+			if (err < 0)
+				errmsg("failed to remove leaf (ino %lu type %d)", ino, key_type(key));
+			/* there can only be a single match */
+			break;
+		}
+	}
+
+out:
+	return err;
+}
+
+/*
+ * ubifs_remove_node - Remove node with @key from index
+ * @c: ubifs context
+ * @key: key of node to remove
+ *
+ * This equivalent to ubifs_remove_node_nm() however, it can only be used for
+ * keys which will never collide.
+ */
+int ubifs_remove_node(struct ubifs_info *c, union ubifs_key *key)
+{
+	struct qstr empty = { .name = NULL };
+
+	if (!is_hash_key(key)) {
+		errmsg("requested key is not hash key!\n");
+		return -EINVAL;
+	}
+
+	return ubifs_remove_node_nm(c, key, &empty);
+}
+
+/**
+ * key_in_range - determine if a key falls within a range of keys.
+ * @key: key to check
+ * @from_key: lowest key in range
+ * @to_key: highest key in range
+ *
+ * This function returns %1 if the key is in range and %0 otherwise.
+ */
+static int key_in_range(union ubifs_key *key, union ubifs_key *from_key,
+			union ubifs_key *to_key)
+{
+	if (keys_cmp(key, from_key) < 0)
+		return 0;
+	if (keys_cmp(key, to_key) > 0)
+		return 0;
+	return 1;
+}
+
+/*
+ * ubifs_remove_node_range - Remove all nodes within the given key range
+ * @c: ubifs context
+ * @from_key: first key in range (min)
+ * @to_key: last key in range to remove (max)
+ *
+ * The keys must be for the same inode. No hash keys are supported.
+ */
+int ubifs_remove_node_range(struct ubifs_info *c, union ubifs_key *from_key,
+			    union ubifs_key *to_key)
+{
+	ino_t ino;
+	struct ubifs_ino_list *uil;
+	struct ubifs_leaf *ul, *rm_ul;
+	int err = 0;
+
+	ino = key_inum(from_key);
+	verbose(c->verbose, "remove node range for ino %lu type %d blk %d - %d",
+		ino, key_type(from_key), key_block(from_key), key_block(to_key));
+
+	uil = lookup_ino_list(ino);
+	if (!uil)
+		goto out;
+
+	ul = list_first_entry(uil->start, struct ubifs_leaf, l);
+	while (key_inum(&ul->key) == ino) {
+		rm_ul = ul;
+		ul = list_next_entry(ul, l);
+		if (key_in_range(&rm_ul->key, from_key, to_key)) {
+			err = index_remove_leaf(rm_ul, uil);
+			if (err) {
+				if (err == 1)
+					/* last entry was removed, we're done */
+					err = 0;
+				goto out;
+			}
+		}
+	}
+
+out:
+	return err;
+}
+
+static void index_insert_ino(struct ubifs_ino_list *uil)
+{
+	struct ubifs_ino_list *i;
+
+	list_for_each_entry(i, &ino_index, l) {
+		if (i->ino > uil->ino)
+			break;
+	}
+
+	if (&i->l != &ino_index) {
+		list_add_tail(&uil->l, &i->l);
+		uil->start = i->start;
+	} else {
+		list_add_tail(&uil->l, &ino_index);
+		uil->start = leaf_index.prev;
+	}
+}
+
+/*
+ * index_insert_leaf - Insert new leaf at correct position in sorted leaf list
+ * @c: ubifs context
+ * @key: key to insert
+ * @lnum: LEB number of new node
+ * @offs: offset in LEB @lnum
+ * @len: length of new node
+ * @nm: file name to resolve key collisions
+ *
+ * In case a corresponding leaf with the same key already exists, this leaf is
+ * just updated and no new leaf is created.
+ * Retruns %0 on succces, or a value < 0 on error.
+ */
+static int index_insert_leaf(struct ubifs_info *c,union ubifs_key *key,
+			     unsigned int lnum, unsigned int offs, unsigned int len,
+			     struct qstr *nm)
+{
+	int match, err, new_ino = 0;
+	ino_t ino = key_inum(key);
+	struct ubifs_ino_list *uil;
+	struct ubifs_leaf *leaf, *ul = NULL;
+	struct list_head *prev;
+
+	verbose(c->verbose, "add replay inode %lu on LEB %d:%d type %d", ino, lnum, offs, key_type(key));
+
+	uil = lookup_ino_list(ino);
+	if (!uil) {
+		uil = xcalloc(1, sizeof(*uil));
+		uil->ino = ino;
+		new_ino = 1;
+		goto insert;
+	}
+
+	/* find position in leaf list */
+	assert(uil->start);
+	prev = uil->start;
+	ul = list_first_entry(uil->start, struct ubifs_leaf, l);
+	do {
+		match = keys_cmp(&ul->key, key);
+
+		/* for hash keys with colliding key values, we insert the new
+		 * leaf right after the colliding ones */
+		if (match > 0)
+			break;
+
+		/* we have a collision, so check the name to
+		 * ensure this is the node we want */
+		if (is_hash_key(key) && match == 0) {
+			match = match_name(c, ul, nm);
+			if (match < 0) {
+				err = match;
+				goto out;
+			}
+		}
+
+		/* just update the existing leaf */
+		if (match == 0) {
+			ul->lnum = lnum;
+			ul->offs = offs;
+			ul->len = len;
+			err = 0;
+			goto out;
+		}
+
+		prev = &ul->l;
+		ul = ubifs_next_leaf(ul, ino);
+	} while (ul);
+
+insert:
+	leaf = xmalloc(sizeof(*leaf));
+	leaf->lnum = lnum;
+	leaf->offs = offs;
+	leaf->len = len;
+	key_copy(key, &leaf->key);
+
+	if (new_ino) {
+		index_insert_ino(uil);
+		prev = uil->start;
+	}
+
+	list_add(&leaf->l, prev);
+
+	/* move skip pointer of next ino when appending to last leaf of ino
+	 * list */
+	if (!ul && !list_is_last(&uil->l, &ino_index)) {
+		uil = list_next_entry(uil, l);
+		uil->start = &leaf->l;
+	}
+	err = 0;
+out:
+	return err;
+}
+
+/*
+ * ubifs_add_node - Add new node to index
+ * @c: ubifs context
+ * @key: key of new node
+ * @lnum: LEB where node is located
+ * @off: offset in LEB where new node starts
+ * @len: length of new node
+ *
+ * This only works for non-hash keys.
+ * Returns %0 on success, or a value < 0 on error.
+ */
+int ubifs_add_node(struct ubifs_info *c, union ubifs_key *key, int lnum,
+		   int offs, unsigned int len)
+{
+	struct qstr empty = { .name = NULL };
+	return index_insert_leaf(c, key, lnum, offs, len, &empty);
+}
+
+/*
+ * ubifs_add_node_nm - Add new node to index with collision resolution
+ * @c: ubifs context
+ * @key: key of new node
+ * @lnum: LEB where new node is located
+ * @offs: offset in LEB where node starts
+ * @len: length of new node
+ * @nm: file name used to resolve collision
+ *
+ * Returns %0 on success, or a value < 0 on error.
+ */
+int ubifs_add_node_nm(struct ubifs_info *c, union ubifs_key *key, int lnum,
+		      int offs, unsigned int len, struct qstr *nm)
+{
+	return index_insert_leaf(c, key, lnum, offs, len, nm);
+}
diff --git a/ubifs-utils/ubifs_unpack/replay.c b/ubifs-utils/ubifs_unpack/replay.c
new file mode 100644
index 0000000..a5fbce9
--- /dev/null
+++ b/ubifs-utils/ubifs_unpack/replay.c
@@ -0,0 +1,865 @@
+/*
+ * This file is a modified copy of fs/ubifs/replay.c from the Linux Kernel UBIFS.
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
+ * Authors: Adrian Hunter
+ *          Artem Bityutskiy (Битюцкий Артём)
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
+/*
+ * This file contains journal replay code. It runs when the file-system is being
+ * mounted and requires no locking.
+ *
+ * The larger is the journal, the longer it takes to scan it, so the longer it
+ * takes to mount UBIFS. This is why the journal has limited size which may be
+ * changed depending on the system requirements. But a larger journal gives
+ * faster I/O speed because it writes the index less frequently. So this is a
+ * trade-off. Also, the journal is indexed by the in-memory index (TNC), so the
+ * larger is the journal, the more memory its index may consume.
+ */
+
+#define PROGRAM_NAME "replay"
+
+#include "ubifs_unpack.h"
+#include "key.h"
+#include "list_sort.h"
+
+/**
+ * struct replay_entry - replay list entry.
+ * @lnum: logical eraseblock number of the node
+ * @offs: node offset
+ * @len: node length
+ * @deletion: non-zero if this entry corresponds to a node deletion
+ * @sqnum: node sequence number
+ * @list: links the replay list
+ * @key: node key
+ * @nm: directory entry name
+ * @old_size: truncation old size
+ * @new_size: truncation new size
+ *
+ * The replay process first scans all buds and builds the replay list, then
+ * sorts the replay list in nodes sequence number order, and then inserts all
+ * the replay entries to the TNC.
+ */
+struct replay_entry {
+	int lnum;
+	int offs;
+	int len;
+	unsigned int deletion:1;
+	unsigned long long sqnum;
+	struct list_head list;
+	union ubifs_key key;
+	union {
+		struct qstr nm;
+		struct {
+			loff_t old_size;
+			loff_t new_size;
+		};
+	};
+};
+
+/**
+ * struct ubifs_bud - bud logical eraseblock used for replay.
+ * @lnum: logical eraseblock number
+ * @start: where the (uncommitted) bud data starts
+ * @jhead: journal head number this bud belongs to
+ * @sqnum: reference node sequence number
+ * @list: link in the list buds belonging to the same journal head
+ */
+struct ubifs_bud {
+	int lnum;
+	int start;
+	int jhead;
+	unsigned long long sqnum;
+	struct list_head list;
+};
+
+/**
+ * ubifs_search_bud - search bud LEB.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number to search
+ *
+ * This function searches bud LEB @lnum. Returns bud description object in case
+ * of success and %NULL if there is no bud with this LEB number.
+ */
+static struct ubifs_bud *ubifs_search_bud(struct ubifs_info *c, int lnum)
+{
+	struct ubifs_bud *bud;
+
+	list_for_each_entry(bud, &c->replay_buds, list) {
+		if (lnum == bud->lnum)
+			return bud;
+	}
+
+	return NULL;
+}
+/**
+ * trun_remove_range - apply a replay entry for a truncation to the TNC.
+ * @c: UBIFS file-system description object
+ * @r: replay entry of truncation
+ */
+static int trun_remove_range(struct ubifs_info *c, struct replay_entry *r)
+{
+	unsigned min_blk, max_blk;
+	union ubifs_key min_key, max_key;
+	ino_t ino;
+
+	min_blk = r->new_size / UBIFS_BLOCK_SIZE;
+	if (r->new_size & (UBIFS_BLOCK_SIZE - 1))
+		min_blk += 1;
+
+	max_blk = r->old_size / UBIFS_BLOCK_SIZE;
+	if ((r->old_size & (UBIFS_BLOCK_SIZE - 1)) == 0)
+		max_blk -= 1;
+
+	ino = key_inum(&r->key);
+
+	data_key_init(&min_key, ino, min_blk);
+	data_key_init(&max_key, ino, max_blk);
+
+	return ubifs_remove_node_range(c, &min_key, &max_key);
+}
+
+/**
+ * apply_replay_entry - apply a replay entry to the TNC.
+ * @c: UBIFS file-system description object
+ * @r: replay entry to apply
+ *
+ * Apply a replay entry to the TNC.
+ */
+static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
+{
+	int err;
+
+	verbose(c->verbose, "LEB %d:%d len %d deletion %d sqnum %llu key 0x%lx",
+		 r->lnum, r->offs, r->len, r->deletion, r->sqnum, r->key.u64[0]);
+
+	if (is_hash_key(&r->key)) {
+		if (r->deletion)
+			err = ubifs_remove_node_nm(c, &r->key, &r->nm);
+		else
+			err = ubifs_add_node_nm(c, &r->key, r->lnum, r->offs,
+					        r->len, &r->nm);
+	} else {
+		if (r->deletion)
+			switch (key_type(&r->key)) {
+			case UBIFS_INO_KEY:
+			{
+				ino_t inum = key_inum(&r->key);
+
+				err = ubifs_remove_inode(c, inum);
+				break;
+			}
+			case UBIFS_TRUN_KEY:
+				err = trun_remove_range(c, r);
+				break;
+			default:
+				err = ubifs_remove_node(c, &r->key);
+				break;
+			}
+		else
+			err = ubifs_add_node(c, &r->key, r->lnum, r->offs, r->len);
+		if (err)
+			return err;
+	}
+
+	return err;
+}
+
+/**
+ * replay_entries_cmp - compare 2 replay entries.
+ * @priv: UBIFS file-system description object
+ * @a: first replay entry
+ * @a: second replay entry
+ *
+ * This is a comparios function for 'list_sort()' which compares 2 replay
+ * entries @a and @b by comparing their sequence numer.  Returns %1 if @a has
+ * greater sequence number and %-1 otherwise.
+ */
+static int replay_entries_cmp(void *priv __attribute__((unused)),
+			      struct list_head *a, struct list_head *b)
+{
+	struct replay_entry *ra, *rb;
+
+	if (a == b)
+		return 0;
+
+	ra = list_entry(a, struct replay_entry, list);
+	rb = list_entry(b, struct replay_entry, list);
+	ubifs_assert(ra->sqnum != rb->sqnum);
+	if (ra->sqnum > rb->sqnum)
+		return 1;
+	return -1;
+}
+
+/**
+ * apply_replay_list - apply the replay list to the TNC.
+ * @c: UBIFS file-system description object
+ *
+ * Apply all entries in the replay list to the TNC. Returns zero in case of
+ * success and a negative error code in case of failure.
+ */
+static int apply_replay_list(struct ubifs_info *c)
+{
+	struct replay_entry *r;
+	int err;
+
+	list_sort(c, &c->replay_list, &replay_entries_cmp);
+
+	list_for_each_entry(r, &c->replay_list, list) {
+
+		err = apply_replay_entry(c, r);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * destroy_replay_list - destroy the replay.
+ * @c: UBIFS file-system description object
+ *
+ * Destroy the replay list.
+ */
+static void destroy_replay_list(struct ubifs_info *c)
+{
+	struct replay_entry *r, *tmp;
+
+	list_for_each_entry_safe(r, tmp, &c->replay_list, list) {
+		if (is_hash_key(&r->key))
+			kfree(r->nm.name);
+		list_del(&r->list);
+		kfree(r);
+	}
+}
+
+/**
+ * insert_node - insert a node to the replay list
+ * @c: UBIFS file-system description object
+ * @lnum: node logical eraseblock number
+ * @offs: node offset
+ * @len: node length
+ * @key: node key
+ * @sqnum: sequence number
+ * @deletion: non-zero if this is a deletion
+ * @used: number of bytes in use in a LEB
+ * @old_size: truncation old size
+ * @new_size: truncation new size
+ *
+ * This function inserts a scanned non-direntry node to the replay list. The
+ * replay list contains @struct replay_entry elements, and we sort this list in
+ * sequence number order before applying it. The replay list is applied at the
+ * very end of the replay process. Since the list is sorted in sequence number
+ * order, the older modifications are applied first. This function returns zero
+ * in case of success and a negative error code in case of failure.
+ */
+static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
+		       union ubifs_key *key, unsigned long long sqnum,
+		       int deletion, int *used, loff_t old_size,
+		       loff_t new_size)
+{
+	struct replay_entry *r;
+
+	verbose(c->verbose, "add LEB %d:%d, key 0x%lx", lnum, offs, key->u64[0]);
+
+	if (key_inum(key) >= c->highest_inum)
+		c->highest_inum = key_inum(key);
+
+	r = calloc(1, sizeof(struct replay_entry));
+	if (!r)
+		return -ENOMEM;
+
+	if (!deletion)
+		*used += ALIGN(len, 8);
+	r->lnum = lnum;
+	r->offs = offs;
+	r->len = len;
+	r->deletion = !!deletion;
+	r->sqnum = sqnum;
+	key_copy(key, &r->key);
+	r->old_size = old_size;
+	r->new_size = new_size;
+
+	list_add_tail(&r->list, &c->replay_list);
+	return 0;
+}
+
+/**
+ * insert_dent - insert a directory entry node into the replay list.
+ * @c: UBIFS file-system description object
+ * @lnum: node logical eraseblock number
+ * @offs: node offset
+ * @len: node length
+ * @key: node key
+ * @name: directory entry name
+ * @nlen: directory entry name length
+ * @sqnum: sequence number
+ * @deletion: non-zero if this is a deletion
+ * @used: number of bytes in use in a LEB
+ *
+ * This function inserts a scanned directory entry node or an extended
+ * attribute entry to the replay list. Returns zero in case of success and a
+ * negative error code in case of failure.
+ */
+static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
+		       union ubifs_key *key, const char *name, int nlen,
+		       unsigned long long sqnum, int deletion, int *used)
+{
+	struct replay_entry *r;
+	char *nbuf;
+
+	verbose(c->verbose, "add LEB %d:%d, key 0x%lx ", lnum, offs, key->u64[0]);
+	if (key_inum(key) >= c->highest_inum)
+		c->highest_inum = key_inum(key);
+
+	r = calloc(1, sizeof(struct replay_entry));
+	if (!r)
+		return -ENOMEM;
+
+	nbuf = malloc(nlen + 1);
+	if (!nbuf) {
+		free(r);
+		return -ENOMEM;
+	}
+
+	if (!deletion)
+		*used += ALIGN(len, 8);
+	r->lnum = lnum;
+	r->offs = offs;
+	r->len = len;
+	r->deletion = !!deletion;
+	r->sqnum = sqnum;
+	key_copy(key, &r->key);
+	r->nm.len = nlen;
+	memcpy(nbuf, name, nlen);
+	nbuf[nlen] = '\0';
+	r->nm.name = nbuf;
+
+	list_add_tail(&r->list, &c->replay_list);
+	return 0;
+}
+
+/**
+ * ubifs_validate_entry - validate directory or extended attribute entry node.
+ * @c: UBIFS file-system description object
+ * @dent: the node to validate
+ *
+ * This function validates directory or extended attribute entry node @dent.
+ * Returns zero if the node is all right and a %-EINVAL if not.
+ */
+int ubifs_validate_entry(struct ubifs_info *c __attribute__((unused)),
+			 const struct ubifs_dent_node *dent)
+{
+	int key_type = key_type_flash(dent->key);
+	int nlen = le16_to_cpu(dent->nlen);
+
+	if (le32_to_cpu(dent->ch.len) != nlen + UBIFS_DENT_NODE_SZ + 1 ||
+	    dent->type >= UBIFS_ITYPES_CNT ||
+	    nlen > UBIFS_MAX_NLEN || dent->name[nlen] != 0 ||
+	    strnlen((const char *)dent->name, nlen) != nlen ||
+	    le64_to_cpu(dent->inum) > MAX_INUM) {
+		errmsg("bad %s node", key_type == UBIFS_DENT_KEY ?
+			  "directory entry" : "extended attribute entry");
+		return -EINVAL;
+	}
+
+	if (key_type != UBIFS_DENT_KEY && key_type != UBIFS_XENT_KEY) {
+		errmsg("bad key type %d", key_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * replay_bud - replay a bud logical eraseblock.
+ * @c: UBIFS file-system description object
+ * @b: bud entry which describes the bud
+ *
+ * This function replays bud @bud, recovers it if needed, and adds all nodes
+ * from this bud to the replay list. Returns zero in case of success and a
+ * negative error code in case of failure.
+ */
+static int replay_bud(struct ubifs_info *c, struct ubifs_bud *b)
+{
+	int err = 0, used = 0, lnum = b->lnum, offs = b->start;
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+
+	verbose(c->verbose, "replay bud LEB %d, head %d, offs %d",
+		lnum, b->jhead, offs);
+
+	// TODO LEB recovery for last bud of each journal head
+	//if (is_last)
+		/*
+		 * Recover only last LEBs in the journal heads, because power
+		 * cuts may cause corruptions only in these LEBs, because only
+		 * these LEBs could possibly be written to at the power cut
+		 * time.
+		 */
+		//sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, b->bud->jhead);
+	//else
+		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0);
+
+	if (IS_ERR(sleb))
+		return PTR_ERR(sleb);
+
+	/*
+	 * The bud does not have to start from offset zero - the beginning of
+	 * the 'lnum' LEB may contain previously committed data. One of the
+	 * things we have to do in replay is to correctly update lprops with
+	 * newer information about this LEB.
+	 *
+	 * At this point lprops thinks that this LEB has 'c->leb_size - offs'
+	 * bytes of free space because it only contain information about
+	 * committed data.
+	 *
+	 * But we know that real amount of free space is 'c->leb_size -
+	 * sleb->endpt', and the space in the 'lnum' LEB between 'offs' and
+	 * 'sleb->endpt' is used by bud data. We have to correctly calculate
+	 * how much of these data are dirty and update lprops with this
+	 * information.
+	 *
+	 * The dirt in that LEB region is comprised of padding nodes, deletion
+	 * nodes, truncation nodes and nodes which are obsoleted by subsequent
+	 * nodes in this LEB. So instead of calculating clean space, we
+	 * calculate used space ('used' variable).
+	 */
+
+	list_for_each_entry(snod, &sleb->nodes, list) {
+		int deletion = 0;
+
+		// TODO remove watermark check for unpack
+		if (snod->sqnum >= SQNUM_WATERMARK) {
+			errmsg("file system's life ended");
+			goto out_dump;
+		}
+
+		if (snod->sqnum > c->max_sqnum)
+			c->max_sqnum = snod->sqnum;
+
+		switch (snod->type) {
+		case UBIFS_INO_NODE:
+		{
+			struct ubifs_ino_node *ino = snod->node;
+			loff_t new_size = le64_to_cpu(ino->size);
+
+			if (le32_to_cpu(ino->nlink) == 0)
+				deletion = 1;
+			err = insert_node(c, lnum, snod->offs, snod->len,
+					  &snod->key, snod->sqnum, deletion,
+					  &used, 0, new_size);
+			break;
+		}
+		case UBIFS_DATA_NODE:
+		{
+			struct ubifs_data_node *dn = snod->node;
+			loff_t new_size = le32_to_cpu(dn->size) +
+					  key_block(&snod->key) *
+					  UBIFS_BLOCK_SIZE;
+
+			err = insert_node(c, lnum, snod->offs, snod->len,
+					  &snod->key, snod->sqnum, deletion,
+					  &used, 0, new_size);
+			break;
+		}
+		case UBIFS_DENT_NODE:
+		case UBIFS_XENT_NODE:
+		{
+			struct ubifs_dent_node *dent = snod->node;
+
+			err = ubifs_validate_entry(c, dent);
+			if (err)
+				goto out_dump;
+
+			err = insert_dent(c, lnum, snod->offs, snod->len,
+					  &snod->key, (const char *)dent->name,
+					  le16_to_cpu(dent->nlen), snod->sqnum,
+					  !le64_to_cpu(dent->inum), &used);
+			break;
+		}
+		case UBIFS_TRUN_NODE:
+		{
+			struct ubifs_trun_node *trun = snod->node;
+			loff_t old_size = le64_to_cpu(trun->old_size);
+			loff_t new_size = le64_to_cpu(trun->new_size);
+			union ubifs_key key;
+
+			/* Validate truncation node */
+			if (old_size < 0 || old_size > c->max_inode_sz ||
+			    new_size < 0 || new_size > c->max_inode_sz ||
+			    old_size <= new_size) {
+				errmsg("bad truncation node");
+				goto out_dump;
+			}
+
+			/*
+			 * Create a fake truncation key just to use the same
+			 * functions which expect nodes to have keys.
+			 */
+			trun_key_init(c, &key, le32_to_cpu(trun->inum));
+			err = insert_node(c, lnum, snod->offs, snod->len,
+					  &key, snod->sqnum, 1, &used,
+					  old_size, new_size);
+			break;
+		}
+		default:
+			errmsg("unexpected node type %d in bud LEB %d:%d",
+				  snod->type, lnum, snod->offs);
+			err = -EINVAL;
+			goto out_dump;
+		}
+		if (err)
+			goto out;
+	}
+
+	assert(ubifs_search_bud(c, lnum));
+	assert(sleb->endpt - offs >= used);
+	assert(sleb->endpt % c->min_io_size == 0);
+
+out:
+	ubifs_scan_destroy(sleb);
+	return err;
+
+out_dump:
+	errmsg("bad node is at LEB %d:%d", lnum, snod->offs);
+	ubifs_scan_destroy(sleb);
+	return -EINVAL;
+}
+
+/**
+ * replay_buds - replay all buds.
+ * @c: UBIFS file-system description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int replay_buds(struct ubifs_info *c)
+{
+	struct ubifs_bud *bud;
+	int err;
+	unsigned long long prev_sqnum = 0;
+
+	list_for_each_entry(bud, &c->replay_buds, list) {
+		err = replay_bud(c, bud);
+		if (err)
+			return err;
+
+		assert(bud->sqnum > prev_sqnum);
+		prev_sqnum = bud->sqnum;
+	}
+
+	return 0;
+}
+
+/**
+ * destroy_bud_list - destroy the list of buds to replay.
+ * @c: UBIFS file-system description object
+ */
+static void destroy_bud_list(struct ubifs_info *c)
+{
+	struct ubifs_bud *b;
+
+	while (!list_empty(&c->replay_buds)) {
+		b = list_entry(c->replay_buds.next, struct ubifs_bud, list);
+		list_del(&b->list);
+		kfree(b);
+	}
+}
+
+/**
+ * add_replay_bud - add a bud to the list of buds to replay.
+ * @c: UBIFS file-system description object
+ * @lnum: bud logical eraseblock number to replay
+ * @offs: bud start offset
+ * @jhead: journal head to which this bud belongs
+ * @sqnum: reference node sequence number
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int add_replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
+			  unsigned long long sqnum)
+{
+	struct ubifs_bud *bud;
+
+	verbose(c->verbose, "add replay bud LEB %d:%d, head %d", lnum, offs, jhead);
+
+	bud = malloc(sizeof(struct ubifs_bud));
+	if (!bud)
+		return -ENOMEM;
+
+	bud->lnum = lnum;
+	bud->start = offs;
+	bud->jhead = jhead;
+	bud->sqnum = sqnum;
+	list_add_tail(&bud->list, &c->replay_buds);
+
+	return 0;
+}
+
+/**
+ * validate_ref - validate a reference node.
+ * @c: UBIFS file-system description object
+ * @ref: the reference node to validate
+ * @ref_lnum: LEB number of the reference node
+ * @ref_offs: reference node offset
+ *
+ * This function returns %1 if a bud reference already exists for the LEB. %0 is
+ * returned if the reference node is new, otherwise %-EINVAL is returned if
+ * validation failed.
+ */
+static int validate_ref(struct ubifs_info *c, const struct ubifs_ref_node *ref)
+{
+	struct ubifs_bud *bud;
+	int lnum = le32_to_cpu(ref->lnum);
+	unsigned int offs = le32_to_cpu(ref->offs);
+	unsigned int jhead = le32_to_cpu(ref->jhead);
+
+	/*
+	 * ref->offs may point to the end of LEB when the journal head points
+	 * to the end of LEB and we write reference node for it during commit.
+	 * So this is why we require 'offs > c->leb_size'.
+	 */
+	if (jhead >= c->jhead_cnt || lnum >= c->leb_cnt ||
+	    lnum < c->main_first || offs > c->leb_size ||
+	    offs & (c->min_io_size - 1))
+		return -EINVAL;
+
+	/* Make sure we have not already looked at this bud */
+	bud = ubifs_search_bud(c, lnum);
+	if (bud) {
+		if (bud->jhead == jhead && bud->start <= offs)
+			return 1;
+		errmsg("bud at LEB %d:%d was already referred", lnum, offs);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * replay_log_leb - replay a log logical eraseblock.
+ * @c: UBIFS file-system description object
+ * @lnum: log logical eraseblock to replay
+ * @offs: offset to start replaying from
+ * @sbuf: scan buffer
+ *
+ * This function replays a log LEB and returns zero in case of success, %1 if
+ * this is the last LEB in the log, and a negative error code in case of
+ * failure.
+ */
+static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
+{
+	int err;
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	const struct ubifs_cs_node *node;
+
+	verbose(c->verbose, "replay log LEB %d:%d", lnum, offs);
+	sleb = ubifs_scan(c, lnum, offs, sbuf, !c->verbose);
+	if (IS_ERR(sleb)) {
+		if (PTR_ERR(sleb) != -EUCLEAN)
+			return PTR_ERR(sleb);
+		/*
+		 * Note, the below function will recover this log LEB only if
+		 * it is the last, because unclean reboots can possibly corrupt
+		 * only the tail of the log.
+		 */
+		// TODO implement recovery
+		//sleb = ubifs_recover_log_leb(c, lnum, offs, sbuf);
+		//if (IS_ERR(sleb))
+			return PTR_ERR(sleb);
+	}
+
+	if (sleb->nodes_cnt == 0) {
+		err = 1;
+		goto out;
+	}
+
+	node = sleb->buf;
+	snod = list_entry(sleb->nodes.next, struct ubifs_scan_node, list);
+	if (c->cs_sqnum == 0) {
+		/*
+		 * This is the first log LEB we are looking at, make sure that
+		 * the first node is a commit start node. Also record its
+		 * sequence number so that UBIFS can determine where the log
+		 * ends, because all nodes which were have higher sequence
+		 * numbers.
+		 */
+		if (snod->type != UBIFS_CS_NODE) {
+			errmsg("first log node at LEB %d:%d is not CS node",
+				  lnum, offs);
+			goto out_dump;
+		}
+		if (le64_to_cpu(node->cmt_no) != c->cmt_no) {
+			errmsg("first CS node at LEB %d:%d has wrong commit number %llu expected %llu",
+				  lnum, offs,
+				  (unsigned long long)le64_to_cpu(node->cmt_no),
+				  c->cmt_no);
+			goto out_dump;
+		}
+
+		c->cs_sqnum = le64_to_cpu(node->ch.sqnum);
+		verbose(c->verbose, "commit start sqnum %llu", c->cs_sqnum);
+	}
+
+	if (snod->sqnum < c->cs_sqnum) {
+		/*
+		 * This means that we reached end of log and now
+		 * look to the older log data, which was already
+		 * committed but the eraseblock was not erased (UBIFS
+		 * only un-maps it). So this basically means we have to
+		 * exit with "end of log" code.
+		 */
+		err = 1;
+		goto out;
+	}
+
+	/* Make sure the first node sits at offset zero of the LEB */
+	if (snod->offs != 0) {
+		errmsg("first node is not at zero offset");
+		goto out_dump;
+	}
+
+	list_for_each_entry(snod, &sleb->nodes, list) {
+		// TODO remove this check since we still might be able to
+		// unpack a end-of-life UBIFS!
+		if (snod->sqnum >= SQNUM_WATERMARK) {
+			errmsg("file system's life ended");
+			goto out_dump;
+		}
+
+		if (snod->sqnum < c->cs_sqnum) {
+			errmsg("bad sqnum %llu, commit sqnum %llu",
+				  snod->sqnum, c->cs_sqnum);
+			goto out_dump;
+		}
+
+		if (snod->sqnum > c->max_sqnum)
+			c->max_sqnum = snod->sqnum;
+
+		switch (snod->type) {
+		case UBIFS_REF_NODE: {
+			const struct ubifs_ref_node *ref = snod->node;
+
+			err = validate_ref(c, ref);
+			if (err == 1)
+				break; /* Already have this bud */
+			if (err)
+				goto out_dump;
+
+			err = add_replay_bud(c, le32_to_cpu(ref->lnum),
+					     le32_to_cpu(ref->offs),
+					     le32_to_cpu(ref->jhead),
+					     snod->sqnum);
+			if (err)
+				goto out;
+
+			break;
+		}
+		case UBIFS_CS_NODE:
+			/* Make sure it sits at the beginning of LEB */
+			if (snod->offs != 0) {
+				errmsg("unexpected node in log");
+				goto out_dump;
+			}
+			break;
+		default:
+			errmsg("unexpected node in log");
+			goto out_dump;
+		}
+	}
+
+	if (sleb->endpt) {
+		c->lhead_lnum = lnum;
+	}
+
+	err = !sleb->endpt;
+out:
+	ubifs_scan_destroy(sleb);
+	return err;
+
+out_dump:
+	errmsg("log error detected while replaying the log at LEB %d:%d",
+		  lnum, offs + snod->offs);
+	ubifs_scan_destroy(sleb);
+	return -EINVAL;
+}
+
+/**
+ * ubifs_replay_journal - replay journal.
+ * @c: UBIFS file-system description object
+ *
+ * This function scans the journal, replays and cleans it up. It makes sure all
+ * memory data structures related to uncommitted journal are built (dirty TNC
+ * tree, tree of buds, modified lprops, etc).
+ */
+int ubifs_replay_journal(struct ubifs_info *c)
+{
+	int err, lnum, ltail_lnum;
+
+	verbose(c->verbose, "start replaying the journal");
+	lnum = ltail_lnum = c->lhead_lnum;
+
+	do {
+		err = replay_log_leb(c, lnum, 0, c->sbuf);
+		if (err == 1) {
+			if (lnum != c->lhead_lnum)
+				/* We hit the end of the log */
+				break;
+
+			/*
+			 * The head of the log must always start with the
+			 * "commit start" node on a properly formatted UBIFS.
+			 * But we found no nodes at all, which means that
+			 * someting went wrong and we cannot proceed mounting
+			 * the file-system.
+			 */
+			errmsg("no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted",
+				  lnum, 0);
+			err = -EINVAL;
+		}
+		if (err)
+			goto out;
+		lnum = ubifs_next_log_lnum(c, lnum);
+	} while (lnum != ltail_lnum);
+
+	err = replay_buds(c);
+	if (err)
+		goto out;
+
+	err = apply_replay_list(c);
+	if (err)
+		goto out;
+
+	verbose(c->verbose, "finished, log head LEB %d, max_sqnum %llu, highest_inum %lu",
+		c->lhead_lnum, c->max_sqnum, (unsigned long)c->highest_inum);
+out:
+	destroy_replay_list(c);
+	destroy_bud_list(c);
+	return err;
+}
diff --git a/ubifs-utils/ubifs_unpack/ubifs_unpack.c b/ubifs-utils/ubifs_unpack/ubifs_unpack.c
new file mode 100644
index 0000000..321a42f
--- /dev/null
+++ b/ubifs-utils/ubifs_unpack/ubifs_unpack.c
@@ -0,0 +1,619 @@
+/*
+ * Copyright (C) 2015 sigma star gmbh
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
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+#define PROGRAM_NAME "ubifs_unpack"
+
+#include "ubifs_common.h"
+#include "ubifs_unpack.h"
+
+#include "crc32.h"
+#include "lpt.h"
+#include "key.h"
+#include "emubi.h"
+#include "master.h"
+#include "ubiutils-common.h"
+#include "compr.h"
+
+#include <getopt.h>
+#include <sys/mman.h>
+#include <lzo/lzo1x.h>
+
+extern char *optarg;
+extern int optind;
+
+struct unpack_args {
+	int peb_size;
+	int page_size;
+	int vol_id;
+	char *ubi_dev;
+
+	int emubi_mode;
+	int verbose;
+	char *out_root;
+};
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+			  " - a tool to unpack UBIFS images.";
+
+static const char optionsstr[] =
+"-o, --output=<output dir>    root directory where extracted files will be\n"
+"                             extracted to (required)\n"
+"-p, --peb-size=<bytes>       size of the physical eraseblock of the flash\n"
+"                             this UBI image is created for in bytes,\n"
+"                             kilobytes (KiB), or megabytes (MiB)\n"
+"                             (required)\n"
+"-m, --min-io-size=<bytes>    minimum input/output unit size of the flash\n"
+"                             in bytes (required)\n"
+"-n, --vol-id=<volume ID>     UBI volume ID (defaults to 0)\n"
+"-u, --ubi-dev=<device path>  UBI volume device to read from\n"
+"-e, --emubi-mode=<mode>      EMUBI mode: 'mmap' or 'file' (defaults to 'file')\n"
+"-v, --verbose                verbose output\n"
+"-h, --help                   print help message\n"
+"-V, --version                print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " [-o <output dir>] [-p <bytes>] [-m <bytes>] [-n <volume ID>] [-v]\n"
+"\t\t[--output=<output dir>] [--peb-size=<bytes>] [--min-io-size=<bytes>]\n"
+"\t\t[--vol-id=<volume ID>] [--verbose] [--help] [--version] source\n"
+"Example: " PROGRAM_NAME " -p 16KiB -m 512 ubifs.img - unpack volume 1 of image\n"
+"         'ubifs.img'";
+
+static const struct option long_opts[] = {
+	{ .name = "output",         .has_arg = 1, .flag = NULL, .val = 'o' },
+	{ .name = "peb-size",       .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "min-io-size",    .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "vol-id",         .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "ubi-dev",        .has_arg = 1, .flag = NULL, .val = 'u' },
+	{ .name = "emubi-mode",     .has_arg = 1, .flag = NULL, .val = 'e' },
+	{ .name = "verbose",        .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",        .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0 }
+};
+
+// TODO replace all assert()s with proper error handling
+// TODO cleanup logging - esp. unify key logging
+
+static int write_block(struct ubifs_info *c, struct ubifs_dent_node *dent,
+		       int block, char *dst)
+{
+	struct ubifs_data_node *d;
+	size_t out_len = UBIFS_BLOCK_SIZE;
+	int data_len, ret;
+
+	d = ubifs_lookup_data_node(c, le64toh(dent->inum), block);
+	if (!d) {
+		/* file hole */
+		return 0;
+	}
+
+	data_len = le32toh(d->ch.len) - UBIFS_DATA_NODE_SZ;
+	ret = decompress_data(d->data, data_len, dst, &out_len, d->compr_type);
+	free(d);
+
+	return ret;
+}
+
+static void __set_attributes(struct ubifs_ino_node *ino, int target_fd)
+{
+	fchmod(target_fd, le32toh(ino->mode));
+	fchown(target_fd, le32toh(ino->uid), le32toh(ino->gid));
+}
+
+static void set_attributes(struct ubifs_info *c, struct ubifs_dent_node *dent,
+			   int target_fd)
+{
+	struct ubifs_ino_node *ino;
+
+	ino = ubifs_lookup_ino_node(c, le64toh(dent->inum));
+	__set_attributes(ino, target_fd);
+	free(ino);
+}
+
+static void write_symlink(struct ubifs_info *c, struct ubifs_dent_node *dent,
+			  int parent_fd)
+{
+	struct ubifs_ino_node *ino;
+	char *link_tgt;
+	int len;
+
+	ino = ubifs_lookup_ino_node(c, le64toh(dent->inum));
+	assert(ino);
+
+	len = le32toh(ino->data_len);
+	if (len > PATH_MAX) {
+		free(ino);
+		return;
+	}
+
+	link_tgt = xmalloc(len + 1);
+	memcpy(link_tgt, ino->data, len);
+	link_tgt[len] = '\0';
+
+	symlinkat(link_tgt, parent_fd, (char *)dent->name);
+
+	free(link_tgt);
+	free(ino);
+}
+
+static void write_file(struct ubifs_info *c, struct ubifs_dent_node *dent,
+		       int parent_fd)
+{
+	int fd, i, errs;
+	char *tgt;
+	struct ubifs_ino_node *ino;
+	char nul[1] = { 0 };
+	unsigned int file_len;
+	int num_blocks;
+
+	ino = ubifs_lookup_ino_node(c, le64toh(dent->inum));
+	assert(ino);
+	file_len = le64toh(ino->size);
+
+	num_blocks = (file_len + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
+
+	fd = openat(parent_fd, (const char *)dent->name, O_CREAT|O_RDWR|O_TRUNC, 0700);
+	assert(fd);
+
+	if (!file_len) {
+		free(ino);
+		close(fd);
+		return;
+	}
+
+	lseek(fd, file_len - 1, SEEK_SET);
+	write(fd, nul, 1);
+
+	tgt = mmap(NULL, file_len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	assert(tgt != MAP_FAILED);
+	__set_attributes(ino, fd);
+	free(ino);
+	close(fd);
+
+	errs = 0;
+	for (i = 0; i < num_blocks; i++)
+		if (write_block(c, dent, i, tgt + (UBIFS_BLOCK_SIZE * i)) != 0)
+			errs++;
+
+	if (errs)
+		errmsg("decompress of %d data nodes of %s failed", errs, dent->name);
+
+	munmap(tgt, file_len);
+}
+
+static inline dev_t new_decode_dev(uint32_t dev)
+{
+	unsigned major = (dev & 0xfff00) >> 8;
+	unsigned minor = (dev & 0xff) | ((dev >> 12) & 0xfff00);
+
+	return makedev(major, minor);
+}
+
+static void write_devnode(struct ubifs_info *c, struct ubifs_dent_node *dent,
+			  int parent_fd)
+{
+	struct ubifs_ino_node *ino;
+	union ubifs_dev_desc *devd;
+	dev_t rdev;
+
+	ino = ubifs_lookup_ino_node(c, le64toh(dent->inum));
+	assert(ino);
+
+	devd = (union ubifs_dev_desc *)ino->data;
+
+	if (ino->data_len == sizeof(devd->new))
+		rdev = new_decode_dev(devd->new);
+	else if (ino->data_len == sizeof(devd->huge))
+		rdev = new_decode_dev(devd->huge);
+	else {
+		errmsg("Invalid inode data len!\n");
+		goto out;
+	}
+
+	mknodat(parent_fd, (const char *)dent->name, le32toh(ino->mode), rdev);
+
+out:
+	free(ino);
+}
+
+static void write_fifo(struct ubifs_info *c, struct ubifs_dent_node *dent,
+		       int parent_fd)
+{
+	struct ubifs_ino_node *ino;
+
+	ino = ubifs_lookup_ino_node(c, le64toh(dent->inum));
+	assert(ino);
+
+	mknodat(parent_fd, (const char *)dent->name, le32toh(ino->mode), 0);
+
+	free(ino);
+}
+
+static void unpack_dir(struct ubifs_info *c, ino_t dir_ino, int parent_fd, int depth)
+{
+	int fd;
+	struct ubifs_dent_node *dent;
+	struct ubifs_leaf *leaf = NULL;
+
+	for (;;) {
+		leaf = ubifs_next_leaf(leaf, dir_ino);
+		if (!leaf)
+			/* end of list */
+			break;
+
+		/* skip any nodes other than UBIFS_DENT_NODE. E.g extended
+		 * attribute nodes */
+		if (key_type(&leaf->key) != UBIFS_DENT_KEY)
+			continue;
+
+		dent = xmalloc(leaf->len);
+		get_dent_node(c, dent, leaf->lnum, leaf->offs, leaf->len);
+		bareverbose(c->verbose, "%.*s", depth, "                 ");
+		switch (dent->type) {
+		case UBIFS_ITYPE_REG:
+			bareverbose(c->verbose, "%s\n", dent->name);
+			write_file(c, dent, parent_fd);
+			break;
+		case UBIFS_ITYPE_DIR:
+			bareverbose(c->verbose, "[%s]\n", dent->name);
+
+			if (mkdirat(parent_fd, (const char *)dent->name, 0755) == -1) {
+				warnmsg("Unable to create %s: %m\n", dent->name);
+				continue;
+			}
+
+			fd = openat(parent_fd, (const char *)dent->name, O_RDONLY);
+			if (fd == -1) {
+				sys_errmsg_die("unpack of %s failed", dent->name);
+			}
+
+			unpack_dir(c, le64toh(dent->inum), fd, depth + 1);
+			set_attributes(c, dent, fd);
+			close(fd);
+			break;
+		case UBIFS_ITYPE_LNK:
+			write_symlink(c, dent, parent_fd);
+			break;
+		case UBIFS_ITYPE_CHR:
+		case UBIFS_ITYPE_BLK:
+			write_devnode(c, dent, parent_fd);
+			break;
+		case UBIFS_ITYPE_FIFO:
+			write_fifo(c, dent, parent_fd);
+			break;
+		case UBIFS_ITYPE_SOCK:
+			warnmsg("Ignoring UNIX domain socket %s", dent->name);
+			break;
+		default:
+			/* TODO handle other inode types (link, devices etc) */
+			warnmsg("Unsupported DENT type: %d", dent->type);
+		}
+
+		free(dent);
+	}
+}
+
+//TODO: make this common with ubifs_dump
+static void destroy_ubifs_info(struct ubifs_info *c)
+{
+	free(c->sbuf);
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
+//TODO: make this common with ubifs_dump
+static int init_constants_sb(struct ubifs_info *c)
+{
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
+		errmsg("too small LEB size %d, at least %d needed",
+			  c->leb_size, tmp);
+		return -EINVAL;
+	}
+
+	err = ubifs_calc_lpt_geom(c);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+//TODO: make this common with ubifs_dump
+static int init_ubifs_info(struct ubifs_info *c, struct ubifs_sb_node *sb)
+{
+	int err;
+	unsigned long sup_flags;
+
+        switch (sb->key_hash) {
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
+	c->key_fmt = sb->key_fmt;
+
+	switch (c->key_fmt) {
+	case UBIFS_SIMPLE_KEY_FMT:
+		c->key_len = UBIFS_SK_LEN;
+		break;
+	default:
+		errmsg("unsupported UBIFS key format");
+		err = -EINVAL;
+		goto out;
+	}
+
+	c->leb_size	 = le32_to_cpu(sb->leb_size);
+	c->min_io_size	 = le32_to_cpu(sb->min_io_size);
+	c->leb_cnt       = le32_to_cpu(sb->leb_cnt);
+	c->max_leb_cnt   = le32_to_cpu(sb->max_leb_cnt);
+	c->max_bud_bytes = le64_to_cpu(sb->max_bud_bytes);
+	c->log_lebs      = le32_to_cpu(sb->log_lebs);
+	c->lpt_lebs      = le32_to_cpu(sb->lpt_lebs);
+	c->orph_lebs     = le32_to_cpu(sb->orph_lebs);
+	c->jhead_cnt     = le32_to_cpu(sb->jhead_cnt) + NONDATA_JHEADS_CNT;
+	c->fanout        = le32_to_cpu(sb->fanout);
+	c->lsave_cnt     = le32_to_cpu(sb->lsave_cnt);
+	c->rp_size       = le64_to_cpu(sb->rp_size);
+	sup_flags        = le32_to_cpu(sb->flags);
+	c->cs_sqnum      = 0;
+
+	c->default_compr = le16_to_cpu(sb->default_compr);
+
+	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
+	c->space_fixup = !!(sup_flags & UBIFS_FLG_SPACE_FIXUP);
+
+	c->lpt_first = UBIFS_LOG_LNUM + c->log_lebs;
+	c->lpt_last = c->lpt_first + c->lpt_lebs - 1;
+	c->main_lebs = c->leb_cnt - UBIFS_SB_LEBS - UBIFS_MST_LEBS;
+	c->main_lebs -= c->log_lebs + c->lpt_lebs + c->orph_lebs;
+	c->main_first = c->leb_cnt - c->main_lebs;
+
+	c->max_inode_sz = key_max_inode_size(c);
+
+	err = init_constants_sb(c);
+
+	c->sbuf = xmalloc(c->leb_size);
+
+	INIT_LIST_HEAD(&c->replay_list);
+	INIT_LIST_HEAD(&c->replay_buds);
+out:
+	return err;
+}
+
+static int ubifs_read_sb(struct ubifs_info *c)
+{
+	struct ubifs_sb_node sb;
+
+	ubifs_leb_read(c, UBIFS_SB_LNUM, &sb, 0, sizeof(sb));
+	if (le32toh(sb.ch.magic) != UBIFS_NODE_MAGIC) {
+		return errmsg("invalid superblock node");
+	}
+
+	init_ubifs_info(c, &sb);
+
+	// TODO call validate_sb() here to properly check the sb node.
+	return 0;
+}
+
+static int unpack(struct ubifs_info *c, char *out_root)
+{
+	int fd, err = 0;
+
+	normsg("reading superblock node...");
+	err = ubifs_read_sb(c);
+	if (err)
+		goto out;
+
+	normsg("reading master node...");
+	err = ubifs_read_master(c);
+	if (err)
+		goto out;
+
+	normsg("reading on-flash index...");
+	ubifs_load_index(c, c->zroot.lnum, c->zroot.offs, c->zroot.len);
+
+	normsg("replaying journal...");
+	err = ubifs_replay_journal(c);
+	if (err)
+		goto out;
+
+	normsg("unpacking files...");
+	fd = open(out_root, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("open of output folder failed");
+
+	unpack_dir(c, 1, fd, 0);
+
+out:
+	return err;
+}
+
+static int parse_opt(int argc, char *argv[], struct unpack_args *args)
+{
+	long long val;
+	int key, err;
+
+	while ((key = getopt_long(argc, argv, "o:p:m:n:u:e:vhV", long_opts, NULL)) != -1) {
+		switch (key) {
+		case 'o':
+			args->out_root = optarg;
+			err = mkdir(args->out_root, 0755);
+			if (err && errno == EEXIST)
+				return errmsg("output directory exists");
+			else if (err)
+				return sys_errmsg("mkdir of %s failed", optarg);
+			break;
+		case 'p':
+			val = parse_bytes(optarg);
+			if (val <= 0 || val > UINT_MAX)
+				return errmsg("bad physical eraseblock size: \"%s\"", optarg);
+			args->peb_size = val;
+			break;
+		case 'm':
+			val = parse_bytes(optarg);
+			if (val <= 0 || val > UINT_MAX)
+				return errmsg("bad min. I/O unit size: \"%s\"", optarg);
+			if (!is_power_of_2(val))
+				return errmsg("min. I/O unit size must be power of 2");
+			args->page_size = val;
+			break;
+		case 'n':
+			args->vol_id = atoi(optarg);
+			if (args->vol_id < 0)
+				return errmsg("bad volume ID: \"%s\"", optarg);
+			break;
+		case 'u':
+			args->ubi_dev = optarg;
+			break;
+		case 'e':
+			if (strcasecmp(optarg, "mmap") == 0)
+				args->emubi_mode = EMUBI_MODE_MMAP;
+			else if (strcasecmp(optarg, "file") == 0)
+				args->emubi_mode = EMUBI_MODE_FILE;
+			else
+				return errmsg("invalid emubi mode %s (use 'file' or 'mmap')", optarg);
+			break;
+		case 'v':
+			args->verbose = 1;
+			break;
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n\n", optionsstr);
+			exit(EXIT_SUCCESS);
+		case 'V':
+			common_print_version();
+			exit(EXIT_SUCCESS);
+		default:
+			return errmsg("unknown option. Use -h for help");
+		}
+
+	}
+
+	if (!args->out_root)
+		return errmsg("no output directory specified");
+
+	if (!args->ubi_dev) {
+		if (optind == argc)
+			return errmsg("image file is missing (use -h for help)");
+
+		if (args->peb_size < 0)
+			return errmsg("physical eraseblock size was not specified (use -p <bytes>)");
+
+		if (args->page_size < 0)
+			return errmsg("min. I/O unit size was not specified (use -m <bytes>)");
+
+		if (args->peb_size % args->page_size)
+			return errmsg("physical eraseblock size must be multiple of min. I/O unit size");
+	}
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err;
+	struct ubifs_info info;
+	struct emubi_ctx emubi;
+	struct unpack_args args = {
+		.peb_size = -1,
+		.page_size = -1,
+		.vol_id = 0,
+		.ubi_dev = NULL,
+		.verbose = 0,
+		.out_root = NULL,
+		.emubi_mode = EMUBI_MODE_FILE,
+	};
+
+	err = parse_opt(argc, argv, &args);
+	if (err)
+		return EXIT_FAILURE;
+
+	emubi.mode = args.emubi_mode;
+	if (args.ubi_dev) {
+		output = xstrdup(args.ubi_dev);
+		open_ubi(&info, output);
+		if (open_target(&info, 1)) {
+			errmsg("Unable to open UBI volume device\n");
+			return EXIT_FAILURE;
+		}
+	}
+	else {
+		emubi.peb_size = args.peb_size;
+		emubi.page_size = args.page_size;
+		emubi.vol_id = args.vol_id;
+		info.emubi = &emubi;
+		info.verbose = args.verbose;
+
+		err = emubi_open(&emubi, argv[optind]);
+		if (err)
+			goto out;
+
+		err = emubi_scan(&emubi);
+		if (err)
+			goto out;
+
+
+		emubi_print(&emubi);
+	}
+
+	err = unpack(&info, args.out_root);
+
+out:
+	if (args.ubi_dev)
+		close_target();
+
+	ubifs_destroy_index();
+	emubi_close(&emubi);
+	destroy_ubifs_info(&info);
+
+	if (err) {
+		errmsg("unpack failed");
+		return EXIT_FAILURE;
+	}
+
+	normsg("unpack finished");
+	return EXIT_SUCCESS;
+}
diff --git a/ubifs-utils/ubifs_unpack/ubifs_unpack.h b/ubifs-utils/ubifs_unpack/ubifs_unpack.h
new file mode 100644
index 0000000..5c033e8
--- /dev/null
+++ b/ubifs-utils/ubifs_unpack/ubifs_unpack.h
@@ -0,0 +1,107 @@
+/*
+ * Copyright (C) 2015 sigma star gmbh
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
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+#ifndef __UBIFS_UNPACK_H__
+#define __UBIFS_UNPACK_H__
+
+#include "ubifs_common.h"
+#include "common.h"
+#include "ubifs.h"
+#include "scan.h"
+#include "key.h"
+#include "xalloc.h"
+#include "io.h"
+
+struct ubifs_leaf {
+	union ubifs_key key;
+	unsigned int lnum;
+	unsigned int offs;
+	unsigned int len;
+	struct list_head l;
+};
+
+static inline void get_idx_node(struct ubifs_info *c, struct ubifs_idx_node *n,
+				unsigned int lnum, unsigned int offset,
+				unsigned int len)
+{
+	ubifs_leb_read(c, lnum, n, offset, len);
+	assert(le32toh(n->ch.magic) == UBIFS_NODE_MAGIC);
+	assert(n->ch.node_type == UBIFS_IDX_NODE);
+}
+
+static inline void get_dent_node(struct ubifs_info *c, struct ubifs_dent_node *n,
+				 unsigned int lnum, unsigned int offset,
+				 unsigned int len)
+{
+	ubifs_leb_read(c, lnum, n, offset, len);
+	assert(le32toh(n->ch.magic) == UBIFS_NODE_MAGIC);
+	assert(n->ch.node_type == UBIFS_DENT_NODE);
+}
+
+static inline void get_ino_node(struct ubifs_info *c, struct ubifs_ino_node *n,
+				unsigned int lnum, unsigned int offset,
+				unsigned int len)
+{
+	ubifs_leb_read(c, lnum, n, offset, len);
+	assert(le32toh(n->ch.magic) == UBIFS_NODE_MAGIC);
+	assert(n->ch.node_type == UBIFS_INO_NODE);
+}
+
+static inline void get_data_node(struct ubifs_info *c, struct ubifs_data_node *n,
+				 unsigned int lnum, unsigned int offset,
+				 unsigned int len)
+{
+	ubifs_leb_read(c, lnum, n, offset, len);
+	assert(le32toh(n->ch.magic) == UBIFS_NODE_MAGIC);
+	assert(n->ch.node_type == UBIFS_DATA_NODE);
+}
+
+static inline struct ubifs_branch *get_branch(struct ubifs_idx_node *idx,
+					      unsigned int n)
+{
+	return (struct ubifs_branch *)(idx->branches
+		 + ((UBIFS_BRANCH_SZ + UBIFS_SK_LEN) * n));
+}
+
+/* replay.c */
+int ubifs_replay_journal(struct ubifs_info *c);
+
+/* index.c */
+void ubifs_destroy_index();
+void ubifs_load_index(struct ubifs_info *c, unsigned int lnum,
+		      unsigned int offset, unsigned int len);
+struct ubifs_ino_node *ubifs_lookup_ino_node(struct ubifs_info *c, ino_t ino);
+struct ubifs_data_node *ubifs_lookup_data_node(struct ubifs_info *c, ino_t ino,
+					       unsigned int block);
+struct ubifs_leaf *ubifs_next_leaf(struct ubifs_leaf *ul, ino_t ino);
+
+int ubifs_add_node(struct ubifs_info *c, union ubifs_key *key, int lnum,
+		   int offs, unsigned int len);
+int ubifs_add_node_nm(struct ubifs_info *c, union ubifs_key *key, int lnum,
+		      int offs, unsigned int len, struct qstr *nm);
+int ubifs_remove_inode(struct ubifs_info *c, ino_t ino);
+int ubifs_remove_node(struct ubifs_info *c, union ubifs_key *key);
+int ubifs_remove_node_nm(struct ubifs_info *c, union ubifs_key *key,
+			 struct qstr *nm);
+int ubifs_remove_node_range(struct ubifs_info *c, union ubifs_key *min_key,
+			    union ubifs_key *max_key);
+
+
+#endif
-- 
2.5.0
