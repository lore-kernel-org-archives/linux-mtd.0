Received: from mail-wi0-f174.google.com ([209.85.212.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnkz-0002vR-Fj
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:22 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so409643wiv.7
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 25/47] mtd: nand: stm_nand_bch: provide read functionality
 (BCH)
Date: Thu,  1 May 2014 10:56:32 +0100
Message-Id: <1398938214-17847-26-git-send-email-lee.jones@linaro.org>
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

 Use DMA to read a single page of data.

 Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 96 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 2ff72c9..72c9734 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
 #include <linux/completion.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/stm_nand.h>
@@ -512,6 +513,99 @@ static int check_erased_page(uint8_t *data, uint32_t page_size, int max_zeros)
 	return zeros;
 }
 
+/* Returns the number of ECC errors, or '-1' for uncorrectable error */
+static int bch_read_page(struct nandi_controller *nandi,
+			 loff_t offs,
+			 uint8_t *buf)
+{
+	struct bch_prog *prog = &bch_prog_read_page;
+	uint32_t page_size = nandi->info.mtd.writesize;
+	unsigned long list_phys;
+	unsigned long buf_phys;
+	uint32_t ecc_err;
+	int ret = 0;
+
+	dev_dbg(nandi->dev, "%s: offs = 0x%012llx\n", __func__, offs);
+
+	BUG_ON(offs & (NANDI_BCH_DMA_ALIGNMENT - 1));
+
+	emiss_nandi_select(STM_NANDI_BCH);
+
+	nandi_enable_interrupts(nandi, NANDBCH_INT_SEQNODESOVER);
+	reinit_completion(&nandi->seq_completed);
+
+	/* Reset ECC stats */
+	writel(CFG_RESET_ECC_ALL | CFG_ENABLE_AFM,
+	       nandi->base + NANDBCH_CONTROLLER_CFG);
+	writel(CFG_ENABLE_AFM, nandi->base + NANDBCH_CONTROLLER_CFG);
+
+	prog->addr = (uint32_t)((offs >> (nandi->page_shift - 8)) & 0xffffff00);
+
+	buf_phys = dma_map_single(NULL, buf, page_size, DMA_FROM_DEVICE);
+
+	memset(nandi->buf_list, 0x00, NANDI_BCH_BUF_LIST_SIZE);
+	nandi->buf_list[0] = buf_phys | (nandi->sectors_per_page - 1);
+
+	list_phys = dma_map_single(NULL, nandi->buf_list,
+				   NANDI_BCH_BUF_LIST_SIZE, DMA_TO_DEVICE);
+
+	writel(list_phys, nandi->base + NANDBCH_BUFFER_LIST_PTR);
+
+	bch_load_prog_cpu(nandi, prog);
+
+	bch_wait_seq(nandi);
+
+	nandi_disable_interrupts(nandi, NANDBCH_INT_SEQNODESOVER);
+
+	dma_unmap_single(NULL, list_phys, NANDI_BCH_BUF_LIST_SIZE,
+			 DMA_TO_DEVICE);
+	dma_unmap_single(NULL, buf_phys, page_size, DMA_FROM_DEVICE);
+
+	/* Use the maximum per-sector ECC count! */
+	ecc_err = readl(nandi->base + NANDBCH_ECC_SCORE_REG_A) & 0xff;
+	if (ecc_err == 0xff) {
+		/*
+		 * Downgrade uncorrectable ECC error for an erased page,
+		 * tolerating 'bitflip_threshold' bits at zero.
+		 */
+		ret = check_erased_page(buf, page_size,
+					nandi->bitflip_threshold);
+		if (ret >= 0)
+			dev_dbg(nandi->dev,
+				"%s: erased page detected: \n"
+				"  downgrading uncorrectable ECC error.\n",
+				__func__);
+	} else {
+		ret = (int)ecc_err;
+	}
+
+	return ret;
+}
+
+static int bch_read(struct mtd_info *mtd, struct nand_chip *chip,
+			 uint8_t *buf, int oob_required, int page)
+{
+	struct nandi_controller *nandi = chip->priv;
+	uint32_t page_size = mtd->writesize;
+	loff_t offs = page * page_size;
+	bool bounce = false;
+	uint8_t *p;
+	int ret;
+
+	if (((unsigned int)buf & (NANDI_BCH_DMA_ALIGNMENT - 1)) ||
+	    (!virt_addr_valid(buf))) /* vmalloc'd buffer! */
+		bounce = true;
+
+	p = bounce ? nandi->page_buf : buf;
+
+	ret = bch_read_page(nandi, offs, p);
+
+	if (bounce)
+		memcpy(buf, p, page_size);
+
+	return ret;
+}
+
 /*
  * Initialisation
  */
@@ -590,6 +684,8 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->ecclayout = &info->ecclayout;
 	mtd->subpage_sft = 0;
+
+	chip->ecc.read_page = bch_read;
 }
 
 /*
-- 
1.8.3.2
