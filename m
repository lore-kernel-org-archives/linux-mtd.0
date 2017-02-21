Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Cn-0007n4-0Z
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:49:51 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 02/11] nand: spi: create spi_nand_chip struct
Date: Tue, 21 Feb 2017 16:00:01 +0800
Message-ID: <1487664010-25926-3-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
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

Create spi_nand_chip struct and helper functions.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/spi-nand.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
index 68442e08..23b16f0 100644
--- a/include/linux/mtd/spi-nand.h
+++ b/include/linux/mtd/spi-nand.h
@@ -16,6 +16,12 @@
 #ifndef __LINUX_MTD_SPI_NAND_H
 #define __LINUX_MTD_SPI_NAND_H
 
+#include <linux/wait.h>
+#include <linux/spinlock.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/flashchip.h>
+#include <linux/mtd/nand.h>
+
 /*
  * Standard SPI-NAND flash commands
  */
@@ -109,4 +115,65 @@
 #define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
 #define SPI_NAND_MT29F_ECC_UNCORR	0x20
 
+/**
+ * struct spi_nand_chip - SPI-NAND Private Flash Chip Data
+ * @base:		[INTERN] NAND device instance
+ * @chip_lock:		[INTERN] protection lock
+ * @name:		name of the chip
+ * @wq:			[INTERN] wait queue to sleep on if a SPI-NAND operation
+ *			is in progress used instead of the per chip wait queue
+ *			when a hw controller is available.
+ * @mfr_id:		[BOARDSPECIFIC] manufacture id
+ * @dev_id:		[BOARDSPECIFIC] device id
+ * @state:		[INTERN] the current state of the SPI-NAND device
+ * @read_cache_op:	[REPLACEABLE] Opcode of read from cache
+ * @write_cache_op:	[REPLACEABLE] Opcode of program load
+ * @buf:		[INTERN] buffer for read/write data
+ * @oobbuf:		[INTERN] buffer for read/write oob
+ * @controller_caps:	[INTERN] capacities of SPI NAND controller
+ * @size:		[INTERN] the size of chip
+ * @options:		[BOARDSPECIFIC] various chip options. They can partly
+ *			be set to inform nand_scan about special functionality.
+ * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
+ * @priv:		[BOARDSPECIFIC] pointer to controller data
+ */
+struct spi_nand_chip {
+	struct nand_device	base;
+	spinlock_t	chip_lock;
+	char		*name;
+	wait_queue_head_t wq;
+	u8		mfr_id;
+	u8		dev_id;
+	flstate_t	state;
+	u8		read_cache_op;
+	u8		write_cache_op;
+	u8		*buf;
+	u8		*oobbuf;
+	u32		controller_caps;
+	u64		size;
+	u32		options;
+	u32		ecc_strength;
+	void		*priv;
+};
+
+static inline struct spi_nand_chip *mtd_to_spi_nand(struct mtd_info *mtd)
+{
+	return container_of(mtd_to_nand(mtd), struct spi_nand_chip, base);
+}
+
+static inline struct mtd_info *spi_nand_to_mtd(struct spi_nand_chip *chip)
+{
+	return nand_to_mtd(&chip->base);
+}
+
+static inline void *spi_nand_get_controller_data(struct spi_nand_chip *chip)
+{
+	return chip->priv;
+}
+
+static inline void spi_nand_set_controller_data(struct spi_nand_chip *chip,
+						void *priv)
+{
+	chip->priv = priv;
+}
 #endif /* __LINUX_MTD_SPI_NAND_H */
-- 
1.9.1
