Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT9-0004a5-KM
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:20 +0000
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
Subject: [RESEND PATCH v2 33/53] mtd: nand: denali: use BIT() and GENMASK()
 for register macros
Date: Thu, 23 Mar 2017 09:17:42 +0900
Message-Id: <1490228282-10805-7-git-send-email-yamada.masahiro@socionext.com>
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

Make register field macros more readable especially for comparing
the macros and the register description in the Denali User's Guide.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.h | 244 ++++++++++++++++++++++------------------------
 1 file changed, 119 insertions(+), 125 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 14e801c..2fca7a5 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -24,251 +24,245 @@
 #include <linux/mtd/nand.h>
 
 #define DEVICE_RESET				0x0
-#define     DEVICE_RESET__BANK0				0x0001
-#define     DEVICE_RESET__BANK1				0x0002
-#define     DEVICE_RESET__BANK2				0x0004
-#define     DEVICE_RESET__BANK3				0x0008
+#define     DEVICE_RESET__BANK(bank)			BIT(bank)
 
 #define TRANSFER_SPARE_REG			0x10
-#define     TRANSFER_SPARE_REG__FLAG			0x0001
+#define     TRANSFER_SPARE_REG__FLAG			BIT(0)
 
 #define LOAD_WAIT_CNT				0x20
-#define     LOAD_WAIT_CNT__VALUE			0xffff
+#define     LOAD_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define PROGRAM_WAIT_CNT			0x30
-#define     PROGRAM_WAIT_CNT__VALUE			0xffff
+#define     PROGRAM_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define ERASE_WAIT_CNT				0x40
-#define     ERASE_WAIT_CNT__VALUE			0xffff
+#define     ERASE_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define INT_MON_CYCCNT				0x50
-#define     INT_MON_CYCCNT__VALUE			0xffff
+#define     INT_MON_CYCCNT__VALUE			GENMASK(15, 0)
 
 #define RB_PIN_ENABLED				0x60
-#define     RB_PIN_ENABLED__BANK0			0x0001
-#define     RB_PIN_ENABLED__BANK1			0x0002
-#define     RB_PIN_ENABLED__BANK2			0x0004
-#define     RB_PIN_ENABLED__BANK3			0x0008
+#define     RB_PIN_ENABLED__BANK(bank)			BIT(bank)
 
 #define MULTIPLANE_OPERATION			0x70
-#define     MULTIPLANE_OPERATION__FLAG			0x0001
+#define     MULTIPLANE_OPERATION__FLAG			BIT(0)
 
 #define MULTIPLANE_READ_ENABLE			0x80
-#define     MULTIPLANE_READ_ENABLE__FLAG		0x0001
+#define     MULTIPLANE_READ_ENABLE__FLAG		BIT(0)
 
 #define COPYBACK_DISABLE			0x90
-#define     COPYBACK_DISABLE__FLAG			0x0001
+#define     COPYBACK_DISABLE__FLAG			BIT(0)
 
 #define CACHE_WRITE_ENABLE			0xa0
-#define     CACHE_WRITE_ENABLE__FLAG			0x0001
+#define     CACHE_WRITE_ENABLE__FLAG			BIT(0)
 
 #define CACHE_READ_ENABLE			0xb0
-#define     CACHE_READ_ENABLE__FLAG			0x0001
+#define     CACHE_READ_ENABLE__FLAG			BIT(0)
 
 #define PREFETCH_MODE				0xc0
-#define     PREFETCH_MODE__PREFETCH_EN			0x0001
-#define     PREFETCH_MODE__PREFETCH_BURST_LENGTH	0xfff0
+#define     PREFETCH_MODE__PREFETCH_EN			BIT(0)
+#define     PREFETCH_MODE__PREFETCH_BURST_LENGTH	GENMASK(15, 4)
 
 #define CHIP_ENABLE_DONT_CARE			0xd0
-#define     CHIP_EN_DONT_CARE__FLAG			0x01
+#define     CHIP_EN_DONT_CARE__FLAG			BIT(0)
 
 #define ECC_ENABLE				0xe0
-#define     ECC_ENABLE__FLAG				0x0001
+#define     ECC_ENABLE__FLAG				BIT(0)
 
 #define GLOBAL_INT_ENABLE			0xf0
-#define     GLOBAL_INT_EN_FLAG				0x01
+#define     GLOBAL_INT_EN_FLAG				BIT(0)
 
 #define WE_2_RE					0x100
-#define     WE_2_RE__VALUE				0x003f
+#define     WE_2_RE__VALUE				GENMASK(5, 0)
 
 #define ADDR_2_DATA				0x110
-#define     ADDR_2_DATA__VALUE				0x003f
+#define     ADDR_2_DATA__VALUE				GENMASK(5, 0)
 
 #define RE_2_WE					0x120
-#define     RE_2_WE__VALUE				0x003f
+#define     RE_2_WE__VALUE				GENMASK(5, 0)
 
 #define ACC_CLKS				0x130
-#define     ACC_CLKS__VALUE				0x000f
+#define     ACC_CLKS__VALUE				GENMASK(3, 0)
 
 #define NUMBER_OF_PLANES			0x140
-#define     NUMBER_OF_PLANES__VALUE			0x0007
+#define     NUMBER_OF_PLANES__VALUE			GENMASK(2, 0)
 
 #define PAGES_PER_BLOCK				0x150
-#define     PAGES_PER_BLOCK__VALUE			0xffff
+#define     PAGES_PER_BLOCK__VALUE			GENMASK(15, 0)
 
 #define DEVICE_WIDTH				0x160
-#define     DEVICE_WIDTH__VALUE				0x0003
+#define     DEVICE_WIDTH__VALUE				GENMASK(1, 0)
 
 #define DEVICE_MAIN_AREA_SIZE			0x170
-#define     DEVICE_MAIN_AREA_SIZE__VALUE		0xffff
+#define     DEVICE_MAIN_AREA_SIZE__VALUE		GENMASK(15, 0)
 
 #define DEVICE_SPARE_AREA_SIZE			0x180
-#define     DEVICE_SPARE_AREA_SIZE__VALUE		0xffff
+#define     DEVICE_SPARE_AREA_SIZE__VALUE		GENMASK(15, 0)
 
 #define TWO_ROW_ADDR_CYCLES			0x190
-#define     TWO_ROW_ADDR_CYCLES__FLAG			0x0001
+#define     TWO_ROW_ADDR_CYCLES__FLAG			BIT(0)
 
 #define MULTIPLANE_ADDR_RESTRICT		0x1a0
-#define     MULTIPLANE_ADDR_RESTRICT__FLAG		0x0001
+#define     MULTIPLANE_ADDR_RESTRICT__FLAG		BIT(0)
 
 #define ECC_CORRECTION				0x1b0
-#define     ECC_CORRECTION__VALUE			0x001f
+#define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
 
 #define READ_MODE				0x1c0
-#define     READ_MODE__VALUE				0x000f
+#define     READ_MODE__VALUE				GENMASK(3, 0)
 
 #define WRITE_MODE				0x1d0
-#define     WRITE_MODE__VALUE				0x000f
+#define     WRITE_MODE__VALUE				GENMASK(3, 0)
 
 #define COPYBACK_MODE				0x1e0
-#define     COPYBACK_MODE__VALUE			0x000f
+#define     COPYBACK_MODE__VALUE			GENMASK(3, 0)
 
 #define RDWR_EN_LO_CNT				0x1f0
-#define     RDWR_EN_LO_CNT__VALUE			0x001f
+#define     RDWR_EN_LO_CNT__VALUE			GENMASK(4, 0)
 
 #define RDWR_EN_HI_CNT				0x200
-#define     RDWR_EN_HI_CNT__VALUE			0x001f
+#define     RDWR_EN_HI_CNT__VALUE			GENMASK(4, 0)
 
 #define MAX_RD_DELAY				0x210
-#define     MAX_RD_DELAY__VALUE				0x000f
+#define     MAX_RD_DELAY__VALUE				GENMASK(3, 0)
 
 #define CS_SETUP_CNT				0x220
-#define     CS_SETUP_CNT__VALUE				0x001f
+#define     CS_SETUP_CNT__VALUE				GENMASK(4, 0)
 
 #define SPARE_AREA_SKIP_BYTES			0x230
-#define     SPARE_AREA_SKIP_BYTES__VALUE		0x003f
+#define     SPARE_AREA_SKIP_BYTES__VALUE		GENMASK(5, 0)
 
 #define SPARE_AREA_MARKER			0x240
-#define     SPARE_AREA_MARKER__VALUE			0xffff
+#define     SPARE_AREA_MARKER__VALUE			GENMASK(15, 0)
 
 #define DEVICES_CONNECTED			0x250
-#define     DEVICES_CONNECTED__VALUE			0x0007
+#define     DEVICES_CONNECTED__VALUE			GENMASK(2, 0)
 
 #define DIE_MASK				0x260
-#define     DIE_MASK__VALUE				0x00ff
+#define     DIE_MASK__VALUE				GENMASK(7, 0)
 
 #define FIRST_BLOCK_OF_NEXT_PLANE		0x270
-#define     FIRST_BLOCK_OF_NEXT_PLANE__VALUE		0xffff
+#define     FIRST_BLOCK_OF_NEXT_PLANE__VALUE		GENMASK(15, 0)
 
 #define WRITE_PROTECT				0x280
-#define     WRITE_PROTECT__FLAG				0x0001
+#define     WRITE_PROTECT__FLAG				BIT(0)
 
 #define RE_2_RE					0x290
-#define     RE_2_RE__VALUE				0x003f
+#define     RE_2_RE__VALUE				GENMASK(5, 0)
 
 #define MANUFACTURER_ID				0x300
-#define     MANUFACTURER_ID__VALUE			0x00ff
+#define     MANUFACTURER_ID__VALUE			GENMASK(7, 0)
 
 #define DEVICE_ID				0x310
-#define     DEVICE_ID__VALUE				0x00ff
+#define     DEVICE_ID__VALUE				GENMASK(7, 0)
 
 #define DEVICE_PARAM_0				0x320
-#define     DEVICE_PARAM_0__VALUE			0x00ff
+#define     DEVICE_PARAM_0__VALUE			GENMASK(7, 0)
 
 #define DEVICE_PARAM_1				0x330
-#define     DEVICE_PARAM_1__VALUE			0x00ff
+#define     DEVICE_PARAM_1__VALUE			GENMASK(7, 0)
 
 #define DEVICE_PARAM_2				0x340
-#define     DEVICE_PARAM_2__VALUE			0x00ff
+#define     DEVICE_PARAM_2__VALUE			GENMASK(7, 0)
 
 #define LOGICAL_PAGE_DATA_SIZE			0x350
-#define     LOGICAL_PAGE_DATA_SIZE__VALUE		0xffff
+#define     LOGICAL_PAGE_DATA_SIZE__VALUE		GENMASK(15, 0)
 
 #define LOGICAL_PAGE_SPARE_SIZE			0x360
-#define     LOGICAL_PAGE_SPARE_SIZE__VALUE		0xffff
+#define     LOGICAL_PAGE_SPARE_SIZE__VALUE		GENMASK(15, 0)
 
 #define REVISION				0x370
-#define     REVISION__VALUE				0xffff
+#define     REVISION__VALUE				GENMASK(15, 0)
 
 #define ONFI_DEVICE_FEATURES			0x380
-#define     ONFI_DEVICE_FEATURES__VALUE			0x003f
+#define     ONFI_DEVICE_FEATURES__VALUE			GENMASK(5, 0)
 
 #define ONFI_OPTIONAL_COMMANDS			0x390
-#define     ONFI_OPTIONAL_COMMANDS__VALUE		0x003f
+#define     ONFI_OPTIONAL_COMMANDS__VALUE		GENMASK(5, 0)
 
 #define ONFI_TIMING_MODE			0x3a0
-#define     ONFI_TIMING_MODE__VALUE			0x003f
+#define     ONFI_TIMING_MODE__VALUE			GENMASK(5, 0)
 
 #define ONFI_PGM_CACHE_TIMING_MODE		0x3b0
-#define     ONFI_PGM_CACHE_TIMING_MODE__VALUE		0x003f
+#define     ONFI_PGM_CACHE_TIMING_MODE__VALUE		GENMASK(5, 0)
 
 #define ONFI_DEVICE_NO_OF_LUNS			0x3c0
-#define     ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS		0x00ff
-#define     ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE		0x0100
+#define     ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS		GENMASK(7, 0)
+#define     ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE		BIT(8)
 
 #define ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L	0x3d0
-#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L__VALUE	0xffff
+#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L__VALUE	GENMASK(15, 0)
 
 #define ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U	0x3e0
-#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U__VALUE	0xffff
-
-#define FEATURES					0x3f0
-#define     FEATURES__N_BANKS				0x0003
-#define     FEATURES__ECC_MAX_ERR			0x003c
-#define     FEATURES__DMA				0x0040
-#define     FEATURES__CMD_DMA				0x0080
-#define     FEATURES__PARTITION				0x0100
-#define     FEATURES__XDMA_SIDEBAND			0x0200
-#define     FEATURES__GPREG				0x0400
-#define     FEATURES__INDEX_ADDR			0x0800
+#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U__VALUE	GENMASK(15, 0)
+
+#define FEATURES				0x3f0
+#define     FEATURES__N_BANKS				GENMASK(1, 0)
+#define     FEATURES__ECC_MAX_ERR			GENMASK(5, 2)
+#define     FEATURES__DMA				BIT(6)
+#define     FEATURES__CMD_DMA				BIT(7)
+#define     FEATURES__PARTITION				BIT(8)
+#define     FEATURES__XDMA_SIDEBAND			BIT(9)
+#define     FEATURES__GPREG				BIT(10)
+#define     FEATURES__INDEX_ADDR			BIT(11)
 
 #define TRANSFER_MODE				0x400
-#define     TRANSFER_MODE__VALUE			0x0003
+#define     TRANSFER_MODE__VALUE			GENMASK(1, 0)
 
-#define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
-#define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
+#define INTR_STATUS(bank)			(0x410 + (bank) * 0x50)
+#define INTR_EN(bank)				(0x420 + (bank) * 0x50)
 /*
  * Some versions of the IP have the ECC fixup handled in hardware.  In this
  * configuration we only get interrupted when the error is uncorrectable.
  * Unfortunately this bit replaces INTR_STATUS__ECC_TRANSACTION_DONE from the
  * old IP.
  */
-#define     INTR__ECC_UNCOR_ERR				0x0001
-#define     INTR__ECC_TRANSACTION_DONE			0x0001
-#define     INTR__ECC_ERR				0x0002
-#define     INTR__DMA_CMD_COMP				0x0004
-#define     INTR__TIME_OUT				0x0008
-#define     INTR__PROGRAM_FAIL				0x0010
-#define     INTR__ERASE_FAIL				0x0020
-#define     INTR__LOAD_COMP				0x0040
-#define     INTR__PROGRAM_COMP				0x0080
-#define     INTR__ERASE_COMP				0x0100
-#define     INTR__PIPE_CPYBCK_CMD_COMP			0x0200
-#define     INTR__LOCKED_BLK				0x0400
-#define     INTR__UNSUP_CMD				0x0800
-#define     INTR__INT_ACT				0x1000
-#define     INTR__RST_COMP				0x2000
-#define     INTR__PIPE_CMD_ERR				0x4000
-#define     INTR__PAGE_XFER_INC				0x8000
-
-#define PAGE_CNT(__bank)	(0x430 + ((__bank) * 0x50))
-#define ERR_PAGE_ADDR(__bank)	(0x440 + ((__bank) * 0x50))
-#define ERR_BLOCK_ADDR(__bank)	(0x450 + ((__bank) * 0x50))
+#define     INTR__ECC_UNCOR_ERR				BIT(0)
+#define     INTR__ECC_TRANSACTION_DONE			BIT(0)
+#define     INTR__ECC_ERR				BIT(1)
+#define     INTR__DMA_CMD_COMP				BIT(2)
+#define     INTR__TIME_OUT				BIT(3)
+#define     INTR__PROGRAM_FAIL				BIT(4)
+#define     INTR__ERASE_FAIL				BIT(5)
+#define     INTR__LOAD_COMP				BIT(6)
+#define     INTR__PROGRAM_COMP				BIT(7)
+#define     INTR__ERASE_COMP				BIT(8)
+#define     INTR__PIPE_CPYBCK_CMD_COMP			BIT(9)
+#define     INTR__LOCKED_BLK				BIT(10)
+#define     INTR__UNSUP_CMD				BIT(11)
+#define     INTR__INT_ACT				BIT(12)
+#define     INTR__RST_COMP				BIT(13)
+#define     INTR__PIPE_CMD_ERR				BIT(14)
+#define     INTR__PAGE_XFER_INC				BIT(15)
+
+#define PAGE_CNT(bank)				(0x430 + (bank) * 0x50)
+#define ERR_PAGE_ADDR(bank)			(0x440 + (bank) * 0x50)
+#define ERR_BLOCK_ADDR(bank)			(0x450 + (bank) * 0x50)
 
 #define ECC_THRESHOLD				0x600
-#define     ECC_THRESHOLD__VALUE			0x03ff
+#define     ECC_THRESHOLD__VALUE			GENMASK(9, 0)
 
 #define ECC_ERROR_BLOCK_ADDRESS			0x610
-#define     ECC_ERROR_BLOCK_ADDRESS__VALUE		0xffff
+#define     ECC_ERROR_BLOCK_ADDRESS__VALUE		GENMASK(15, 0)
 
 #define ECC_ERROR_PAGE_ADDRESS			0x620
-#define     ECC_ERROR_PAGE_ADDRESS__VALUE		0x0fff
-#define     ECC_ERROR_PAGE_ADDRESS__BANK		0xf000
+#define     ECC_ERROR_PAGE_ADDRESS__VALUE		GENMASK(11, 0)
+#define     ECC_ERROR_PAGE_ADDRESS__BANK		GENMASK(15, 12)
 
 #define ECC_ERROR_ADDRESS			0x630
-#define     ECC_ERROR_ADDRESS__OFFSET			0x0fff
-#define     ECC_ERROR_ADDRESS__SECTOR_NR		0xf000
+#define     ECC_ERROR_ADDRESS__OFFSET			GENMASK(11, 0)
+#define     ECC_ERROR_ADDRESS__SECTOR_NR		GENMASK(15, 12)
 
 #define ERR_CORRECTION_INFO			0x640
-#define     ERR_CORRECTION_INFO__BYTEMASK		0x00ff
-#define     ERR_CORRECTION_INFO__DEVICE_NR		0x0f00
-#define     ERR_CORRECTION_INFO__ERROR_TYPE		0x4000
-#define     ERR_CORRECTION_INFO__LAST_ERR_INFO		0x8000
+#define     ERR_CORRECTION_INFO__BYTEMASK		GENMASK(7, 0)
+#define     ERR_CORRECTION_INFO__DEVICE_NR		GENMASK(11, 8)
+#define     ERR_CORRECTION_INFO__ERROR_TYPE		BIT(14)
+#define     ERR_CORRECTION_INFO__LAST_ERR_INFO		BIT(15)
 
 #define ECC_COR_INFO(bank)			(0x650 + (bank) / 2 * 0x10)
 #define     ECC_COR_INFO__SHIFT(bank)			((bank) % 2 * 8)
-#define     ECC_COR_INFO__MAX_ERRORS			0x007f
-#define     ECC_COR_INFO__UNCOR_ERR			0x0080
+#define     ECC_COR_INFO__MAX_ERRORS			GENMASK(6, 0)
+#define     ECC_COR_INFO__UNCOR_ERR			BIT(7)
 
 #define CFG_DATA_BLOCK_SIZE			0x6b0
 
@@ -279,31 +273,31 @@
 #define CFG_META_DATA_SIZE			0x6e0
 
 #define DMA_ENABLE				0x700
-#define     DMA_ENABLE__FLAG				0x0001
+#define     DMA_ENABLE__FLAG				BIT(0)
 
 #define IGNORE_ECC_DONE				0x710
-#define     IGNORE_ECC_DONE__FLAG			0x0001
+#define     IGNORE_ECC_DONE__FLAG			BIT(0)
 
 #define DMA_INTR				0x720
 #define DMA_INTR_EN				0x730
-#define     DMA_INTR__TARGET_ERROR			0x0001
-#define     DMA_INTR__DESC_COMP_CHANNEL0		0x0002
-#define     DMA_INTR__DESC_COMP_CHANNEL1		0x0004
-#define     DMA_INTR__DESC_COMP_CHANNEL2		0x0008
-#define     DMA_INTR__DESC_COMP_CHANNEL3		0x0010
-#define     DMA_INTR__MEMCOPY_DESC_COMP			0x0020
+#define     DMA_INTR__TARGET_ERROR			BIT(0)
+#define     DMA_INTR__DESC_COMP_CHANNEL0		BIT(1)
+#define     DMA_INTR__DESC_COMP_CHANNEL1		BIT(2)
+#define     DMA_INTR__DESC_COMP_CHANNEL2		BIT(3)
+#define     DMA_INTR__DESC_COMP_CHANNEL3		BIT(4)
+#define     DMA_INTR__MEMCOPY_DESC_COMP			BIT(5)
 
 #define TARGET_ERR_ADDR_LO			0x740
-#define     TARGET_ERR_ADDR_LO__VALUE			0xffff
+#define     TARGET_ERR_ADDR_LO__VALUE			GENMASK(15, 0)
 
 #define TARGET_ERR_ADDR_HI			0x750
-#define     TARGET_ERR_ADDR_HI__VALUE			0xffff
+#define     TARGET_ERR_ADDR_HI__VALUE			GENMASK(15, 0)
 
 #define CHNL_ACTIVE				0x760
-#define     CHNL_ACTIVE__CHANNEL0			0x0001
-#define     CHNL_ACTIVE__CHANNEL1			0x0002
-#define     CHNL_ACTIVE__CHANNEL2			0x0004
-#define     CHNL_ACTIVE__CHANNEL3			0x0008
+#define     CHNL_ACTIVE__CHANNEL0			BIT(0)
+#define     CHNL_ACTIVE__CHANNEL1			BIT(1)
+#define     CHNL_ACTIVE__CHANNEL2			BIT(2)
+#define     CHNL_ACTIVE__CHANNEL3			BIT(3)
 
 #define FAIL 1                  /*failed flag*/
 #define PASS 0                  /*success flag*/
-- 
2.7.4
