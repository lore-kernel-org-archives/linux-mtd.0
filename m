Received: from mail-eopbgr00073.outbound.protection.outlook.com ([40.107.0.73]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehFiB-00044x-5H
 for linux-mtd@lists.infradead.org; Thu, 01 Feb 2018 14:19:40 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, poonam.aggrwal@nxp.com, suresh.gupta@nxp.com,
 yogeshnarayan.gaur@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 1/3] mtd: spi-nor: Add support of read/write any reg commands
Date: Thu,  1 Feb 2018 19:48:55 +0530
Message-Id: <1517494735-2766-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Spansion flash provide support of Read Any Register and Write Any
Register commands.  These commands provides a way to read or write
all device registers - non-volatile and volatile.

These commands require special signature and handing from underlying
flash controller.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 include/linux/mtd/spi-nor.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index de36969..a747215 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -265,6 +265,8 @@ struct flash_info;
  *			read/write/erase/lock/unlock operations
  * @read_reg:		[DRIVER-SPECIFIC] read out the register
  * @write_reg:		[DRIVER-SPECIFIC] write data to the register
+ * @read_anyreg:	[DRIVER-SPECIFIC] read out from any register
+ * @write_anyreg	[DRIVER-SPECIFIC] write data to any register
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
@@ -299,6 +301,10 @@ struct spi_nor {
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
+	int (*read_anyreg)(struct spi_nor *nor, u8 opcode, u32 offset,
+			   u8 *buf, int len);
+	int (*write_anyreg)(struct spi_nor *nor, u8 opcode, u32 offset,
+			    u8 *buf, int len);
 
 	ssize_t (*read)(struct spi_nor *nor, loff_t from,
 			size_t len, u_char *read_buf);
-- 
2.7.4
