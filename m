Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050o-QS
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:35 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 02/39] mtd: nand: denali: remove unused CONFIG option and
 macros
Date: Sun, 27 Nov 2016 03:05:48 +0900
Message-Id: <1480183585-592-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
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

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/Kconfig  | 11 -----------
 drivers/mtd/nand/denali.h | 42 ------------------------------------------
 2 files changed, 53 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7b7a887..5eb643e 100644
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
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index ea22191..fd1ae08 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -367,33 +367,16 @@
 #define     MIN_MAX_BANK__MIN_VALUE			0x0003
 #define     MIN_MAX_BANK__MAX_VALUE			0x000c
 
-
-/* ffsdefs.h */
-#define CLEAR 0                 /*use this to clear a field instead of "fail"*/
-#define SET   1                 /*use this to set a field instead of "pass"*/
 #define FAIL 1                  /*failed flag*/
 #define PASS 0                  /*success flag*/
 #define ERR -1                  /*error flag*/
 
-/* lld.h */
-#define GOOD_BLOCK 0
-#define DEFECTIVE_BLOCK 1
-#define READ_ERROR 2
-
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
 
@@ -403,31 +386,6 @@
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
