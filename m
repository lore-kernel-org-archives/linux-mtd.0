Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT9-0004Zu-LA
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:17 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 32/53] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
Date: Thu, 23 Mar 2017 09:17:41 +0900
Message-Id: <1490228282-10805-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the error handling of denali_write_page(_raw) is a bit
complicated.  If the program command fails, NAND_STATUS_FAIL is set
to the driver internal denali->status, then read out later by
denali_waitfunc().

We can avoid it by exploiting the nand_write_page() implementation.
If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
errors out immediately.  This gives the same result as returning
NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
returned to the upper MTD layer.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 12 ++++--------
 drivers/mtd/nand/denali.h |  1 -
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca00f22..9be9a1a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -996,6 +996,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_status;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
+	int ret = 0;
 
 	denali->page = page;
 
@@ -1029,13 +1030,13 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (irq_status == 0) {
 		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
 			raw_xfer);
-		denali->status = NAND_STATUS_FAIL;
+		ret = -EIO;
 	}
 
 	denali_enable_dma(denali, false);
 	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
 
-	return 0;
+	return ret;
 }
 
 /* NAND core entry points */
@@ -1196,12 +1197,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	int status = denali->status;
-
-	denali->status = 0;
-
-	return status;
+	return 0;
 }
 
 static int denali_erase(struct mtd_info *mtd, int page)
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 003d234a..14e801c 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -334,7 +334,6 @@ struct nand_buf {
 struct denali_nand_info {
 	struct nand_chip nand;
 	int flash_bank; /* currently selected chip */
-	int status;
 	int platform;
 	struct nand_buf buf;
 	struct device *dev;
-- 
2.7.4
