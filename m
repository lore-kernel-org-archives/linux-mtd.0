Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJbP-0007Dp-3k
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:08:59 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Sricharan R <sricharan@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5 04/16] mtd: nand: qcom: support for passing flags in DMA
 helper functions
Date: Thu, 17 Aug 2017 17:37:42 +0530
Message-Id: <1502971674-13810-5-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The QPIC NAND BAM has multiple flags to control the transfer. This
patch adds flags parameter in register and data transfer DMA helper
functions and modifies all these functions call with appropriate
flags using following rule

1. Read and write can’t go in single command descriptor so
   separate SGL should be used.
2. For some of the requests, NWD flag should be set in BAM
   DMA descriptor.
3. For Data write, the BAM has internal buffer for each codeword.
   All write request will modify the data in internal buffer and
   this buffer will be flushed to NAND device once EOT flag is set.
   So for all the write requests in single codeword, the EOT should
   be cleared for all tx data descriptors except the last one.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4:

1. Added flag argument description in function comment
2. Minor modification in the comment given before
       #define NAND_BAM_NO_EOT
3. Minor modification in commit message

 drivers/mtd/nand/qcom_nandc.c | 129 +++++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index f52a692..c922617 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -181,6 +181,17 @@
 #define QPIC_PER_CW_DATA_SGL		8
 
 /*
+ * Flags used in DMA descriptor preparation helper functions
+ * (i.e. read_reg_dma/write_reg_dma/read_data_dma/write_data_dma)
+ */
+/* Don't set the EOT in current tx BAM sgl */
+#define NAND_BAM_NO_EOT			BIT(0)
+/* Set the NWD flag in current BAM sgl */
+#define NAND_BAM_NWD			BIT(1)
+/* Finish writing in the current BAM sgl and start writing in another BAM sgl */
+#define NAND_BAM_NEXT_SGL		BIT(2)
+
+/*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
  * @cmd_sgl - sgl for NAND BAM command pipe
@@ -729,9 +740,10 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
  *
  * @first:		offset of the first register in the contiguous block
  * @num_regs:		number of registers to read
+ * @flags:		flags to control DMA descriptor preparation
  */
 static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
-			int num_regs)
+			int num_regs, unsigned int flags)
 {
 	bool flow_control = false;
 	void *vaddr;
@@ -753,9 +765,10 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
  *
  * @first:		offset of the first register in the contiguous block
  * @num_regs:		number of registers to write
+ * @flags:		flags to control DMA descriptor preparation
  */
 static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
-			 int num_regs)
+			 int num_regs, unsigned int flags)
 {
 	bool flow_control = false;
 	struct nandc_regs *regs = nandc->regs;
@@ -767,6 +780,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_FLASH_CMD)
 		flow_control = true;
 
+	if (first == NAND_EXEC_CMD)
+		flags |= NAND_BAM_NWD;
+
 	if (first == NAND_DEV_CMD1_RESTORE)
 		first = NAND_DEV_CMD1;
 
@@ -786,9 +802,10 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
  * @reg_off:		offset within the controller's data buffer
  * @vaddr:		virtual address of the buffer we want to write to
  * @size:		DMA transaction size in bytes
+ * @flags:		flags to control DMA descriptor preparation
  */
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
-			 const u8 *vaddr, int size)
+			 const u8 *vaddr, int size, unsigned int flags)
 {
 	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
@@ -800,9 +817,10 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
  * @reg_off:		offset within the controller's data buffer
  * @vaddr:		virtual address of the buffer we want to read from
  * @size:		DMA transaction size in bytes
+ * @flags:		flags to control DMA descriptor preparation
  */
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
-			  const u8 *vaddr, int size)
+			  const u8 *vaddr, int size, unsigned int flags)
 {
 	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
@@ -813,9 +831,9 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
  */
 static void config_nand_page_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_ADDR0, 2);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
+	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
+	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
 }
 
 /*
@@ -824,11 +842,12 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_read(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 2);
-	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
+	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
+		     NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -847,9 +866,10 @@ static void config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_page_write(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_ADDR0, 2);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
+	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
+	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
+		      NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -858,13 +878,13 @@ static void config_nand_page_write(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_write(struct qcom_nand_controller *nandc)
 {
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
-	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
-	write_reg_dma(nandc, NAND_READ_STATUS, 1);
+	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
+	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -911,8 +931,8 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
 	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
 
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1);
-	write_reg_dma(nandc, NAND_DEV_CMD1, 1);
+	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
+	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
@@ -920,11 +940,11 @@ static int nandc_param(struct qcom_nand_host *host)
 	config_nand_single_cw_page_read(nandc);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
-		      nandc->buf_count);
+		      nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1);
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1);
+	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
+	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -946,14 +966,14 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 2);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
-	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
-	write_reg_dma(nandc, NAND_READ_STATUS, 1);
+	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
+	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -973,10 +993,10 @@ static int read_id(struct qcom_nand_host *host, int column)
 	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 4);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_READ_ID, 1);
+	read_reg_dma(nandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -990,10 +1010,10 @@ static int reset(struct qcom_nand_host *host)
 	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
+	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
+	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
 	return 0;
 }
@@ -1389,7 +1409,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
-				      data_size);
+				      data_size, 0);
 
 		/*
 		 * when ecc is enabled, the controller doesn't read the real
@@ -1405,7 +1425,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 				*oob_buf++ = 0xff;
 
 			read_data_dma(nandc, FLASH_BUF_ACC + data_size,
-				      oob_buf, oob_size);
+				      oob_buf, oob_size, 0);
 		}
 
 		if (data_buf)
@@ -1447,7 +1467,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 
 	config_nand_single_cw_page_read(nandc);
 
-	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size);
+	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
 
 	ret = submit_descs(nandc);
 	if (ret)
@@ -1516,19 +1536,19 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 
 		config_nand_cw_read(nandc);
 
-		read_data_dma(nandc, reg_off, data_buf, data_size1);
+		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 		reg_off += data_size1;
 		data_buf += data_size1;
 
-		read_data_dma(nandc, reg_off, oob_buf, oob_size1);
+		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
 		reg_off += oob_size1;
 		oob_buf += oob_size1;
 
-		read_data_dma(nandc, reg_off, data_buf, data_size2);
+		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
 		reg_off += data_size2;
 		data_buf += data_size2;
 
-		read_data_dma(nandc, reg_off, oob_buf, oob_size2);
+		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 	}
 
@@ -1595,7 +1615,8 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		}
 
 
-		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size);
+		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
+			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
 
 		/*
 		 * when ECC is enabled, we don't really need to write anything
@@ -1608,7 +1629,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			oob_buf += host->bbm_size;
 
 			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
-				       oob_buf, oob_size);
+				       oob_buf, oob_size, 0);
 		}
 
 		config_nand_cw_write(nandc);
@@ -1663,19 +1684,22 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
-		write_data_dma(nandc, reg_off, data_buf, data_size1);
+		write_data_dma(nandc, reg_off, data_buf, data_size1,
+			       NAND_BAM_NO_EOT);
 		reg_off += data_size1;
 		data_buf += data_size1;
 
-		write_data_dma(nandc, reg_off, oob_buf, oob_size1);
+		write_data_dma(nandc, reg_off, oob_buf, oob_size1,
+			       NAND_BAM_NO_EOT);
 		reg_off += oob_size1;
 		oob_buf += oob_size1;
 
-		write_data_dma(nandc, reg_off, data_buf, data_size2);
+		write_data_dma(nandc, reg_off, data_buf, data_size2,
+			       NAND_BAM_NO_EOT);
 		reg_off += data_size2;
 		data_buf += data_size2;
 
-		write_data_dma(nandc, reg_off, oob_buf, oob_size2);
+		write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
 		config_nand_cw_write(nandc);
@@ -1729,8 +1753,8 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
-		       data_size + oob_size);
+	write_data_dma(nandc, FLASH_BUF_ACC,
+		       nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(nandc);
 
 	ret = submit_descs(nandc);
@@ -1814,7 +1838,8 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
-	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, host->cw_size);
+	write_data_dma(nandc, FLASH_BUF_ACC,
+		       nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(nandc);
 
 	ret = submit_descs(nandc);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
