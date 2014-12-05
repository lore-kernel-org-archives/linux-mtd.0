Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwpB1-0003fN-FY
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 09:27:53 +0000
Message-ID: <54817A4B.4080605@huawei.com>
Date: Fri, 5 Dec 2014 17:26:35 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v6 1/3] ubi-utils: add library file libdump for ubidump
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a preparatory patch for ubidump, an utility printing on-media
format of UBIFS partitions. This patch includes the library functions
used by ubidump.

These functions are taken from linux kernel. Some of them are modified
in order to work well in userspace.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 ubi-utils/include/libdump.h |   67 +++++++
 ubi-utils/libdump.c         |  433 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 500 insertions(+), 0 deletions(-)
 create mode 100644 ubi-utils/include/libdump.h
 create mode 100644 ubi-utils/libdump.c

diff --git a/ubi-utils/include/libdump.h b/ubi-utils/include/libdump.h
new file mode 100644
index 0000000..486af0d
--- /dev/null
+++ b/ubi-utils/include/libdump.h
@@ -0,0 +1,67 @@
+/*
+ * Copyright (C) 2006-2008 Nokia Corporation
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
+ */
+
+/*
+ * The *scan* part of code was taken from the kernel UBIFS implementation.
+ */
+
+#ifndef __LIBDUMP_H__
+#define __LIBDUMP_H__
+
+#include <mtd/ubifs-media.h>
+#include <mtd/ubi-media.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/*
+ * ubidump - dump ubi/ubifs information
+ * @lnum: logical eraseblock number
+ * @buf: buffer to dump
+ * @leb_size: size of buffer/logical eraseblock size
+ *
+ * This function dump ubi/ubifs information on the buffer.
+ */
+int ubi_dump(int lnum, void *buf, int leb_size);
+
+/* Taken from kernel UBIFS implementation */
+
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
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /*!__LIBDUMP_H__ */
diff --git a/ubi-utils/libdump.c b/ubi-utils/libdump.c
new file mode 100644
index 0000000..bbac7eb
--- /dev/null
+++ b/ubi-utils/libdump.c
@@ -0,0 +1,433 @@
+/*
+ * Copyright (C) 2006-2008 Nokia Corporation
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
+ */
+
+/*
+ * Great deal of the code was taken from kernel UBIFS implementation including
+ * fs/ubifs/scan.c and fs/ubifs/dump.c. There is a little difference in
+ * ubifs_scan(). The struct *ubifs_scan_leb* which contains the list of scanned
+ * NODEs was dropped because we can deal with each NODE directly. We don't need
+ * *corrupt* part of code either. In addition, a new parameter is added to
+ * indicate if ubifs_dump_node() is needed for a scanned NODE.
+ *
+ * Besides, ubifs_dump_node() can't dump all kinds of NODEs because some of
+ * them contain user data and useless for debugging.
+ */
+
+#define PROGRAM_NAME "libdump"
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <libdump.h>
+#include <mtd_swab.h>
+#include "common.h"
+
+static const char *get_key_fmt(int fmt)
+{
+	switch (fmt) {
+	case UBIFS_SIMPLE_KEY_FMT:
+		return "simple";
+	default:
+		return "unknown/invalid format";
+	}
+}
+
+static const char *get_key_hash(int hash)
+{
+	switch (hash) {
+	case UBIFS_KEY_HASH_R5:
+		return "R5";
+	case UBIFS_KEY_HASH_TEST:
+		return "test";
+	default:
+		return "unknown/invalid name hash";
+	}
+}
+
+static const char *node_ntype(int type)
+{
+	switch (type) {
+	case UBIFS_PAD_NODE:
+		return "padding node";
+	case UBIFS_SB_NODE:
+		return "superblock node";
+	case UBIFS_MST_NODE:
+		return "master node";
+	case UBIFS_REF_NODE:
+		return "reference node";
+	case UBIFS_INO_NODE:
+		return "inode node";
+	case UBIFS_DENT_NODE:
+		return "direntry node";
+	case UBIFS_XENT_NODE:
+		return "xentry node";
+	case UBIFS_DATA_NODE:
+		return "data node";
+	case UBIFS_TRUN_NODE:
+		return "truncate node";
+	case UBIFS_IDX_NODE:
+		return "indexing node";
+	case UBIFS_CS_NODE:
+		return "commit start node";
+	case UBIFS_ORPH_NODE:
+		return "orphan node";
+	default:
+		return "unknown node";
+	}
+}
+
+static const char *node_gtype(int type)
+{
+	switch (type) {
+	case UBIFS_NO_NODE_GROUP:
+		return "no node group";
+	case UBIFS_IN_NODE_GROUP:
+		return "in node group";
+	case UBIFS_LAST_OF_NODE_GROUP:
+		return "last of node group";
+	default:
+		return "unknown";
+	}
+}
+
+static void dump_ch(const struct ubifs_ch *ch)
+{
+	printf("\tmagic          %#x\n", le32_to_cpu(ch->magic));
+	printf("\tcrc            %#x\n", le32_to_cpu(ch->crc));
+	printf("\tnode_type      %d (%s)\n", ch->node_type,
+	       node_ntype(ch->node_type));
+	printf("\tgroup_type     %d (%s)\n", ch->group_type,
+	       node_gtype(ch->group_type));
+	printf("\tsqnum          %llu\n",
+	       (unsigned long long)le64_to_cpu(ch->sqnum));
+	printf("\tlen            %u\n", le32_to_cpu(ch->len));
+}
+
+/*
+ * This function is copied from linux kernel fs/ubifs/debug.c but
+ * just enable the dumping of PAD_NODE, SB_NODE, MST_NODE, REF_NODE
+ * and CS_NODE.
+ *
+ * One can add more functions by taking the code from kernel and
+ * put the on-media format to include/mtd/ubifs-media.h
+ */
+static void ubifs_dump_node(const void *node)
+{
+	const struct ubifs_ch *ch = node;
+
+	if (le32_to_cpu(ch->magic) != UBIFS_NODE_MAGIC) {
+		printf("Not a node, first %zu bytes:\n", UBIFS_CH_SZ);
+		return;
+	}
+
+	dump_ch(node);
+
+	switch (ch->node_type) {
+	case UBIFS_PAD_NODE:
+	{
+		const struct ubifs_pad_node *pad = node;
+
+		printf("\tpad_len        %u\n", le32_to_cpu(pad->pad_len));
+		break;
+	}
+	case UBIFS_SB_NODE:
+	{
+		const struct ubifs_sb_node *sup = node;
+		unsigned int sup_flags = le32_to_cpu(sup->flags);
+
+		printf("\tkey_hash       %d (%s)\n",
+		       (int)sup->key_hash, get_key_hash(sup->key_hash));
+		printf("\tkey_fmt        %d (%s)\n",
+		       (int)sup->key_fmt, get_key_fmt(sup->key_fmt));
+		printf("\tflags          %#x\n", sup_flags);
+		printf("\tbig_lpt        %u\n",
+		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printf("\tspace_fixup    %u\n",
+		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
+		printf("\tmin_io_size    %u\n", le32_to_cpu(sup->min_io_size));
+		printf("\tleb_size       %u\n", le32_to_cpu(sup->leb_size));
+		printf("\tleb_cnt        %u\n", le32_to_cpu(sup->leb_cnt));
+		printf("\tmax_leb_cnt    %u\n", le32_to_cpu(sup->max_leb_cnt));
+		printf("\tmax_bud_bytes  %llu\n",
+		       (unsigned long long)le64_to_cpu(sup->max_bud_bytes));
+		printf("\tlog_lebs       %u\n", le32_to_cpu(sup->log_lebs));
+		printf("\tlpt_lebs       %u\n", le32_to_cpu(sup->lpt_lebs));
+		printf("\torph_lebs      %u\n", le32_to_cpu(sup->orph_lebs));
+		printf("\tjhead_cnt      %u\n", le32_to_cpu(sup->jhead_cnt));
+		printf("\tfanout         %u\n", le32_to_cpu(sup->fanout));
+		printf("\tlsave_cnt      %u\n", le32_to_cpu(sup->lsave_cnt));
+		printf("\tdefault_compr  %u\n",
+		       (int)le16_to_cpu(sup->default_compr));
+		printf("\trp_size        %llu\n",
+		       (unsigned long long)le64_to_cpu(sup->rp_size));
+		printf("\trp_uid         %u\n", le32_to_cpu(sup->rp_uid));
+		printf("\trp_gid         %u\n", le32_to_cpu(sup->rp_gid));
+		printf("\tfmt_version    %u\n", le32_to_cpu(sup->fmt_version));
+		printf("\ttime_gran      %u\n", le32_to_cpu(sup->time_gran));
+		printf("\tUUID           %pUB\n", sup->uuid);
+		break;
+	}
+	case UBIFS_MST_NODE:
+	{
+		const struct ubifs_mst_node *mst = node;
+
+		printf("\thighest_inum   %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->highest_inum));
+		printf("\tcommit number  %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->cmt_no));
+		printf("\tflags          %#x\n", le32_to_cpu(mst->flags));
+		printf("\tlog_lnum       %u\n", le32_to_cpu(mst->log_lnum));
+		printf("\troot_lnum      %u\n", le32_to_cpu(mst->root_lnum));
+		printf("\troot_offs      %u\n", le32_to_cpu(mst->root_offs));
+		printf("\troot_len       %u\n", le32_to_cpu(mst->root_len));
+		printf("\tgc_lnum        %u\n", le32_to_cpu(mst->gc_lnum));
+		printf("\tihead_lnum     %u\n", le32_to_cpu(mst->ihead_lnum));
+		printf("\tihead_offs     %u\n", le32_to_cpu(mst->ihead_offs));
+		printf("\tindex_size     %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->index_size));
+		printf("\tlpt_lnum       %u\n", le32_to_cpu(mst->lpt_lnum));
+		printf("\tlpt_offs       %u\n", le32_to_cpu(mst->lpt_offs));
+		printf("\tnhead_lnum     %u\n", le32_to_cpu(mst->nhead_lnum));
+		printf("\tnhead_offs     %u\n", le32_to_cpu(mst->nhead_offs));
+		printf("\tltab_lnum      %u\n", le32_to_cpu(mst->ltab_lnum));
+		printf("\tltab_offs      %u\n", le32_to_cpu(mst->ltab_offs));
+		printf("\tlsave_lnum     %u\n", le32_to_cpu(mst->lsave_lnum));
+		printf("\tlsave_offs     %u\n", le32_to_cpu(mst->lsave_offs));
+		printf("\tlscan_lnum     %u\n", le32_to_cpu(mst->lscan_lnum));
+		printf("\tleb_cnt        %u\n", le32_to_cpu(mst->leb_cnt));
+		printf("\tempty_lebs     %u\n", le32_to_cpu(mst->empty_lebs));
+		printf("\tidx_lebs       %u\n", le32_to_cpu(mst->idx_lebs));
+		printf("\ttotal_free     %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_free));
+		printf("\ttotal_dirty    %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dirty));
+		printf("\ttotal_used     %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_used));
+		printf("\ttotal_dead     %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dead));
+		printf("\ttotal_dark     %llu\n",
+		       (unsigned long long)le64_to_cpu(mst->total_dark));
+		break;
+	}
+	case UBIFS_REF_NODE:
+	{
+		const struct ubifs_ref_node *ref = node;
+
+		printf("\tlnum           %u\n", le32_to_cpu(ref->lnum));
+		printf("\toffs           %u\n", le32_to_cpu(ref->offs));
+		printf("\tjhead          %u\n", le32_to_cpu(ref->jhead));
+		break;
+	}
+	case UBIFS_CS_NODE:
+	case UBIFS_INO_NODE:
+	case UBIFS_DENT_NODE:
+	case UBIFS_XENT_NODE:
+	case UBIFS_DATA_NODE:
+	case UBIFS_TRUN_NODE:
+	case UBIFS_IDX_NODE:
+	case UBIFS_ORPH_NODE:
+		break;
+	default:
+		printf("node type %d was not recognized\n",
+		       (int)ch->node_type);
+	}
+}
+
+/**
+ * scan_padding_bytes - scan for padding bytes.
+ * @buf: buffer to scan
+ * @len: length of buffer
+ *
+ * This function returns the number of padding bytes on success and
+ * %SCANNED_GARBAGE on failure.
+ */
+static int scan_padding_bytes(void *buf, int len)
+{
+	int pad_len = 0, max_pad_len = min_t(int, UBIFS_PAD_NODE_SZ, len);
+	uint8_t *p = buf;
+
+	while (pad_len < max_pad_len && *p++ == UBIFS_PADDING_BYTE)
+		pad_len += 1;
+
+	if (!pad_len || (pad_len & 7))
+		return SCANNED_GARBAGE;
+
+	printf("not a node: %d padding bytes\n", pad_len);
+
+	return pad_len;
+}
+
+/**
+ * ubifs_scan_a_node - scan for a node or padding.
+ * @buf: buffer to scan
+ * @size: logical eraseblock size
+ * @len: length of buffer
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ *
+ * This function returns a scanning code to indicate what was scanned.
+ */
+static int ubifs_scan_a_node(void *buf, int leb_size, int len, int lnum, int offs)
+{
+	struct ubifs_ch *ch = buf;
+	uint32_t magic;
+
+	magic = le32_to_cpu(ch->magic);
+
+	if (magic == 0xFFFFFFFF) {
+		printf("hit empty space at LEB %d:%d\n", lnum, offs);
+		return SCANNED_EMPTY_SPACE;
+	}
+
+	if (magic != UBIFS_NODE_MAGIC)
+		return scan_padding_bytes(buf, len);
+
+	if (len < UBIFS_CH_SZ)
+		return SCANNED_GARBAGE;
+
+	printf("scanning %s at LEB %d:%d\n",
+	       node_ntype(ch->node_type), lnum, offs);
+
+	/* No ubifs_check_nodei() perform here */
+
+	if (ch->node_type == UBIFS_PAD_NODE) {
+		struct ubifs_pad_node *pad = buf;
+		int pad_len = le32_to_cpu(pad->pad_len);
+		int node_len = le32_to_cpu(ch->len);
+
+		/* Validate the padding node */
+		if (pad_len < 0 ||
+		    offs + node_len + pad_len > leb_size) {
+			printf("bad pad node at LEB %d:%d\n", lnum, offs);
+			ubifs_dump_node(pad);
+			return SCANNED_A_BAD_PAD_NODE;
+		}
+
+		/* Make the node pads to 8-byte boundary */
+		if ((node_len + pad_len) & 7) {
+			printf("bad padding length %d - %d\n",
+			       offs, offs + node_len + pad_len);
+			return SCANNED_A_BAD_PAD_NODE;
+		}
+
+		printf("%d bytes padded at LEB %d:%d, offset now %d\n", pad_len,
+			lnum, offs, ALIGN(offs + node_len + pad_len, 8));
+
+		return node_len + pad_len;
+	}
+
+	return SCANNED_A_NODE;
+}
+
+/**
+ * ubifs_scan - scan a logical eraseblock.
+ * @lnum: logical eraseblock number
+ * @sbuf: scan buffer
+ * @size: size of @buf in bytes
+ * @offs: offset to start at (usually zero)
+ *
+ * This function scans LEB number @lnum and prints complete information about
+ * its contents. A non-zero number is returned in case of an error.
+ *
+ * Note, it's a simplified version of ubifs_scan() in kernel fs/ubifs/scan.c.
+ * The struct *ubifs_scan_leb* is removed, we directly deal with each scanned
+ * NODE. The *corrupt* part of code is removed either because this function
+ * just print the contents of an LEB without checking its correctness.
+ */
+static int ubifs_scan(int lnum, void *sbuf, int leb_size, int offs)
+{
+	void *buf = sbuf + offs;
+	int len = leb_size - offs;
+
+	printf("scan LEB %d:%d\n", lnum, offs);
+
+	while (len >= 8) {
+		struct ubifs_ch *ch = buf;
+		int node_len, ret;
+
+		printf("look at LEB %d:%d (%d bytes left)\n",
+		       lnum, offs, len);
+
+		ret = ubifs_scan_a_node(buf, leb_size, len, lnum, offs);
+		if (ret > 0) {
+			/* Padding bytes or a valid padding node */
+			offs += ret;
+			buf += ret;
+			len -= ret;
+			continue;
+		}
+
+		if (ret == SCANNED_EMPTY_SPACE)
+			/* Empty space is checked later */
+			break;
+
+		switch (ret) {
+		case SCANNED_GARBAGE:
+			printf("garbage\n");
+			goto corrupted;
+		case SCANNED_A_NODE:
+			ubifs_dump_node(buf);
+			break;
+		case SCANNED_A_CORRUPT_NODE:
+		case SCANNED_A_BAD_PAD_NODE:
+			printf("bad node\n");
+			goto corrupted;
+		default:
+			printf("unknown\n");
+			return -EINVAL;
+		}
+
+		node_len = ALIGN(le32_to_cpu(ch->len), 8);
+		offs += node_len;
+		buf += node_len;
+		len -= node_len;
+	}
+
+	for (; len > 4; offs += 4, buf = buf + 4, len -= 4)
+		if (*(uint32_t *)buf != 0xffffffff)
+			break;
+	for (; len; offs++, buf++, len--)
+		if (*(uint8_t *)buf != 0xff) {
+			printf("corrupt empty space at LEB %d:%d\n",
+			       lnum, offs);
+			goto corrupted;
+		}
+
+	printf("stop scanning LEB %d at offset %d\n", lnum, offs);
+	return 0;
+
+corrupted:
+	printf("corruption at LEB %d:%d\n", lnum, offs);
+	return -EUCLEAN;
+}
+
+/**
+ * ubidump - dump ubi/ubifs information
+ * @lnum: logical eraseblock number
+ * @buf: buffer to dump
+ * @leb_size: size of buffer/logical eraseblock size
+ *
+ * This function dump ubi/ubifs information on the buffer.
+ */
+int ubi_dump(int lnum, void *buf, int leb_size)
+{
+	int err;
+
+	err = ubifs_scan(lnum, buf, leb_size, 0);
+	if (err)
+		printf("LEB %d scanning failed, error %d\n", lnum, err);
+	return err;
+}
-- 
1.6.0.2
