Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT27-00008f-1t
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:36:15 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
Date: Tue, 21 Jul 2015 16:30:20 +0800
Message-ID: <1437467420-22019-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We should prevent user to erasing mtd device with
an unaligned offset or length.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/devices/mtdram.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 8e28508..73fa297 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -32,8 +32,29 @@ MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
 // We could store these in the mtd structure, but we only support 1 device..
 static struct mtd_info *mtd_info;
 
+static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	int ret = 0;
+
+	/* Start address must align on block boundary */
+	if (ofs % mtd->erasesize) {
+		pr_debug("%s: unaligned address\n", __func__);
+		ret = -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (len % mtd->erasesize) {
+		pr_debug("%s: length not block aligned\n", __func__);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
+	if (check_offs_len(mtd, instr->addr, instr->len))
+		return -EINVAL;
 	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
-- 
1.8.4.2
