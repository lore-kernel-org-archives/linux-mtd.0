Received: from conuserg-09.nifty.com ([210.131.2.76])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqTT-0001GS-AI
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:33 +0000
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
Subject: [RESEND PATCH v2 49/53] mtd: nand: denali: support hardware-assisted
 erased page detection
Date: Thu, 23 Mar 2017 09:17:58 +0900
Message-Id: <1490228282-10805-23-git-send-email-yamada.masahiro@socionext.com>
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

Recent versions of this IP support automatic erased page detection.
If an erased page is detected on reads, the controller does not set
INTR__ECC_UNCOR_ERR, but INTR__ERASED_PAGE.  If this feature is
supported, the driver can use this information instead of calling
nand_check_erased_ecc_chunk().

The detection of erased page is based on the number of zeros in the
page; if the number of zeros is less than the value in the field
ERASED_THRESHOLD, the page is assumed as erased.

Set the ERASED_THRESHOLD to (chip->ecc.strength + 1).  This is the
worst case where all the bitflips come from the same ECC sector.
This field is Reserved for older IP versions, so this commit has
no impact on them.

One thing worth mentioning is the driver still needs to fill the
buffer with 0xff in the case because the ECC correction engine has
already manipulated the data in the buffer.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 10 +++++++++-
 drivers/mtd/nand/denali.h |  5 +++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1b0e79c..c3a7f7b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -559,6 +559,9 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 	if (!(irq_status & INTR__PAGE_XFER_INC))
 		return -EIO;
 
+	if (irq_status & INTR__ERASED_PAGE)
+		memset(buf, 0xff, size);
+
 	return irq_status & ecc_err_mask ? -EBADMSG : 0;
 }
 
@@ -631,6 +634,9 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	denali_enable_dma(denali, false);
 	dma_sync_single_for_cpu(denali->dev, dma_addr, size, dir);
 
+	if (irq_status & INTR__ERASED_PAGE)
+		memset(buf, 0xff, size);
+
 	return ret;
 }
 
@@ -1423,7 +1429,9 @@ int denali_init(struct denali_nand_info *denali)
 	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
 						chip->ecc.strength);
 
-	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
+	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength,
+				      chip->ecc.strength + 1),
+		  denali->flash_reg + ECC_CORRECTION);
 	iowrite32(mtd->erasesize / mtd->writesize,
 		  denali->flash_reg + PAGES_PER_BLOCK);
 	iowrite32(denali->nand.options & NAND_BUSWIDTH_16 ? 1 : 0,
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 4696fd6..ecbec33 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -109,6 +109,10 @@
 
 #define ECC_CORRECTION				0x1b0
 #define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
+#define     ECC_CORRECTION__ERASE_THRESHOLD		GENMASK(31, 16)
+#define     MAKE_ECC_CORRECTION(val, thresh)		\
+			(((val) & (ECC_CORRECTION__VALUE)) | \
+			(((thresh) << 16) & (ECC_CORRECTION__ERASE_THRESHOLD)))
 
 #define READ_MODE				0x1c0
 #define     READ_MODE__VALUE				GENMASK(3, 0)
@@ -237,6 +241,7 @@
 #define     INTR__RST_COMP				BIT(13)
 #define     INTR__PIPE_CMD_ERR				BIT(14)
 #define     INTR__PAGE_XFER_INC				BIT(15)
+#define     INTR__ERASED_PAGE				BIT(16)
 
 #define PAGE_CNT(bank)				(0x430 + (bank) * 0x50)
 #define ERR_PAGE_ADDR(bank)			(0x440 + (bank) * 0x50)
-- 
2.7.4
