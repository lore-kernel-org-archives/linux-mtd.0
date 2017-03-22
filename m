Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgwz-0005uG-1v
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:27 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 03/53] mtd: nand: denali: remove unused CONFIG option and
 macros
Date: Wed, 22 Mar 2017 23:07:10 +0900
Message-Id: <1490191680-14481-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All of these macros are not used at all.
CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR is not used for anything but
defining SCRATCH_REG_ADDR.  The config option should go away as well.

I am removing some register macros.  They are not used, and do not
exist in recent IP versions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove more unused macros

 drivers/mtd/nand/Kconfig  | 11 ------
 drivers/mtd/nand/denali.c |  5 ---
 drivers/mtd/nand/denali.h | 99 -----------------------------------------------
 3 files changed, 115 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6d4d567..817558b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -60,17 +60,6 @@ config MTD_NAND_DENALI_DT
 	  Enable the driver for NAND flash on platforms using a Denali NAND
 	  controller as a DT device.
 
-config MTD_NAND_DENALI_SCRATCH_REG_ADDR
-        hex "Denali NAND size scratch register address"
-        default "0xFF108018"
-        depends on MTD_NAND_DENALI_PCI
-        help
-          Some platforms place the NAND chip size in a scratch register
-          because (some versions of) the driver aren't able to automatically
-          determine the size of certain chips. Set the address of the
-          scratch register here to enable this feature. On Intel Moorestown
-          boards, the scratch register is at 0xFF108018.
-
 config MTD_NAND_GPIO
 	tristate "GPIO assisted NAND Flash driver"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 73b9d4e..f993e13 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -91,11 +91,6 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 #define DENALI_READ	0
 #define DENALI_WRITE	0x100
 
-/* types of device accesses. We can issue commands and get status */
-#define COMMAND_CYCLE	0
-#define ADDR_CYCLE	1
-#define STATUS_CYCLE	2
-
 /*
  * this is a helper macro that allows us to
  * format the bank into the proper bits for the controller
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index ea22191..c4f3a68 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -257,26 +257,6 @@
 #define ERR_PAGE_ADDR(__bank)	(0x440 + ((__bank) * 0x50))
 #define ERR_BLOCK_ADDR(__bank)	(0x450 + ((__bank) * 0x50))
 
-#define DATA_INTR				0x550
-#define     DATA_INTR__WRITE_SPACE_AV			0x0001
-#define     DATA_INTR__READ_DATA_AV			0x0002
-
-#define DATA_INTR_EN				0x560
-#define     DATA_INTR_EN__WRITE_SPACE_AV		0x0001
-#define     DATA_INTR_EN__READ_DATA_AV			0x0002
-
-#define GPREG_0					0x570
-#define     GPREG_0__VALUE				0xffff
-
-#define GPREG_1					0x580
-#define     GPREG_1__VALUE				0xffff
-
-#define GPREG_2					0x590
-#define     GPREG_2__VALUE				0xffff
-
-#define GPREG_3					0x5a0
-#define     GPREG_3__VALUE				0xffff
-
 #define ECC_THRESHOLD				0x600
 #define     ECC_THRESHOLD__VALUE			0x03ff
 
@@ -331,69 +311,15 @@
 #define     CHNL_ACTIVE__CHANNEL2			0x0004
 #define     CHNL_ACTIVE__CHANNEL3			0x0008
 
-#define ACTIVE_SRC_ID				0x800
-#define     ACTIVE_SRC_ID__VALUE			0x00ff
-
-#define PTN_INTR					0x810
-#define     PTN_INTR__CONFIG_ERROR			0x0001
-#define     PTN_INTR__ACCESS_ERROR_BANK0		0x0002
-#define     PTN_INTR__ACCESS_ERROR_BANK1		0x0004
-#define     PTN_INTR__ACCESS_ERROR_BANK2		0x0008
-#define     PTN_INTR__ACCESS_ERROR_BANK3		0x0010
-#define     PTN_INTR__REG_ACCESS_ERROR			0x0020
-
-#define PTN_INTR_EN				0x820
-#define     PTN_INTR_EN__CONFIG_ERROR			0x0001
-#define     PTN_INTR_EN__ACCESS_ERROR_BANK0		0x0002
-#define     PTN_INTR_EN__ACCESS_ERROR_BANK1		0x0004
-#define     PTN_INTR_EN__ACCESS_ERROR_BANK2		0x0008
-#define     PTN_INTR_EN__ACCESS_ERROR_BANK3		0x0010
-#define     PTN_INTR_EN__REG_ACCESS_ERROR		0x0020
-
-#define PERM_SRC_ID(__bank)	(0x830 + ((__bank) * 0x40))
-#define     PERM_SRC_ID__SRCID				0x00ff
-#define     PERM_SRC_ID__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR(__bank)	(0x840 + ((__bank) * 0x40))
-#define     MIN_BLK_ADDR__VALUE				0xffff
-
-#define MAX_BLK_ADDR(__bank)	(0x850 + ((__bank) * 0x40))
-#define     MAX_BLK_ADDR__VALUE				0xffff
-
-#define MIN_MAX_BANK(__bank)	(0x860 + ((__bank) * 0x40))
-#define     MIN_MAX_BANK__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK__MAX_VALUE			0x000c
-
-
-/* ffsdefs.h */
-#define CLEAR 0                 /*use this to clear a field instead of "fail"*/
-#define SET   1                 /*use this to set a field instead of "pass"*/
 #define FAIL 1                  /*failed flag*/
 #define PASS 0                  /*success flag*/
-#define ERR -1                  /*error flag*/
-
-/* lld.h */
-#define GOOD_BLOCK 0
-#define DEFECTIVE_BLOCK 1
-#define READ_ERROR 2
 
 #define CLK_X  5
 #define CLK_MULTI 4
 
-/* KBV - Updated to LNW scratch register address */
-#define SCRATCH_REG_ADDR    CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR
-#define SCRATCH_REG_SIZE    64
-
-#define GLOB_HWCTL_DEFAULT_BLKS    2048
-
 #define SUPPORT_15BITECC        1
 #define SUPPORT_8BITECC         1
 
-#define CUSTOM_CONF_PARAMS      0
-
 #define ONFI_BLOOM_TIME         1
 #define MODE5_WORKAROUND        0
 
@@ -403,31 +329,6 @@
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-
-#define DATA_TRANSFER_MODE              0
-#define PROTECTION_PER_BLOCK            1
-#define LOAD_WAIT_COUNT                 2
-#define PROGRAM_WAIT_COUNT              3
-#define ERASE_WAIT_COUNT                4
-#define INT_MONITOR_CYCLE_COUNT         5
-#define READ_BUSY_PIN_ENABLED           6
-#define MULTIPLANE_OPERATION_SUPPORT    7
-#define PRE_FETCH_MODE                  8
-#define CE_DONT_CARE_SUPPORT            9
-#define COPYBACK_SUPPORT                10
-#define CACHE_WRITE_SUPPORT             11
-#define CACHE_READ_SUPPORT              12
-#define NUM_PAGES_IN_BLOCK              13
-#define ECC_ENABLE_SELECT               14
-#define WRITE_ENABLE_2_READ_ENABLE      15
-#define ADDRESS_2_DATA                  16
-#define READ_ENABLE_2_WRITE_ENABLE      17
-#define TWO_ROW_ADDRESS_CYCLES          18
-#define MULTIPLANE_ADDRESS_RESTRICT     19
-#define ACC_CLOCKS                      20
-#define READ_WRITE_ENABLE_LOW_COUNT     21
-#define READ_WRITE_ENABLE_HIGH_COUNT    22
-
 #define ECC_SECTOR_SIZE     512
 
 struct nand_buf {
-- 
2.7.4
