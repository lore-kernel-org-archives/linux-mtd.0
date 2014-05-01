Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlO-0003fh-3Q
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:46 +0000
Received: by mail-wi0-f181.google.com with SMTP id f8so404039wiw.14
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:28 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 41/47] mtd: nand: stm_nand_bch: MTD erase (BCH)
Date: Thu,  1 May 2014 10:56:48 +0100
Message-Id: <1398938214-17847-42-git-send-email-lee.jones@linaro.org>
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

Carry out the normal checks, then attempt to erase a given block.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index e742655..11735ee 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -529,6 +529,16 @@ static uint8_t bch_erase_block(struct nandi_controller *nandi,
 	return status;
 }
 
+static int bch_erase(struct mtd_info *mtd, int page)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+	uint32_t page_size = mtd->writesize;
+	loff_t offs = page * page_size;
+
+	return bch_erase_block(nandi, offs);
+}
+
 /*
  * Detect an erased page, tolerating and correcting up to a specified number of
  * bits at '0'.  (For many devices, it is now deemed within spec for an erased
@@ -1370,6 +1380,7 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 
 	chip->ecc.read_page = bch_read;
 	chip->write_page = bch_write;
+	chip->erase = bch_erase;
 
 	chip->scan_bbt = bch_scan_bbt;
 }
-- 
1.8.3.2
