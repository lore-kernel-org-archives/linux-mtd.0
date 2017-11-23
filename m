Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHrPo-0002me-34
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 13:19:42 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: remove unnecessary extern from driver headers
Date: Thu, 23 Nov 2017 22:18:43 +0900
Message-Id: <1511443123-30525-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'extern' is not necessary for function declarations.

scripts/checkpatch.pl with --strict option reports the following:

  CHECK: extern prototypes should be avoided in .h files

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.h              |  4 +--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 46 +++++++++++++++++-----------------
 drivers/mtd/nand/sm_common.h           |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 2911066..9ad33d2 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -329,7 +329,7 @@ struct denali_nand_info {
 #define DENALI_CAP_DMA_64BIT			BIT(1)
 
 int denali_calc_ecc_bytes(int step_size, int strength);
-extern int denali_init(struct denali_nand_info *denali);
-extern void denali_remove(struct denali_nand_info *denali);
+int denali_init(struct denali_nand_info *denali);
+void denali_remove(struct denali_nand_info *denali);
 
 #endif /* __DENALI_H__ */
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a45e4ce..06c1f99 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -268,31 +268,31 @@ struct timing_threshold {
 };
 
 /* Common Services */
-extern int common_nfc_set_geometry(struct gpmi_nand_data *);
-extern struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
-extern void prepare_data_dma(struct gpmi_nand_data *,
-				enum dma_data_direction dr);
-extern int start_dma_without_bch_irq(struct gpmi_nand_data *,
-				struct dma_async_tx_descriptor *);
-extern int start_dma_with_bch_irq(struct gpmi_nand_data *,
-				struct dma_async_tx_descriptor *);
+int common_nfc_set_geometry(struct gpmi_nand_data *);
+struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
+void prepare_data_dma(struct gpmi_nand_data *,
+		      enum dma_data_direction dr);
+int start_dma_without_bch_irq(struct gpmi_nand_data *,
+			      struct dma_async_tx_descriptor *);
+int start_dma_with_bch_irq(struct gpmi_nand_data *,
+			   struct dma_async_tx_descriptor *);
 
 /* GPMI-NAND helper function library */
-extern int gpmi_init(struct gpmi_nand_data *);
-extern int gpmi_extra_init(struct gpmi_nand_data *);
-extern void gpmi_clear_bch(struct gpmi_nand_data *);
-extern void gpmi_dump_info(struct gpmi_nand_data *);
-extern int bch_set_geometry(struct gpmi_nand_data *);
-extern int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
-extern int gpmi_send_command(struct gpmi_nand_data *);
-extern void gpmi_begin(struct gpmi_nand_data *);
-extern void gpmi_end(struct gpmi_nand_data *);
-extern int gpmi_read_data(struct gpmi_nand_data *);
-extern int gpmi_send_data(struct gpmi_nand_data *);
-extern int gpmi_send_page(struct gpmi_nand_data *,
-			dma_addr_t payload, dma_addr_t auxiliary);
-extern int gpmi_read_page(struct gpmi_nand_data *,
-			dma_addr_t payload, dma_addr_t auxiliary);
+int gpmi_init(struct gpmi_nand_data *);
+int gpmi_extra_init(struct gpmi_nand_data *);
+void gpmi_clear_bch(struct gpmi_nand_data *);
+void gpmi_dump_info(struct gpmi_nand_data *);
+int bch_set_geometry(struct gpmi_nand_data *);
+int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
+int gpmi_send_command(struct gpmi_nand_data *);
+void gpmi_begin(struct gpmi_nand_data *);
+void gpmi_end(struct gpmi_nand_data *);
+int gpmi_read_data(struct gpmi_nand_data *);
+int gpmi_send_data(struct gpmi_nand_data *);
+int gpmi_send_page(struct gpmi_nand_data *,
+		   dma_addr_t payload, dma_addr_t auxiliary);
+int gpmi_read_page(struct gpmi_nand_data *,
+		   dma_addr_t payload, dma_addr_t auxiliary);
 
 void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 		    const u8 *src, size_t src_bit_off,
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/sm_common.h
index d3e028e..1581671 100644
--- a/drivers/mtd/nand/sm_common.h
+++ b/drivers/mtd/nand/sm_common.h
@@ -36,7 +36,7 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
-extern int sm_register_device(struct mtd_info *mtd, int smartmedia);
+int sm_register_device(struct mtd_info *mtd, int smartmedia);
 
 
 static inline int sm_sector_valid(struct sm_oob *oob)
-- 
2.7.4
