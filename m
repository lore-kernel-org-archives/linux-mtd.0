Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKSK-0008S8-Gm
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 16:42:13 +0000
Received: by pacex6 with SMTP id ex6so45575898pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 09:41:52 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
Date: Wed, 30 Sep 2015 22:11:43 +0530
Message-Id: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We should prevent user to erasing mtd device with an unaligned offset
or length.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

I am not sure if I should add the Signed-off-by of
Dongsheng Yang <yangds.fnst@cn.fujitsu.com> . He is the original author
and he should get the credit for that.

 drivers/mtd/devices/mtdram.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 8e28508..21b6a05 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -32,8 +32,35 @@ MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
 // We could store these in the mtd structure, but we only support 1 device..
 static struct mtd_info *mtd_info;
 
+static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	int ret = 0;
+	uint64_t temp_len, rem;
+
+	/* Start address must align on block boundary */
+	temp_len = ofs;
+	rem = do_div(temp_len, mtd->erasesize);
+	if (rem) {
+		pr_debug("%s: unaligned address\n", __func__);
+		ret = -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	temp_len = len;
+	rem = do_div(temp_len, mtd->erasesize);
+
+	if (rem) {
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
1.9.1
