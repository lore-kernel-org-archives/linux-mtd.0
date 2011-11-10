Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROPes-0000ak-5f
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 08:06:51 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH v2 11/16] mtd/docg3: add erase functions
Date: Thu, 10 Nov 2011 09:05:37 +0100
Message-Id: <1320912342-30147-12-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add erase capability to the docg3 driver. The erase block is
made of 2 physical blocks, as both share all 64 pages. That
makes an erase block of at least 64 kBytes.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   90 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index fd4d47b..3087b15 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1033,6 +1033,96 @@ out:
 }
 
 /**
+ * doc_erase_block - Erase a couple of blocks
+ * @docg3: the device
+ * @block0: the first block to erase (leftmost plane)
+ * @block1: the second block to erase (rightmost plane)
+ *
+ * Erase both blocks, and return operation status
+ *
+ * Returns 0 if erase successful, -EIO if erase issue, -ETIMEOUT if chip not
+ * ready for too long
+ */
+static int doc_erase_block(struct docg3 *docg3, int block0, int block1)
+{
+	int ret, sector;
+
+	doc_dbg("doc_erase_block(blocks=(%d,%d))\n", block0, block1);
+	ret = doc_reset_seq(docg3);
+	if (ret)
+		return -EIO;
+
+	doc_set_reliable_mode(docg3);
+	doc_flash_sequence(docg3, DOC_SEQ_ERASE);
+
+	sector = block0 << DOC_ADDR_BLOCK_SHIFT;
+	doc_flash_command(docg3, DOC_CMD_PROG_BLOCK_ADDR);
+	doc_setup_addr_sector(docg3, sector);
+	sector = block1 << DOC_ADDR_BLOCK_SHIFT;
+	doc_flash_command(docg3, DOC_CMD_PROG_BLOCK_ADDR);
+	doc_setup_addr_sector(docg3, sector);
+	doc_delay(docg3, 1);
+
+	doc_flash_command(docg3, DOC_CMD_ERASECYCLE2);
+	doc_delay(docg3, 2);
+
+	if (is_prot_seq_error(docg3)) {
+		doc_err("Erase blocks %d,%d error\n", block0, block1);
+		return -EIO;
+	}
+
+	return doc_write_erase_wait_status(docg3);
+}
+
+/**
+ * doc_erase - Erase a portion of the chip
+ * @mtd: the device
+ * @info: the erase info
+ *
+ * Erase a bunch of contiguous blocks, by pairs, as a "mtd" page of 1024 is
+ * split into 2 pages of 512 bytes on 2 contiguous blocks.
+ *
+ * Returns 0 if erase successful, -EINVAL if adressing error, -EIO if erase
+ * issue
+ */
+static int doc_erase(struct mtd_info *mtd, struct erase_info *info)
+{
+	struct docg3 *docg3 = mtd->priv;
+	uint64_t len;
+	int block0, block1, page, ret, ofs = 0;
+
+	doc_dbg("doc_erase(from=%lld, len=%lld\n", info->addr, info->len);
+	doc_set_device_id(docg3, docg3->device_id);
+
+	info->state = MTD_ERASE_PENDING;
+	calc_block_sector(info->addr + info->len,
+			  &block0, &block1, &page, &ofs);
+	ret = -EINVAL;
+	if (block1 > docg3->max_block || page || ofs)
+		goto reset_err;
+
+	ret = 0;
+	calc_block_sector(info->addr, &block0, &block1, &page, &ofs);
+	doc_set_reliable_mode(docg3);
+	for (len = info->len; !ret && len > 0; len -= mtd->erasesize) {
+		info->state = MTD_ERASING;
+		ret = doc_erase_block(docg3, block0, block1);
+		block0 += 2;
+		block1 += 2;
+	}
+
+	if (ret)
+		goto reset_err;
+
+	info->state = MTD_ERASE_DONE;
+	return 0;
+
+reset_err:
+	info->state = MTD_ERASE_FAILED;
+	return ret;
+}
+
+/**
  * doc_write_page - Write a single page to the chip
  * @docg3: the device
  * @to: the offset from first block and first page, in bytes, aligned on page
-- 
1.7.5.4
