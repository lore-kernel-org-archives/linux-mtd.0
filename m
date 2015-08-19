Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0U-0005ja-OV
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:05 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 17/27] ubifs: introduce scan for ubifs-utils
Date: Wed, 19 Aug 2015 16:39:22 +0800
Message-ID: <1439973572-12489-18-git-send-email-yangds.fnst@cn.fujitsu.com>
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

It's a lib to scan a leb.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/scan.h |   8 ++
 ubifs-utils/lib/scan.c     | 318 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 326 insertions(+)
 create mode 100644 ubifs-utils/include/scan.h
 create mode 100644 ubifs-utils/lib/scan.c

diff --git a/ubifs-utils/include/scan.h b/ubifs-utils/include/scan.h
new file mode 100644
index 0000000..8447adf
--- /dev/null
+++ b/ubifs-utils/include/scan.h
@@ -0,0 +1,8 @@
+#ifndef __UBIFS_SCAN_H__
+#define __UBIFS_SCAN_H__
+
+struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
+				  int offs, void *sbuf, int quiet);
+
+void ubifs_scan_destroy(struct ubifs_scan_leb *sleb);
+#endif
diff --git a/ubifs-utils/lib/scan.c b/ubifs-utils/lib/scan.c
new file mode 100644
index 0000000..69c84d1
--- /dev/null
+++ b/ubifs-utils/lib/scan.c
@@ -0,0 +1,318 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copied from kernel
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
+ * This file implements the scan which is a general-purpose function for
+ * determining what nodes are in an eraseblock. The scan is used to replay the
+ * journal, to do garbage collection. for the TNC in-the-gaps method, and by
+ * debugging functions.
+ */
+#include "ubifs_common.h"
+
+#include "ubifs.h"
+#define PROGRAM_NAME "ubifs_scan"
+#include "common.h"
+#include "key.h"
+#include "io.h"
+#include "scan.h"
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
+	int *p = buf;
+
+	while (pad_len < max_pad_len && *p++ == UBIFS_PADDING_BYTE)
+		pad_len += 1;
+
+	if (!pad_len || (pad_len & 7)) {
+		return SCANNED_GARBAGE;
+	}
+
+	return pad_len;
+}
+
+/**
+ * ubifs_scan_a_node - scan for a node or padding.
+ * @c: UBIFS file-system description object
+ * @buf: buffer to scan
+ * @len: length of buffer
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ * @quiet: print no messages
+ *
+ * This function returns a scanning code to indicate what was scanned.
+ */
+int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len,
+		      int lnum __attribute__((unused)), int offs,
+		      int quiet __attribute__((unused)))
+{
+	struct ubifs_ch *ch = buf;
+	uint32_t magic;
+
+	magic = le32_to_cpu(ch->magic);
+
+	if (magic == 0xFFFFFFFF)
+		return SCANNED_EMPTY_SPACE;
+
+	if (magic != UBIFS_NODE_MAGIC)
+		return scan_padding_bytes(buf, len);
+
+	if (len < UBIFS_CH_SZ) {
+		return SCANNED_GARBAGE;
+	}
+
+	if (ch->node_type == UBIFS_PAD_NODE) {
+		struct ubifs_pad_node *pad = buf;
+		int pad_len = le32_to_cpu(pad->pad_len);
+		int node_len = le32_to_cpu(ch->len);
+
+		/* Validate the padding node */
+		if (pad_len < 0 ||
+		    offs + node_len + pad_len > c->leb_size) {
+			return SCANNED_A_BAD_PAD_NODE;
+		}
+
+		/* Make the node pads to 8-byte boundary */
+		if ((node_len + pad_len) & 7) {
+			return SCANNED_A_BAD_PAD_NODE;
+		}
+
+		return node_len + pad_len;
+	}
+
+	return SCANNED_A_NODE;
+}
+
+/**
+ * ubifs_start_scan - create LEB scanning information at start of scan.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: offset to start at (usually zero)
+ * @sbuf: scan buffer (must be c->leb_size)
+ *
+ * This function returns the scanned information on success and a negative error
+ * code on failure.
+ */
+struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
+					int offs, void *sbuf)
+{
+	struct ubifs_scan_leb *sleb;
+	int err;
+
+	sleb = kzalloc(sizeof(struct ubifs_scan_leb), GFP_NOFS);
+	if (!sleb)
+		return ERR_PTR(-ENOMEM);
+
+	sleb->lnum = lnum;
+	INIT_LIST_HEAD(&sleb->nodes);
+	sleb->buf = sbuf;
+
+	err = ubifs_read(lnum * c->leb_size + offs, c->leb_size - offs, sbuf + offs);
+	if (err && err != -EBADMSG) {
+		kfree(sleb);
+		return ERR_PTR(err);
+	}
+
+	/*
+	 * Note, we ignore integrity errors (EBASMSG) because all the nodes are
+	 * protected by CRC checksums.
+	 */
+	return sleb;
+}
+
+/**
+ * ubifs_end_scan - update LEB scanning information at end of scan.
+ * @c: UBIFS file-system description object
+ * @sleb: scanning information
+ * @lnum: logical eraseblock number
+ * @offs: offset to start at (usually zero)
+ */
+void ubifs_end_scan(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
+		    int lnum, int offs)
+{
+	lnum = lnum;
+	ubifs_assert(offs % c->min_io_size == 0);
+
+	sleb->endpt = ALIGN(offs, c->min_io_size);
+}
+
+/**
+ * ubifs_add_snod - add a scanned node to LEB scanning information.
+ * @c: UBIFS file-system description object
+ * @sleb: scanning information
+ * @buf: buffer containing node
+ * @offs: offset of node on flash
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
+		   void *buf, int offs)
+{
+	struct ubifs_ch *ch = buf;
+	struct ubifs_ino_node *ino = buf;
+	struct ubifs_scan_node *snod;
+
+	snod = kmalloc(sizeof(struct ubifs_scan_node), GFP_NOFS);
+	if (!snod)
+		return -ENOMEM;
+
+	snod->sqnum = le64_to_cpu(ch->sqnum);
+	snod->type = ch->node_type;
+	snod->offs = offs;
+	snod->len = le32_to_cpu(ch->len);
+	snod->node = buf;
+
+	switch (ch->node_type) {
+	case UBIFS_INO_NODE:
+	case UBIFS_DENT_NODE:
+	case UBIFS_XENT_NODE:
+	case UBIFS_DATA_NODE:
+		/*
+		 * The key is in the same place in all keyed
+		 * nodes.
+		 */
+		key_read(c, &ino->key, &snod->key);
+		break;
+	default:
+		invalid_key_init(c, &snod->key);
+		break;
+	}
+	list_add_tail(&snod->list, &sleb->nodes);
+	sleb->nodes_cnt += 1;
+	return 0;
+}
+
+/**
+ * ubifs_scan - scan a logical eraseblock.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: offset to start at (usually zero)
+ * @sbuf: scan buffer (must be of @c->leb_size bytes in size)
+ * @quiet: print no messages
+ *
+ * This function scans LEB number @lnum and returns complete information about
+ * its contents. Returns the scanned information in case of success and,
+ * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
+ * of failure.
+ *
+ * If @quiet is non-zero, this function does not print large and scary
+ * error messages and flash dumps in case of errors.
+ */
+struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
+				  int offs, void *sbuf, int quiet)
+{
+	void *buf = sbuf + offs;
+	int err, len = c->leb_size - offs;
+	struct ubifs_scan_leb *sleb;
+
+	sleb = ubifs_start_scan(c, lnum, offs, sbuf);
+	if (IS_ERR(sleb))
+		return sleb;
+
+	while (len >= 8) {
+		struct ubifs_ch *ch = buf;
+		int node_len, ret;
+
+		cond_resched();
+
+		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, quiet);
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
+			if (offs == 0)
+				break;
+			goto corrupted;
+		case SCANNED_A_NODE:
+			break;
+		case SCANNED_A_CORRUPT_NODE:
+		case SCANNED_A_BAD_PAD_NODE:
+			goto corrupted;
+		default:
+			err = -EINVAL;
+			goto error;
+		}
+
+		err = ubifs_add_snod(c, sleb, buf, offs);
+		if (err)
+			goto error;
+
+		node_len = ALIGN(le32_to_cpu(ch->len), 8);
+		offs += node_len;
+		buf += node_len;
+		len -= node_len;
+	}
+
+	if (offs % c->min_io_size) {
+		goto corrupted;
+	}
+
+	ubifs_end_scan(c, sleb, lnum, offs);
+
+	for (; len > 2; offs += 2, buf = buf + 2, len -= 2)
+		if ((*(const uint8_t *)buf) != 0xff)
+			goto corrupted;
+
+	return sleb;
+
+corrupted:
+	err = -EUCLEAN;
+	ubifs_scan_destroy(sleb);
+	return ERR_PTR(err);
+
+error:
+	ubifs_scan_destroy(sleb);
+	return ERR_PTR(err);
+}
+
+/**
+ * ubifs_scan_destroy - destroy LEB scanning information.
+ * @sleb: scanning information to free
+ */
+void ubifs_scan_destroy(struct ubifs_scan_leb *sleb)
+{
+	struct ubifs_scan_node *node;
+	struct list_head *head;
+
+	head = &sleb->nodes;
+	while (!list_empty(head)) {
+		node = list_entry(head->next, struct ubifs_scan_node, list);
+		list_del(&node->list);
+		kfree(node);
+	}
+	kfree(sleb);
+}
-- 
1.8.4.2
