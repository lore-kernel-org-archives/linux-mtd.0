Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGE-00048Q-P3
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:45:40 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 1/6] Revert "mtd: spi-nor: remove unused read_xfer/write_xfer
 hooks"
Date: Fri, 17 Mar 2017 18:13:51 +0530
Message-ID: <1489754636-21461-2-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 79c452adb159dc9abc507ea13faec8d115a78758.

This was removed because hooks were never used by any driver. But
with upcoming OTP support in SPI-NOR, m25p80 driver will implement
it and will be used for reading/writing OTP area.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 include/linux/mtd/spi-nor.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f2a7180..0be3f86 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -126,6 +126,33 @@ enum read_mode {
 	SPI_NOR_QUAD,
 };
 
+/**
+ * struct spi_nor_xfer_cfg - Structure for defining a Serial Flash transfer
+ * @wren:		command for "Write Enable", or 0x00 for not required
+ * @cmd:		command for operation
+ * @cmd_pins:		number of pins to send @cmd (1, 2, 4)
+ * @addr:		address for operation
+ * @addr_pins:		number of pins to send @addr (1, 2, 4)
+ * @addr_width:		number of address bytes
+ *			(3,4, or 0 for address not required)
+ * @mode:		mode data
+ * @mode_pins:		number of pins to send @mode (1, 2, 4)
+ * @mode_cycles:	number of mode cycles (0 for mode not required)
+ * @dummy_cycles:	number of dummy cycles (0 for dummy not required)
+ */
+struct spi_nor_xfer_cfg {
+	u8		wren;
+	u8		cmd;
+	u8		cmd_pins;
+	u32		addr;
+	u8		addr_pins;
+	u8		addr_width;
+	u8		mode;
+	u8		mode_pins;
+	u8		mode_cycles;
+	u8		dummy_cycles;
+};
+
 #define SPI_NOR_MAX_CMD_SIZE	8
 enum spi_nor_ops {
 	SPI_NOR_OPS_READ = 0,
@@ -157,11 +184,14 @@ enum spi_nor_option_flags {
  * @flash_read:		the mode of the read
  * @sst_write_second:	used by the SST write operation
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
+ * @cfg:		used by the read_xfer/write_xfer
  * @cmd_buf:		used by the write_reg
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
  * @unprepare:		[OPTIONAL] do some post work after the
  *			read/write/erase/lock/unlock operations
+ * @read_xfer:		[OPTIONAL] the read fundamental primitive
+ * @write_xfer:		[OPTIONAL] the writefundamental primitive
  * @read_reg:		[DRIVER-SPECIFIC] read out the register
  * @write_reg:		[DRIVER-SPECIFIC] write data to the register
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
@@ -188,10 +218,15 @@ struct spi_nor {
 	enum read_mode		flash_read;
 	bool			sst_write_second;
 	u32			flags;
+	struct spi_nor_xfer_cfg	cfg;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
+	int (*read_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
+			 u8 *buf, size_t len);
+	int (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
+			  u8 *buf, size_t len);
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 
-- 
2.6.2
