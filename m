Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021g-5i
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:49 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 05/11] mtd: nand: denali: remove "Spectra:" prefix from printk
 strings
Date: Wed,  9 Nov 2016 13:35:24 +0900
Message-Id: <1478666130-13413-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As far as I understood from the Kconfig menu deleted by commit
be7f39c5ecf5 ("Staging: delete spectra driver"), the "Spectra" is
specific to Intel Moorestown Platform.

The Denali NAND controller IP is used for various SoCs such as
Altera SOCFPGA, Socionext UniPhier, etc.  The platform specific
strings are not preferred in this driver.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

As an ARM-SoC developer, I only need denali.c and denali_dt.c.

I see some "Spectra:" in drivers/mtd/nand/denali_pci.c as well.
I was not quite sure if they are needed or not.
If desired, I can update this patch to remove them too.


 drivers/mtd/nand/denali.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 80d3e26..78d795b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -402,7 +402,7 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
 		break;
 	default:
 		dev_warn(denali->dev,
-			 "Spectra: Unknown Hynix NAND (Device ID: 0x%x).\n"
+			 "Unknown Hynix NAND (Device ID: 0x%x).\n"
 			 "Will use default parameter values instead.\n",
 			 device_id);
 	}
@@ -1458,7 +1458,7 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
-		pr_err("Spectra: Unable to allocate IRQ\n");
+		dev_err(denali->dev, "Unable to request IRQ\n");
 		return -ENODEV;
 	}
 
@@ -1495,7 +1495,7 @@ int denali_init(struct denali_nand_info *denali)
 	/* Is 32-bit DMA supported? */
 	ret = dma_set_mask(denali->dev, DMA_BIT_MASK(32));
 	if (ret) {
-		pr_err("Spectra: no usable DMA configuration\n");
+		dev_err(denali->dev, "no usable DMA configuration\n");
 		goto failed_req_irq;
 	}
 
@@ -1503,7 +1503,7 @@ int denali_init(struct denali_nand_info *denali)
 			     mtd->writesize + mtd->oobsize,
 			     DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
-		dev_err(denali->dev, "Spectra: failed to map DMA buffer\n");
+		dev_err(denali->dev, "failed to map DMA buffer\n");
 		ret = -EIO;
 		goto failed_req_irq;
 	}
@@ -1598,8 +1598,7 @@ int denali_init(struct denali_nand_info *denali)
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		dev_err(denali->dev, "Spectra: Failed to register MTD: %d\n",
-				ret);
+		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
 		goto failed_req_irq;
 	}
 	return 0;
-- 
1.9.1
