From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Sasha Levin <sashal@kernel.org>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 19/35] mtd: rawnand: qcom: Namespace prefix some
 commands
Date: Thu, 29 Nov 2018 01:00:53 -0500
Message-Id: <20181129060110.159878-19-sashal@kernel.org>
In-Reply-To: <20181129060110.159878-1-sashal@kernel.org>
References: <20181129060110.159878-1-sashal@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Olof Johansson <olof@lixom.net>

[ Upstream commit 33bf5519ae5dd356b182a94e3622f42860274a38 ]

PAGE_READ is used by RISC-V arch code included through mm headers,
and it makes sense to bring in a prefix on these in the driver.

drivers/mtd/nand/raw/qcom_nandc.c:153: warning: "PAGE_READ" redefined
 #define PAGE_READ   0x2
In file included from include/linux/memremap.h:7,
                 from include/linux/mm.h:27,
                 from include/linux/scatterlist.h:8,
                 from include/linux/dma-mapping.h:11,
                 from drivers/mtd/nand/raw/qcom_nandc.c:17:
arch/riscv/include/asm/pgtable.h:48: note: this is the location of the previous definition

Caught by riscv allmodconfig.

Signed-off-by: Olof Johansson <olof@lixom.net>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/qcom_nandc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index b49ca02b399d..09d5f7df6023 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -149,15 +149,15 @@
 #define	NAND_VERSION_MINOR_SHIFT	16
 
 /* NAND OP_CMDs */
-#define	PAGE_READ			0x2
-#define	PAGE_READ_WITH_ECC		0x3
-#define	PAGE_READ_WITH_ECC_SPARE	0x4
-#define	PROGRAM_PAGE			0x6
-#define	PAGE_PROGRAM_WITH_ECC		0x7
-#define	PROGRAM_PAGE_SPARE		0x9
-#define	BLOCK_ERASE			0xa
-#define	FETCH_ID			0xb
-#define	RESET_DEVICE			0xd
+#define	OP_PAGE_READ			0x2
+#define	OP_PAGE_READ_WITH_ECC		0x3
+#define	OP_PAGE_READ_WITH_ECC_SPARE	0x4
+#define	OP_PROGRAM_PAGE			0x6
+#define	OP_PAGE_PROGRAM_WITH_ECC	0x7
+#define	OP_PROGRAM_PAGE_SPARE		0x9
+#define	OP_BLOCK_ERASE			0xa
+#define	OP_FETCH_ID			0xb
+#define	OP_RESET_DEVICE			0xd
 
 /* Default Value for NAND_DEV_CMD_VLD */
 #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
@@ -629,11 +629,11 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 
 	if (read) {
 		if (host->use_ecc)
-			cmd = PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
+			cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
 		else
-			cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
+			cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
 	} else {
-			cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
+		cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
 	}
 
 	if (host->use_ecc) {
@@ -1030,7 +1030,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	 * in use. we configure the controller to perform a raw read of 512
 	 * bytes to read onfi params
 	 */
-	nandc_set_reg(nandc, NAND_FLASH_CMD, PAGE_READ | PAGE_ACC | LAST_PAGE);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_PAGE_READ | PAGE_ACC | LAST_PAGE);
 	nandc_set_reg(nandc, NAND_ADDR0, 0);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0, 0 << CW_PER_PAGE
@@ -1084,7 +1084,7 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
 	nandc_set_reg(nandc, NAND_FLASH_CMD,
-		      BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
+		      OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
 	nandc_set_reg(nandc, NAND_ADDR0, page_addr);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0,
@@ -1115,7 +1115,7 @@ static int read_id(struct qcom_nand_host *host, int column)
 	if (column == -1)
 		return 0;
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_FETCH_ID);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
@@ -1136,7 +1136,7 @@ static int reset(struct qcom_nand_host *host)
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_RESET_DEVICE);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-- 
2.17.1
