Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0Y-0005vA-O5
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:11 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 22/27] ubifs: lpt: implement functions to scan lpt
Date: Wed, 19 Aug 2015 16:39:27 +0800
Message-ID: <1439973572-12489-23-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Implement ubifs_scan_lpt_nolock() in lpt to scan lpt.
And then we can use this function to scan the lpt
and dump all lprops out.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/lpt.h |   3 +
 ubifs-utils/lib/lpt.c     | 661 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 663 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/include/lpt.h b/ubifs-utils/include/lpt.h
index e2f7348..d4264c3 100644
--- a/ubifs-utils/include/lpt.h
+++ b/ubifs-utils/include/lpt.h
@@ -25,5 +25,8 @@
 int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt);
 int create_lpt(struct ubifs_info *c);
 int ubifs_calc_lpt_geom(struct ubifs_info *c);
+int unpack_ltab(const struct ubifs_info *c, void *buf);
+int ubifs_lpt_scan_nolock(struct ubifs_info *c, int start_lnum, int end_lnum,
+			  ubifs_lpt_scan_callback scan_cb, void *data);
 
 #endif
diff --git a/ubifs-utils/lib/lpt.c b/ubifs-utils/lib/lpt.c
index 26fb4dd..52fbcfa 100644
--- a/ubifs-utils/lib/lpt.c
+++ b/ubifs-utils/lib/lpt.c
@@ -29,6 +29,7 @@
 #include "crc16.h"
 #include "ubifs.h"
 #include "lpt.h"
+#include "lprops.h"
 #include "io.h"
 
 /**
@@ -402,7 +403,6 @@ int create_lpt(struct ubifs_info *c)
 	len = 0;
 	/* Number of leaf nodes (pnodes) */
 	cnt = (c->main_lebs + UBIFS_LPT_FANOUT - 1) >> UBIFS_LPT_FANOUT_SHIFT;
-	//printf("pnode_cnt=%d\n",cnt);
 
 	/*
 	 * To calculate the internal node branches, we keep information about
@@ -614,3 +614,662 @@ int ubifs_calc_lpt_geom(struct ubifs_info *c)
 	}
 	return 0;
 }
+
+/**
+ * struct lpt_scan_node - somewhere to put nodes while we scan LPT.
+ * @nnode: where to keep a nnode
+ * @pnode: where to keep a pnode
+ * @cnode: where to keep a cnode
+ * @in_tree: is the node in the tree in memory
+ * @ptr.nnode: pointer to the nnode (if it is an nnode) which may be here or in
+ * the tree
+ * @ptr.pnode: ditto for pnode
+ * @ptr.cnode: ditto for cnode
+ */
+struct lpt_scan_node {
+	union {
+		struct ubifs_nnode nnode;
+		struct ubifs_pnode pnode;
+		struct ubifs_cnode cnode;
+	};
+	int in_tree;
+	union {
+		struct ubifs_nnode *nnode;
+		struct ubifs_pnode *pnode;
+		struct ubifs_cnode *cnode;
+	} ptr;
+};
+
+/**
+ * ubifs_unpack_bits - unpack bit fields.
+ * @addr: address at which to unpack (passed and next address returned)
+ * @pos: bit position at which to unpack (passed and next position returned)
+ * @nrbits: number of bits of value to unpack (1-32)
+ *
+ * This functions returns the value unpacked.
+ */
+uint32_t ubifs_unpack_bits(uint8_t **addr, int *pos, int nrbits)
+{
+	const int k = 32 - nrbits;
+	uint8_t *p = *addr;
+	int b = *pos;
+	uint32_t val = 0;
+	const int bytes = (nrbits + b + 7) >> 3;
+
+	ubifs_assert(nrbits > 0);
+	ubifs_assert(nrbits <= 32);
+	ubifs_assert(*pos >= 0);
+	ubifs_assert(*pos < 8);
+	if (b) {
+		switch (bytes) {
+		case 2:
+			val = p[1];
+			break;
+		case 3:
+			val = p[1] | ((uint32_t)p[2] << 8);
+			break;
+		case 4:
+			val = p[1] | ((uint32_t)p[2] << 8) |
+				     ((uint32_t)p[3] << 16);
+			break;
+		case 5:
+			val = p[1] | ((uint32_t)p[2] << 8) |
+				     ((uint32_t)p[3] << 16) |
+				     ((uint32_t)p[4] << 24);
+		}
+		val <<= (8 - b);
+		val |= *p >> b;
+		nrbits += b;
+	} else {
+		switch (bytes) {
+		case 1:
+			val = p[0];
+			break;
+		case 2:
+			val = p[0] | ((uint32_t)p[1] << 8);
+			break;
+		case 3:
+			val = p[0] | ((uint32_t)p[1] << 8) |
+				     ((uint32_t)p[2] << 16);
+			break;
+		case 4:
+			val = p[0] | ((uint32_t)p[1] << 8) |
+				     ((uint32_t)p[2] << 16) |
+				     ((uint32_t)p[3] << 24);
+			break;
+		}
+	}
+	val <<= k;
+	val >>= k;
+	b = nrbits & 7;
+	p += nrbits >> 3;
+	*addr = p;
+	*pos = b;
+	ubifs_assert((val >> nrbits) == 0 || nrbits - b == 32);
+	return val;
+}
+/**
+ * calc_nnode_num_from_parent - calculate nnode number.
+ * @c: UBIFS file-system description object
+ * @parent: parent nnode
+ * @iip: index in parent
+ *
+ * The nnode number is a number that uniquely identifies a nnode and can be used
+ * easily to traverse the tree from the root to that nnode.
+ *
+ * This function calculates and returns the nnode number based on the parent's
+ * nnode number and the index in parent.
+ */
+static int calc_nnode_num_from_parent(const struct ubifs_info *c,
+				      struct ubifs_nnode *parent, int iip)
+{
+	int num, shft;
+
+	if (!parent)
+		return 1;
+	shft = (c->lpt_hght - parent->level) * UBIFS_LPT_FANOUT_SHIFT;
+	num = parent->num ^ (1 << shft);
+	num |= (UBIFS_LPT_FANOUT + iip) << shft;
+	return num;
+}
+
+int ubifs_unpack_nnode(const struct ubifs_info *c, void *buf,
+		       struct ubifs_nnode *nnode);
+/**
+ * scan_get_nnode - for the scan, get a nnode from either the tree or flash.
+ * @c: the UBIFS file-system description object
+ * @path: where to put the nnode
+ * @parent: parent of the nnode
+ * @iip: index in parent of the nnode
+ *
+ * This function returns a pointer to the nnode on success or a negative error
+ * code on failure.
+ */
+static struct ubifs_nnode *scan_get_nnode(struct ubifs_info *c,
+					  struct lpt_scan_node *path,
+					  struct ubifs_nnode *parent, int iip)
+{
+	struct ubifs_nbranch *branch;
+	struct ubifs_nnode *nnode;
+	int i = max_t(int, c->nnode_sz, c->pnode_sz);
+	void *buf = malloc(i);;
+	int err;
+
+	branch = &parent->nbranch[iip];
+	nnode = branch->nnode;
+	if (nnode) {
+		path->in_tree = 1;
+		path->ptr.nnode = nnode;
+		free(buf);
+		return nnode;
+	}
+	nnode = &path->nnode;
+	path->in_tree = 0;
+	path->ptr.nnode = nnode;
+	memset(nnode, 0, sizeof(struct ubifs_nnode));
+	if (branch->lnum == 0) {
+		/*
+		 * This nnode was not written which just means that the LEB
+		 * properties in the subtree below it describe empty LEBs. We
+		 * make the nnode as though we had read it, which in fact means
+		 * doing almost nothing.
+		 */
+		if (c->big_lpt)
+			nnode->num = calc_nnode_num_from_parent(c, parent, iip);
+	} else {
+		err = ubifs_read(branch->lnum * c->leb_size + branch->offs, c->nnode_sz, buf);
+		if (err) {
+			free(buf);
+			return ERR_PTR(err);
+		}
+		err = ubifs_unpack_nnode(c, buf, nnode);
+		if (err) {
+			free(buf);
+			return ERR_PTR(err);
+		}
+	}
+	if (!c->big_lpt)
+		nnode->num = calc_nnode_num_from_parent(c, parent, iip);
+	nnode->level = parent->level - 1;
+	nnode->parent = parent;
+	nnode->iip = iip;
+
+	free(buf);
+	return nnode;
+}
+/**
+ * calc_pnode_num_from_parent - calculate pnode number.
+ * @c: UBIFS file-system description object
+ * @parent: parent nnode
+ * @iip: index in parent
+ *
+ * The pnode number is a number that uniquely identifies a pnode and can be used
+ * easily to traverse the tree from the root to that pnode.
+ *
+ * This function calculates and returns the pnode number based on the parent's
+ * nnode number and the index in parent.
+ */
+static int calc_pnode_num_from_parent(const struct ubifs_info *c,
+				      struct ubifs_nnode *parent, int iip)
+{
+	int i, n = c->lpt_hght - 1, pnum = parent->num, num = 0;
+
+	for (i = 0; i < n; i++) {
+		num <<= UBIFS_LPT_FANOUT_SHIFT;
+		num |= pnum & (UBIFS_LPT_FANOUT - 1);
+		pnum >>= UBIFS_LPT_FANOUT_SHIFT;
+	}
+	num <<= UBIFS_LPT_FANOUT_SHIFT;
+	num |= iip;
+	return num;
+}
+/**
+ * set_pnode_lnum - set LEB numbers on a pnode.
+ * @c: UBIFS file-system description object
+ * @pnode: pnode to update
+ *
+ * This function calculates the LEB numbers for the LEB properties it contains
+ * based on the pnode number.
+ */
+static void set_pnode_lnum(const struct ubifs_info *c,
+			   struct ubifs_pnode *pnode)
+{
+	int i, lnum;
+
+	lnum = (pnode->num << UBIFS_LPT_FANOUT_SHIFT) + c->main_first;
+	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+		if (lnum >= c->leb_cnt)
+			return;
+		pnode->lprops[i].lnum = lnum++;
+	}
+}
+/**
+ * check_lpt_crc - check LPT node crc is correct.
+ * @c: UBIFS file-system description object
+ * @buf: buffer containing node
+ * @len: length of node
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int check_lpt_crc(const struct ubifs_info *c __attribute__((unused)), void *buf, int len)
+{
+	int pos = 0;
+	uint8_t *addr = buf;
+	uint16_t crc, calc_crc;
+
+	crc = ubifs_unpack_bits(&addr, &pos, UBIFS_LPT_CRC_BITS);
+	calc_crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
+			 len - UBIFS_LPT_CRC_BYTES);
+	if (crc != calc_crc) {
+		ubifs_err(c, "invalid crc in LPT node: crc %hx calc %hx",
+			  crc, calc_crc);
+		return -EINVAL;
+	}
+	return 0;
+}
+/**
+ * check_lpt_type - check LPT node type is correct.
+ * @c: UBIFS file-system description object
+ * @addr: address of type bit field is passed and returned updated here
+ * @pos: position of type bit field is passed and returned updated here
+ * @type: expected type
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int check_lpt_type(const struct ubifs_info *c __attribute__((unused)), uint8_t **addr,
+			  int *pos, int type)
+{
+	int node_type;
+
+	node_type = ubifs_unpack_bits(addr, pos, UBIFS_LPT_TYPE_BITS);
+	if (node_type != type) {
+		ubifs_err(c, "invalid type (%d) in LPT node type %d",
+			  node_type, type);
+		return -EINVAL;
+	}
+	return 0;
+}
+/**
+ * unpack_pnode - unpack a pnode.
+ * @c: UBIFS file-system description object
+ * @buf: buffer containing packed pnode to unpack
+ * @pnode: pnode structure to fill
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+static int unpack_pnode(const struct ubifs_info *c, void *buf,
+			struct ubifs_pnode *pnode)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0, err;
+
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_PNODE);
+	if (err)
+		return err;
+	if (c->big_lpt)
+		pnode->num = ubifs_unpack_bits(&addr, &pos, c->pcnt_bits);
+	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+		struct ubifs_lprops * const lprops = &pnode->lprops[i];
+
+		lprops->free = ubifs_unpack_bits(&addr, &pos, c->space_bits);
+		lprops->free <<= 3;
+		lprops->dirty = ubifs_unpack_bits(&addr, &pos, c->space_bits);
+		lprops->dirty <<= 3;
+
+		if (ubifs_unpack_bits(&addr, &pos, 1))
+			lprops->flags = LPROPS_INDEX;
+		else
+			lprops->flags = 0;
+		lprops->flags |= ubifs_categorize_lprops(c, lprops);
+	}
+	err = check_lpt_crc(c, buf, c->pnode_sz);
+	return err;
+}
+/**
+ * ubifs_unpack_nnode - unpack a nnode.
+ * @c: UBIFS file-system description object
+ * @buf: buffer containing packed nnode to unpack
+ * @nnode: nnode structure to fill
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_unpack_nnode(const struct ubifs_info *c, void *buf,
+		       struct ubifs_nnode *nnode)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0, err;
+
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_NNODE);
+	if (err)
+		return err;
+	if (c->big_lpt)
+		nnode->num = ubifs_unpack_bits(&addr, &pos, c->pcnt_bits);
+	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+		int lnum;
+
+		lnum = ubifs_unpack_bits(&addr, &pos, c->lpt_lnum_bits) +
+		       c->lpt_first;
+		if (lnum == c->lpt_last + 1)
+			lnum = 0;
+		nnode->nbranch[i].lnum = lnum;
+		nnode->nbranch[i].offs = ubifs_unpack_bits(&addr, &pos,
+						     c->lpt_offs_bits);
+	}
+	err = check_lpt_crc(c, buf, c->nnode_sz);
+	return err;
+}
+/**
+ * unpack_ltab - unpack the LPT's own lprops table.
+ * @c: UBIFS file-system description object
+ * @buf: buffer from which to unpack
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int unpack_ltab(const struct ubifs_info *c, void *buf)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0, err;
+
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_LTAB);
+	if (err)
+		return err;
+	for (i = 0; i < c->lpt_lebs; i++) {
+		int free = ubifs_unpack_bits(&addr, &pos, c->lpt_spc_bits);
+		int dirty = ubifs_unpack_bits(&addr, &pos, c->lpt_spc_bits);
+
+		if (free < 0 || free > c->leb_size || dirty < 0 ||
+		    dirty > c->leb_size || free + dirty > c->leb_size)
+			return -EINVAL;
+
+		c->ltab[i].free = free;
+		c->ltab[i].dirty = dirty;
+		c->ltab[i].tgc = 0;
+		c->ltab[i].cmt = 0;
+	}
+	return 0;
+}
+
+/**
+ * scan_get_pnode - for the scan, get a pnode from either the tree or flash.
+ * @c: the UBIFS file-system description object
+ * @path: where to put the pnode
+ * @parent: parent of the pnode
+ * @iip: index in parent of the pnode
+ *
+ * This function returns a pointer to the pnode on success or a negative error
+ * code on failure.
+ */
+static struct ubifs_pnode *scan_get_pnode(struct ubifs_info *c,
+					  struct lpt_scan_node *path,
+					  struct ubifs_nnode *parent, int iip)
+{
+	struct ubifs_nbranch *branch;
+	struct ubifs_pnode *pnode;
+	int i = max_t(int, c->nnode_sz, c->pnode_sz);
+	void *buf = malloc(i);;
+	int err;
+
+	branch = &parent->nbranch[iip];
+	pnode = branch->pnode;
+	if (pnode) {
+		path->in_tree = 1;
+		path->ptr.pnode = pnode;
+		free(buf);
+		return pnode;
+	}
+	pnode = &path->pnode;
+	path->in_tree = 0;
+	path->ptr.pnode = pnode;
+	memset(pnode, 0, sizeof(struct ubifs_pnode));
+	if (branch->lnum == 0) {
+		/*
+		 * This pnode was not written which just means that the LEB
+		 * properties in it describe empty LEBs. We make the pnode as
+		 * though we had read it.
+		 */
+		int i;
+
+		if (c->big_lpt)
+			pnode->num = calc_pnode_num_from_parent(c, parent, iip);
+		for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+			struct ubifs_lprops * const lprops = &pnode->lprops[i];
+
+			lprops->free = c->leb_size;
+			lprops->flags = ubifs_categorize_lprops(c, lprops);
+		}
+	} else {
+		ubifs_assert(branch->lnum >= c->lpt_first &&
+			     branch->lnum <= c->lpt_last);
+		ubifs_assert(branch->offs >= 0 && branch->offs < c->leb_size);
+		err = ubifs_read(branch->lnum * c->leb_size + branch->offs, c->pnode_sz, buf);
+		if (err) {
+			free(buf);
+			return ERR_PTR(err);
+		}
+		err = unpack_pnode(c, buf, pnode);
+		if (err) {
+			free(buf);
+			return ERR_PTR(err);
+		}
+	}
+	if (!c->big_lpt)
+		pnode->num = calc_pnode_num_from_parent(c, parent, iip);
+	pnode->parent = parent;
+	pnode->iip = iip;
+	set_pnode_lnum(c, pnode);
+	free(buf);
+	return pnode;
+}
+/**
+ * ubifs_read_nnode - read a nnode from flash and link it to the tree in memory.
+ * @c: UBIFS file-system description object
+ * @parent: parent nnode (or NULL for the root)
+ * @iip: index in parent
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
+{
+	struct ubifs_nbranch *branch = NULL;
+	struct ubifs_nnode *nnode = NULL;
+	void *buf = c->lpt_nod_buf;
+	int err, lnum, offs;
+
+	if (parent) {
+		branch = &parent->nbranch[iip];
+		lnum = branch->lnum;
+		offs = branch->offs;
+	} else {
+		lnum = c->lpt_lnum;
+		offs = c->lpt_offs;
+	}
+	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_NOFS);
+	if (!nnode) {
+		err = -ENOMEM;
+		goto out;
+	}
+	if (lnum == 0) {
+		/*
+		 * This nnode was not written which just means that the LEB
+		 * properties in the subtree below it describe empty LEBs. We
+		 * make the nnode as though we had read it, which in fact means
+		 * doing almost nothing.
+		 */
+		if (c->big_lpt)
+			nnode->num = calc_nnode_num_from_parent(c, parent, iip);
+	} else {
+		err = ubifs_read(lnum * c->leb_size + offs, c->nnode_sz, buf);
+		if (err)
+			goto out;
+		err = ubifs_unpack_nnode(c, buf, nnode);
+		if (err)
+			goto out;
+	}
+	if (!c->big_lpt)
+		nnode->num = calc_nnode_num_from_parent(c, parent, iip);
+	if (parent) {
+		branch->nnode = nnode;
+		nnode->level = parent->level - 1;
+	} else {
+		c->nroot = nnode;
+		nnode->level = c->lpt_hght;
+	}
+	nnode->parent = parent;
+	nnode->iip = iip;
+	return 0;
+
+out:
+	ubifs_err(c, "error %d reading nnode at %d:%d", err, lnum, offs);
+	kfree(nnode);
+	return err;
+}
+
+/**
+ * ubifs_lpt_scan_nolock - scan the LPT.
+ * @c: the UBIFS file-system description object
+ * @start_lnum: LEB number from which to start scanning
+ * @end_lnum: LEB number at which to stop scanning
+ * @scan_cb: callback function called for each lprops
+ * @data: data to be passed to the callback function
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_lpt_scan_nolock(struct ubifs_info *c, int start_lnum, int end_lnum,
+			  ubifs_lpt_scan_callback scan_cb, void *data)
+{
+	int err = 0, i, h, iip, shft;
+	struct ubifs_nnode *nnode;
+	struct ubifs_pnode *pnode;
+	struct lpt_scan_node *path;
+
+	if (start_lnum == -1) {
+		start_lnum = end_lnum + 1;
+		if (start_lnum >= c->leb_cnt)
+			start_lnum = c->main_first;
+	}
+
+	ubifs_assert(start_lnum >= c->main_first && start_lnum < c->leb_cnt);
+	ubifs_assert(end_lnum >= c->main_first && end_lnum < c->leb_cnt);
+
+	if (!c->nroot) {
+		err = ubifs_read_nnode(c, NULL, 0);
+		if (err)
+			return err;
+	}
+
+	path = kmalloc(sizeof(struct lpt_scan_node) * (c->lpt_hght + 1),
+		       GFP_NOFS);
+	if (!path)
+		return -ENOMEM;
+
+	path[0].ptr.nnode = c->nroot;
+	path[0].in_tree = 1;
+again:
+	/* Descend to the pnode containing start_lnum */
+	nnode = c->nroot;
+	i = start_lnum - c->main_first;
+	shft = c->lpt_hght * UBIFS_LPT_FANOUT_SHIFT;
+	for (h = 1; h < c->lpt_hght; h++) {
+		iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
+		shft -= UBIFS_LPT_FANOUT_SHIFT;
+		nnode = scan_get_nnode(c, path + h, nnode, iip);
+		if (IS_ERR(nnode)) {
+			err = PTR_ERR(nnode);
+			goto out;
+		}
+	}
+	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
+	pnode = scan_get_pnode(c, path + h, nnode, iip);
+	if (IS_ERR(pnode)) {
+		err = PTR_ERR(pnode);
+		goto out;
+	}
+	iip = (i & (UBIFS_LPT_FANOUT - 1));
+
+	/* Loop for each lprops */
+	while (1) {
+		struct ubifs_lprops *lprops = &pnode->lprops[iip];
+		int ret, lnum = lprops->lnum;
+
+		ret = scan_cb(c, lprops, path[h].in_tree, data);
+		if (ret < 0) {
+			err = ret;
+			goto out;
+		}
+		if (ret & LPT_SCAN_ADD) {
+			/* Add all the nodes in path to the tree in memory */
+			for (h = 1; h < c->lpt_hght; h++) {
+				const size_t sz = sizeof(struct ubifs_nnode);
+				struct ubifs_nnode *parent;
+
+				if (path[h].in_tree)
+					continue;
+				nnode = malloc(sz);
+				if (!nnode) {
+					err = -ENOMEM;
+					goto out;
+				}
+				memcpy(nnode, &path[h].nnode, sz);
+				parent = nnode->parent;
+				parent->nbranch[nnode->iip].nnode = nnode;
+				path[h].ptr.nnode = nnode;
+				path[h].in_tree = 1;
+				path[h + 1].cnode.parent = nnode;
+			}
+		}
+		if (ret & LPT_SCAN_STOP) {
+			err = 0;
+			break;
+		}
+		/* Get the next lprops */
+		if (lnum == end_lnum) {
+			/*
+			 * We got to the end without finding what we were
+			 * looking for
+			 */
+			err = -ENOSPC;
+			goto out;
+		}
+		if (lnum + 1 >= c->leb_cnt) {
+			/* Wrap-around to the beginning */
+			start_lnum = c->main_first;
+			goto again;
+		}
+		if (iip + 1 < UBIFS_LPT_FANOUT) {
+			/* Next lprops is in the same pnode */
+			iip += 1;
+			continue;
+		}
+		/* We need to get the next pnode. Go up until we can go right */
+		iip = pnode->iip;
+		while (1) {
+			h -= 1;
+			ubifs_assert(h >= 0);
+			nnode = path[h].ptr.nnode;
+			if (iip + 1 < UBIFS_LPT_FANOUT)
+				break;
+			iip = nnode->iip;
+		}
+		/* Go right */
+		iip += 1;
+		/* Descend to the pnode */
+		h += 1;
+		for (; h < c->lpt_hght; h++) {
+			nnode = scan_get_nnode(c, path + h, nnode, iip);
+			if (IS_ERR(nnode)) {
+				err = PTR_ERR(nnode);
+				goto out;
+			}
+			iip = 0;
+		}
+		pnode = scan_get_pnode(c, path + h, nnode, iip);
+		if (IS_ERR(pnode)) {
+			err = PTR_ERR(pnode);
+			goto out;
+		}
+		iip = 0;
+	}
+out:
+	kfree(path);
+	return err;
+}
-- 
1.8.4.2
