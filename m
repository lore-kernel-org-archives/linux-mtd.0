Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJbU-0007E4-3r
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:09:22 +0000
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
Subject: [PATCH v5 05/16] mtd: nand: qcom: support for read location registers
Date: Thu, 17 Aug 2017 17:37:43 +0530
Message-Id: <1502971674-13810-6-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In EBI2, all codeword data will be read in FLASH_BUF_ACC buffer
and ADM will copy the data from source (FLASH_BUF_ACC) to
destination (memory for data read).

In QPIC, there is no FLASH_BUF_ACC and all the codeword data will
held in QPIC BAM FIFO buffers. It provides multiple READ_LOCATION
registers which will be used for copying the data from FIFO to
memory. The READ_LOCATION register will be used to read a
specific amount of data from a specific offset within the flash
buffer. It supports sequential offset requests. Each request is
composed of the following fields:

a. Offset within the flash buffer from which data should be
   read
b. Amount of data to be read
c. Flag bit specifying the last read request from the flash
   buffer. Following the last read request the NANDc refers to the
   buffer as empty.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4:

1. Changed macro name from nanc_set_readl to nandc_set_read_loc
2. Removed redundant nanc_set_readl in copy_lasy_cw

 drivers/mtd/nand/qcom_nandc.c | 63 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index c922617..9d55e8e 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -53,6 +53,8 @@
 #define	NAND_VERSION			0xf08
 #define	NAND_READ_LOCATION_0		0xf20
 #define	NAND_READ_LOCATION_1		0xf24
+#define	NAND_READ_LOCATION_2		0xf28
+#define	NAND_READ_LOCATION_3		0xf2c
 
 /* dummy register offsets, used by write_reg_dma */
 #define	NAND_DEV_CMD1_RESTORE		0xdead
@@ -135,6 +137,11 @@
 #define	ERASED_PAGE			(PAGE_ALL_ERASED | PAGE_ERASED)
 #define	ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
 
+/* NAND_READ_LOCATION_n bits */
+#define READ_LOCATION_OFFSET		0
+#define READ_LOCATION_SIZE		16
+#define READ_LOCATION_LAST		31
+
 /* Version Mask */
 #define	NAND_VERSION_MAJOR_MASK		0xf0000000
 #define	NAND_VERSION_MAJOR_SHIFT	28
@@ -177,6 +184,12 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
+#define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
+	      ((offset) << READ_LOCATION_OFFSET) |		\
+	      ((size) << READ_LOCATION_SIZE) |			\
+	      ((is_last) << READ_LOCATION_LAST))
+
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
@@ -263,6 +276,11 @@ struct nandc_regs {
 	__le32 orig_vld;
 
 	__le32 ecc_buf_cfg;
+	__le32 read_location0;
+	__le32 read_location1;
+	__le32 read_location2;
+	__le32 read_location3;
+
 };
 
 /*
@@ -519,6 +537,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->orig_vld;
 	case NAND_EBI2_ECC_BUF_CFG:
 		return &regs->ecc_buf_cfg;
+	case NAND_READ_LOCATION_0:
+		return &regs->read_location0;
+	case NAND_READ_LOCATION_1:
+		return &regs->read_location1;
+	case NAND_READ_LOCATION_2:
+		return &regs->read_location2;
+	case NAND_READ_LOCATION_3:
+		return &regs->read_location3;
 	default:
 		return NULL;
 	}
@@ -593,6 +619,10 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
+
+	if (read)
+		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
+				   host->cw_data : host->cw_size, 1);
 }
 
 /*
@@ -842,6 +872,10 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  */
 static void config_nand_cw_read(struct qcom_nand_controller *nandc)
 {
+	if (nandc->props->is_bam)
+		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
+			      NAND_BAM_NEXT_SGL);
+
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -930,6 +964,7 @@ static int nandc_param(struct qcom_nand_host *host)
 
 	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
 	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
+	nandc_set_read_loc(nandc, 0, 0, 512, 1);
 
 	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
 	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
@@ -1405,6 +1440,19 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			oob_size = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
+		if (nandc->props->is_bam) {
+			if (data_buf && oob_buf) {
+				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
+				nandc_set_read_loc(nandc, 1, data_size,
+						   oob_size, 1);
+			} else if (data_buf) {
+				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
+			} else {
+				nandc_set_read_loc(nandc, 0, data_size,
+						   oob_size, 1);
+			}
+		}
+
 		config_nand_cw_read(nandc);
 
 		if (data_buf)
@@ -1509,6 +1557,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	u8 *data_buf, *oob_buf;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int i, ret;
+	int read_loc;
 
 	data_buf = buf;
 	oob_buf = chip->oob_poi;
@@ -1534,6 +1583,20 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
 		}
 
+		if (nandc->props->is_bam) {
+			read_loc = 0;
+			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+			read_loc += data_size1;
+
+			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+			read_loc += oob_size1;
+
+			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+			read_loc += data_size2;
+
+			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+		}
+
 		config_nand_cw_read(nandc);
 
 		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
