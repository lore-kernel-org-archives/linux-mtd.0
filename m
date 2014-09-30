Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYolz-0005xv-Ku
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 04:10:49 +0000
Message-ID: <542A2C57.3090401@huawei.com>
Date: Tue, 30 Sep 2014 12:06:47 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v4 1/4] ubi-utils: ubidump: add ubifs-media
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a preparatory patch for ubidump, an utility to print on-media
format of UBIFS partitions. This patch contains only one file named
ubifs-media.h which is entirely taken from linux kernel. This file
descibes the on-flash format of UBIFS objects and helps us to analyse
the data on the media.

Note, the start up commit of this file is not a completely copy from
fs/ubifs/ubifs-media.h in kernel. Only the code which is used by
ubidump is now presented here.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 include/mtd/ubifs-media.h |  298 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 298 insertions(+), 0 deletions(-)
 create mode 100644 include/mtd/ubifs-media.h

diff --git a/include/mtd/ubifs-media.h b/include/mtd/ubifs-media.h
new file mode 100644
index 0000000..d59dfa6
--- /dev/null
+++ b/include/mtd/ubifs-media.h
@@ -0,0 +1,298 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ */
+
+/*
+ * This file defines the layout of UBI headers and all the other UBIFS
+ * on-flash data structures.
+ */
+
+/*
+ * Note, the entire code of this file was taken from linux kernel
+ * driver/mtd/ubi/ubi-media.h. But not all of the code in kernel was
+ * copied here because this file is *now* only used by ubidump, only
+ * the code which is needed by libdump.c is presented.
+ */
+
+#ifndef __UBIFS_MEDIA_H__
+#define __UBIFS_MEDIA_H__
+
+#include <asm/byteorder.h>
+
+/* UBIFS node magic number (must not have the padding byte first or last) */
+#define UBIFS_NODE_MAGIC  0x06101831
+
+/* UBIFS padding byte pattern (must not be first or last byte of node magic) */
+#define UBIFS_PADDING_BYTE 0xCE
+
+/* Node sizes (N.B. these are guaranteed to be multiples of 8) */
+#define UBIFS_CH_SZ        sizeof(struct ubifs_ch)
+#define UBIFS_PAD_NODE_SZ  sizeof(struct ubifs_pad_node)
+
+/*
+ * UBIFS node types.
+ *
+ * UBIFS_INO_NODE: inode node
+ * UBIFS_DATA_NODE: data node
+ * UBIFS_DENT_NODE: directory entry node
+ * UBIFS_XENT_NODE: extended attribute node
+ * UBIFS_TRUN_NODE: truncation node
+ * UBIFS_PAD_NODE: padding node
+ * UBIFS_SB_NODE: superblock node
+ * UBIFS_MST_NODE: master node
+ * UBIFS_REF_NODE: LEB reference node
+ * UBIFS_IDX_NODE: index node
+ * UBIFS_CS_NODE: commit start node
+ * UBIFS_ORPH_NODE: orphan node
+ * UBIFS_NODE_TYPES_CNT: count of supported node types
+ *
+ * Note, we index arrays by these numbers, so keep them low and contiguous.
+ * Node type constants for inodes, direntries and so on have to be the same as
+ * corresponding key type constants.
+ */
+enum {
+	UBIFS_INO_NODE,
+	UBIFS_DATA_NODE,
+	UBIFS_DENT_NODE,
+	UBIFS_XENT_NODE,
+	UBIFS_TRUN_NODE,
+	UBIFS_PAD_NODE,
+	UBIFS_SB_NODE,
+	UBIFS_MST_NODE,
+	UBIFS_REF_NODE,
+	UBIFS_IDX_NODE,
+	UBIFS_CS_NODE,
+	UBIFS_ORPH_NODE,
+	UBIFS_NODE_TYPES_CNT,
+};
+
+/*
+ * Supported key hash functions.
+ *
+ * UBIFS_KEY_HASH_R5: R5 hash
+ * UBIFS_KEY_HASH_TEST: test hash which just returns first 4 bytes of the name
+ */
+enum {
+	UBIFS_KEY_HASH_R5,
+	UBIFS_KEY_HASH_TEST,
+};
+
+/*
+ * Supported key formats.
+ *
+ * UBIFS_SIMPLE_KEY_FMT: simple key format
+ */
+enum {
+	UBIFS_SIMPLE_KEY_FMT,
+};
+
+/*
+ * Node group type (used by recovery to recover whole group or none).
+ *
+ * UBIFS_NO_NODE_GROUP: this node is not part of a group
+ * UBIFS_IN_NODE_GROUP: this node is a part of a group
+ * UBIFS_LAST_OF_NODE_GROUP: this node is the last in a group
+ */
+enum {
+	UBIFS_NO_NODE_GROUP = 0,
+	UBIFS_IN_NODE_GROUP,
+	UBIFS_LAST_OF_NODE_GROUP,
+};
+
+/*
+ * Superblock flags.
+ *
+ * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
+ * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
+ */
+enum {
+	UBIFS_FLG_BIGLPT = 0x02,
+	UBIFS_FLG_SPACE_FIXUP = 0x04,
+};
+
+/**
+ * struct ubifs_ch - common header node.
+ * @magic: UBIFS node magic number (%UBIFS_NODE_MAGIC)
+ * @crc: CRC-32 checksum of the node header
+ * @sqnum: sequence number
+ * @len: full node length
+ * @node_type: node type
+ * @group_type: node group type
+ * @padding: reserved for future, zeroes
+ *
+ * Every UBIFS node starts with this common part. If the node has a key, the
+ * key always goes next.
+ */
+struct ubifs_ch {
+	__le32 magic;
+	__le32 crc;
+	__le64 sqnum;
+	__le32 len;
+	__u8 node_type;
+	__u8 group_type;
+	__u8 padding[2];
+} __attribute__ ((packed));
+
+/**
+ * struct ubifs_pad_node - padding node.
+ * @ch: common header
+ * @pad_len: how many bytes after this node are unused (because padded)
+ * @padding: reserved for future, zeroes
+ */
+struct ubifs_pad_node {
+	struct ubifs_ch ch;
+	__le32 pad_len;
+} __attribute__ ((packed));
+
+/**
+ * struct ubifs_sb_node - superblock node.
+ * @ch: common header
+ * @padding: reserved for future, zeroes
+ * @key_hash: type of hash function used in keys
+ * @key_fmt: format of the key
+ * @flags: file-system flags (%UBIFS_FLG_BIGLPT, etc)
+ * @min_io_size: minimal input/output unit size
+ * @leb_size: logical eraseblock size in bytes
+ * @leb_cnt: count of LEBs used by file-system
+ * @max_leb_cnt: maximum count of LEBs used by file-system
+ * @max_bud_bytes: maximum amount of data stored in buds
+ * @log_lebs: log size in logical eraseblocks
+ * @lpt_lebs: number of LEBs used for lprops table
+ * @orph_lebs: number of LEBs used for recording orphans
+ * @jhead_cnt: count of journal heads
+ * @fanout: tree fanout (max. number of links per indexing node)
+ * @lsave_cnt: number of LEB numbers in LPT's save table
+ * @fmt_version: UBIFS on-flash format version
+ * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
+ * @padding1: reserved for future, zeroes
+ * @rp_uid: reserve pool UID
+ * @rp_gid: reserve pool GID
+ * @rp_size: size of the reserved pool in bytes
+ * @padding2: reserved for future, zeroes
+ * @time_gran: time granularity in nanoseconds
+ * @uuid: UUID generated when the file system image was created
+ * @ro_compat_version: UBIFS R/O compatibility version
+ */
+struct ubifs_sb_node {
+	struct ubifs_ch ch;
+	__u8 padding[2];
+	__u8 key_hash;
+	__u8 key_fmt;
+	__le32 flags;
+	__le32 min_io_size;
+	__le32 leb_size;
+	__le32 leb_cnt;
+	__le32 max_leb_cnt;
+	__le64 max_bud_bytes;
+	__le32 log_lebs;
+	__le32 lpt_lebs;
+	__le32 orph_lebs;
+	__le32 jhead_cnt;
+	__le32 fanout;
+	__le32 lsave_cnt;
+	__le32 fmt_version;
+	__le16 default_compr;
+	__u8 padding1[2];
+	__le32 rp_uid;
+	__le32 rp_gid;
+	__le64 rp_size;
+	__le32 time_gran;
+	__u8 uuid[16];
+	__le32 ro_compat_version;
+	__u8 padding2[3968];
+} __attribute__ ((packed));
+
+/**
+ * struct ubifs_mst_node - master node.
+ * @ch: common header
+ * @highest_inum: highest inode number in the committed index
+ * @cmt_no: commit number
+ * @flags: various flags (%UBIFS_MST_DIRTY, etc)
+ * @log_lnum: start of the log
+ * @root_lnum: LEB number of the root indexing node
+ * @root_offs: offset within @root_lnum
+ * @root_len: root indexing node length
+ * @gc_lnum: LEB reserved for garbage collection (%-1 value means the LEB was
+ * not reserved and should be reserved on mount)
+ * @ihead_lnum: LEB number of index head
+ * @ihead_offs: offset of index head
+ * @index_size: size of index on flash
+ * @total_free: total free space in bytes
+ * @total_dirty: total dirty space in bytes
+ * @total_used: total used space in bytes (includes only data LEBs)
+ * @total_dead: total dead space in bytes (includes only data LEBs)
+ * @total_dark: total dark space in bytes (includes only data LEBs)
+ * @lpt_lnum: LEB number of LPT root nnode
+ * @lpt_offs: offset of LPT root nnode
+ * @nhead_lnum: LEB number of LPT head
+ * @nhead_offs: offset of LPT head
+ * @ltab_lnum: LEB number of LPT's own lprops table
+ * @ltab_offs: offset of LPT's own lprops table
+ * @lsave_lnum: LEB number of LPT's save table (big model only)
+ * @lsave_offs: offset of LPT's save table (big model only)
+ * @lscan_lnum: LEB number of last LPT scan
+ * @empty_lebs: number of empty logical eraseblocks
+ * @idx_lebs: number of indexing logical eraseblocks
+ * @leb_cnt: count of LEBs used by file-system
+ * @padding: reserved for future, zeroes
+ */
+struct ubifs_mst_node {
+	struct ubifs_ch ch;
+	__le64 highest_inum;
+	__le64 cmt_no;
+	__le32 flags;
+	__le32 log_lnum;
+	__le32 root_lnum;
+	__le32 root_offs;
+	__le32 root_len;
+	__le32 gc_lnum;
+	__le32 ihead_lnum;
+	__le32 ihead_offs;
+	__le64 index_size;
+	__le64 total_free;
+	__le64 total_dirty;
+	__le64 total_used;
+	__le64 total_dead;
+	__le64 total_dark;
+	__le32 lpt_lnum;
+	__le32 lpt_offs;
+	__le32 nhead_lnum;
+	__le32 nhead_offs;
+	__le32 ltab_lnum;
+	__le32 ltab_offs;
+	__le32 lsave_lnum;
+	__le32 lsave_offs;
+	__le32 lscan_lnum;
+	__le32 empty_lebs;
+	__le32 idx_lebs;
+	__le32 leb_cnt;
+	__u8 padding[344];
+} __attribute__ ((packed));
+
+/**
+ * struct ubifs_ref_node - logical eraseblock reference node.
+ * @ch: common header
+ * @lnum: the referred logical eraseblock number
+ * @offs: start offset in the referred LEB
+ * @jhead: journal head number
+ * @padding: reserved for future, zeroes
+ */
+struct ubifs_ref_node {
+	struct ubifs_ch ch;
+	__le32 lnum;
+	__le32 offs;
+	__le32 jhead;
+	__u8 padding[28];
+} __attribute__ ((packed));
+
+#endif /*!__UBIFS_MEDIA_H__ */
-- 
1.6.0.2
