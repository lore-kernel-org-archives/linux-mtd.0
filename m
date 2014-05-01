Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlZ-0003ov-Qp
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:58 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so404372wiv.15
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 45/47] mtd: nand: stm_nand_bch: catch unhandled calls to read
 and write to the OOB
Date: Thu,  1 May 2014 10:56:52 +0100
Message-Id: <1398938214-17847-46-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The OOB is filled with ECC data which is handled by the hardware
controller. It's a mistake for the framework to attempt to read or
write to the OOB area. If that happens, we'll BUG() out.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 89f1263..bec7e23 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1441,6 +1441,20 @@ static int bch_scan_bbt(struct mtd_info *mtd)
 	return 0;
 }
 
+static int bch_mtd_read_oob(struct mtd_info *mtd,
+			    struct nand_chip *chip, int page)
+{
+	BUG();
+	return 0;
+}
+
+static int bch_mtd_write_oob(struct mtd_info *mtd,
+			     struct nand_chip *chip, int page)
+{
+	BUG();
+	return 0;
+}
+
 static int bch_block_isbad(struct mtd_info *mtd, loff_t offs, int getchip)
 {
 	struct nand_chip *chip = mtd->priv;
@@ -1598,6 +1612,9 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	mtd->ecclayout = &info->ecclayout;
 	mtd->subpage_sft = 0;
 
+	chip->ecc.read_oob = bch_mtd_read_oob;
+	chip->ecc.write_oob = bch_mtd_write_oob;
+
 	chip->ecc.read_page = bch_read;
 	chip->write_page = bch_write;
 	chip->erase = bch_erase;
-- 
1.8.3.2
