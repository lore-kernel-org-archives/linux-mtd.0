Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwJ-0004Fc-3Q
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 11/12] mtd: nand: denali: support direct addressing mode
Date: Fri, 22 Sep 2017 12:46:48 +0900
Message-Id: <1506052009-8285-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND IP core decodes the lower 28 bits of the slave address
to get the control information; bit[27:26]=mode, bit[25:24]=bank, etc.
This means 256MB address range must be allocated for this IP.  (Direct
Addressing)

For systems with address space limitation, the Denali IP provides an
optional module that translates the addressing - address and data are
latched by the registers in the translation module. (Indexed Addressing)

The addressing mode can be selected when the delivered RTL is configured,
and it can be read out from the FEATURES register.

Most of SoC vendors would choose Indexed Addressing to save the address
space, but Direct Addressing is possible as well, and it can be easily
supported by adding ->host_{read,write} hooks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 109 +++++++++++++++++++++++++++++-----------------
 drivers/mtd/nand/denali.h |   2 +
 2 files changed, 70 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ee688e0..7c24983 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -29,9 +29,9 @@ MODULE_LICENSE("GPL");
 
 #define DENALI_NAND_NAME    "denali-nand"
 
-/* Host Data/Command Interface */
-#define DENALI_HOST_ADDR	0x00
-#define DENALI_HOST_DATA	0x10
+/* for Indexed Addressing */
+#define DENALI_INDEXED_CTRL	0x00
+#define DENALI_INDEXED_DATA	0x10
 
 #define DENALI_MAP00		(0 << 26)	/* direct access to buffer */
 #define DENALI_MAP01		(1 << 26)	/* read/write pages in PIO */
@@ -64,11 +64,39 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
 }
 
-static void denali_host_write(struct denali_nand_info *denali,
-			      uint32_t addr, uint32_t data)
+/*
+ * Direct Addressing - the slave address forms the control information (command
+ * type, bank, block, and page address).  The slave data is the actual data to
+ * be transferred.  This mode requires 28 bits of address region allocated.
+ */
+static u32 denali_direct_read(struct denali_nand_info *denali, u32 addr)
+{
+	return ioread32(denali->host + addr);
+}
+
+static void denali_direct_write(struct denali_nand_info *denali, u32 addr,
+				u32 data)
+{
+	iowrite32(data, denali->host + addr);
+}
+
+/*
+ * Indexed Addressing - address translation module intervenes in passing the
+ * control information.  This mode reduces the required address range.  The
+ * control information and transferred data are latched by the registers in
+ * the translation module.
+ */
+static u32 denali_indexed_read(struct denali_nand_info *denali, u32 addr)
 {
-	iowrite32(addr, denali->host + DENALI_HOST_ADDR);
-	iowrite32(data, denali->host + DENALI_HOST_DATA);
+	iowrite32(addr, denali->host + DENALI_INDEXED_CTRL);
+	return ioread32(denali->host + DENALI_INDEXED_DATA);
+}
+
+static void denali_indexed_write(struct denali_nand_info *denali, u32 addr,
+				 u32 data)
+{
+	iowrite32(addr, denali->host + DENALI_INDEXED_CTRL);
+	iowrite32(data, denali->host + DENALI_INDEXED_DATA);
 }
 
 /*
@@ -205,52 +233,44 @@ static uint32_t denali_check_irq(struct denali_nand_info *denali)
 static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
 	int i;
 
-	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
-		  denali->host + DENALI_HOST_ADDR);
-
 	for (i = 0; i < len; i++)
-		buf[i] = ioread32(denali->host + DENALI_HOST_DATA);
+		buf[i] = denali->host_read(denali, addr);
 }
 
 static void denali_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
 	int i;
 
-	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
-		  denali->host + DENALI_HOST_ADDR);
-
 	for (i = 0; i < len; i++)
-		iowrite32(buf[i], denali->host + DENALI_HOST_DATA);
+		denali->host_write(denali, addr, buf[i]);
 }
 
 static void denali_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
 	uint16_t *buf16 = (uint16_t *)buf;
 	int i;
 
-	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
-		  denali->host + DENALI_HOST_ADDR);
-
 	for (i = 0; i < len / 2; i++)
-		buf16[i] = ioread32(denali->host + DENALI_HOST_DATA);
+		buf16[i] = denali->host_read(denali, addr);
 }
 
 static void denali_write_buf16(struct mtd_info *mtd, const uint8_t *buf,
 			       int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
 	const uint16_t *buf16 = (const uint16_t *)buf;
 	int i;
 
-	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
-		  denali->host + DENALI_HOST_ADDR);
-
 	for (i = 0; i < len / 2; i++)
-		iowrite32(buf16[i], denali->host + DENALI_HOST_DATA);
+		denali->host_write(denali, addr, buf16[i]);
 }
 
 static uint8_t denali_read_byte(struct mtd_info *mtd)
@@ -295,7 +315,7 @@ static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 	if (ctrl & NAND_CTRL_CHANGE)
 		denali_reset_irq(denali);
 
-	denali_host_write(denali, DENALI_BANK(denali) | type, dat);
+	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
 }
 
 static int denali_dev_ready(struct mtd_info *mtd)
@@ -465,14 +485,14 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	 * 1. setup transfer type, interrupt when complete,
 	 *    burst len = 64 bytes, the number of pages
 	 */
-	denali_host_write(denali, mode,
-			  0x01002000 | (64 << 16) | (write << 8) | page_count);
+	denali->host_write(denali, mode,
+			   0x01002000 | (64 << 16) | (write << 8) | page_count);
 
 	/* 2. set memory low address */
-	denali_host_write(denali, mode, lower_32_bits(dma_addr));
+	denali->host_write(denali, mode, lower_32_bits(dma_addr));
 
 	/* 3. set memory high address */
-	denali_host_write(denali, mode, upper_32_bits(dma_addr));
+	denali->host_write(denali, mode, upper_32_bits(dma_addr));
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
@@ -486,17 +506,17 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	/* DMA is a four step process */
 
 	/* 1. setup transfer type and # of pages */
-	denali_host_write(denali, mode | page,
-			  0x2000 | (write << 8) | page_count);
+	denali->host_write(denali, mode | page,
+			   0x2000 | (write << 8) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
-	denali_host_write(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
+	denali->host_write(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
 
 	/* 3. set memory low address bits 23:8 */
-	denali_host_write(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
+	denali->host_write(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
 
 	/* 4. interrupt when complete, burst len = 64 bytes */
-	denali_host_write(denali, mode | 0x14000, 0x2400);
+	denali->host_write(denali, mode | 0x14000, 0x2400);
 }
 
 static void denali_setup_dma(struct denali_nand_info *denali,
@@ -511,7 +531,7 @@ static void denali_setup_dma(struct denali_nand_info *denali,
 static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 			   size_t size, int page, int raw)
 {
-	uint32_t addr = DENALI_BANK(denali) | page;
+	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
 	uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status, ecc_err_mask;
 	int i;
@@ -523,9 +543,8 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 
 	denali_reset_irq(denali);
 
-	iowrite32(DENALI_MAP01 | addr, denali->host + DENALI_HOST_ADDR);
 	for (i = 0; i < size / 4; i++)
-		*buf32++ = ioread32(denali->host + DENALI_HOST_DATA);
+		*buf32++ = denali->host_read(denali, addr);
 
 	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
 	if (!(irq_status & INTR__PAGE_XFER_INC))
@@ -540,16 +559,15 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 static int denali_pio_write(struct denali_nand_info *denali,
 			    const void *buf, size_t size, int page, int raw)
 {
-	uint32_t addr = DENALI_BANK(denali) | page;
+	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
 	const uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status;
 	int i;
 
 	denali_reset_irq(denali);
 
-	iowrite32(DENALI_MAP01 | addr, denali->host + DENALI_HOST_ADDR);
 	for (i = 0; i < size / 4; i++)
-		iowrite32(*buf32++, denali->host + DENALI_HOST_DATA);
+		denali->host_write(denali, addr, *buf32++);
 
 	irq_status = denali_wait_for_irq(denali,
 				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
@@ -935,8 +953,8 @@ static int denali_erase(struct mtd_info *mtd, int page)
 
 	denali_reset_irq(denali);
 
-	denali_host_write(denali, DENALI_MAP10 | DENALI_BANK(denali) | page,
-			  DENALI_ERASE);
+	denali->host_write(denali, DENALI_MAP10 | DENALI_BANK(denali) | page,
+			   DENALI_ERASE);
 
 	/* wait for erase to complete or failure to occur */
 	irq_status = denali_wait_for_irq(denali,
@@ -1227,6 +1245,7 @@ int denali_init(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
 	mtd->dev.parent = denali->dev;
@@ -1262,6 +1281,14 @@ int denali_init(struct denali_nand_info *denali)
 	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
 
+	if (features & FEATURES__INDEX_ADDR) {
+		denali->host_read = denali_indexed_read;
+		denali->host_write = denali_indexed_write;
+	} else {
+		denali->host_read = denali_direct_read;
+		denali->host_write = denali_direct_write;
+	}
+
 	/* clk rate info is needed for setup_data_interface */
 	if (denali->clk_x_rate)
 		chip->setup_data_interface = denali_setup_data_interface;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index f55ee10..3aeb272 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -319,6 +319,8 @@ struct denali_nand_info {
 	unsigned int revision;		/* IP revision */
 	unsigned int caps;		/* IP capability (or quirk) */
 	const struct nand_ecc_caps *ecc_caps;
+	u32 (*host_read)(struct denali_nand_info *denali, u32 addr);
+	void (*host_write)(struct denali_nand_info *denali, u32 addr, u32 data);
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
-- 
2.7.4
