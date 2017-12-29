Received: from mail-by2nam01on0079.outbound.protection.outlook.com
 ([104.47.34.79] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUtG6-00008h-Js
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 11:55:32 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <marek.vasut@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <poonam.aggrwal@nxp.com>, <suresh.gupta@nxp.com>, <ashish.kumar@nxp.com>,
 <yogeshnarayan.gaur@nxp.com>, <rajat.srivastava@nxp.com>,
 <fabio.estevam@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [RFC 1/3] mtd: spi-nor: Add support of read/write any reg commands
Date: Fri, 29 Dec 2017 17:23:50 +0530
Message-ID: <1514548432-13302-2-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
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
index 1f0a7fc..bd196e3 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -254,6 +254,8 @@ enum spi_nor_option_flags {
  *			read/write/erase/lock/unlock operations
  * @read_reg:		[DRIVER-SPECIFIC] read out the register
  * @write_reg:		[DRIVER-SPECIFIC] write data to the register
+ * @read_anyreg:	[DRIVER-SPECIFIC] read out from any register
+ * @write_anyreg	[DRIVER-SPECIFIC] write data to any register
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
@@ -286,6 +288,10 @@ struct spi_nor {
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
