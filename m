Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh5sa-00006F-Qo
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 01:08:21 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 1/3] mtd: mtdram: check offs and len in mtdram->erase
Date: Wed, 30 Sep 2015 09:01:19 +0800
Message-ID: <1443574881-12319-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <20150930002958.GC143959@google.com>
 <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
index 8e28508..627a9bc 100644
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
+	if (mtd_mod_by_eb(ofs, mtd)) {
+		pr_debug("%s: unaligned address\n", __func__);
+		ret = -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (mtd_mod_by_eb(len, mtd)) {
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
