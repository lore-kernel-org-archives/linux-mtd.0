Received: from mail-bl2on0068.outbound.protection.outlook.com ([65.55.169.68]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5bHs-0002by-Tu
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2015 14:59:29 +0000
From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <marex@denx.de>,
 <shijie.huang@intel.com>, <zajec5@gmail.com>, <ben@decadent.org.uk>,
 <mika.westerberg@linux.intel.com>, <beanhuo@micron.com>, <grmoore@altera.com>
Subject: [RFC PATCH] mtd: spi-nor: Added flag check for quad io protocol for
 micron flash parts
Date: Thu, 18 Jun 2015 20:28:59 +0530
Message-ID: <1434639539-7517-1-git-send-email-anuragku@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: harinik@xilinx.com, Anurag Kumar Vulisha <anuragku@xilinx.com>,
 svemula@xilinx.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, anirudh@xilinx.com, punnaia@xilinx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

micron flash parts by default operates in extended spi protocol,which accepts
command on single line and can accept address & data on one,two and four lines
depending on the command sent.In set_quad_enable() we are enabling the quad io
protocol for micron flash parts by updating the EVCR register,in this method the
flash expects the command,address and data to be transmitted on all four data
lines which may not be supported on all qspi controllers.So READ_1_1_4 command
does not necessarily go out using those bus widths.

So i have added SPI_QUAD_IO_PROTOCOL flag,which should be checked before enabling
the quad io protocol.

Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>
---
 drivers/mtd/spi-nor/spi-nor.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..a6fa8dc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -55,6 +55,7 @@ struct flash_info {
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
 #define	USE_FSR			0x80	/* use flag status register */
+#define SPI_QUAD_IO_PROTOCOL	0x100	/* use quad io protocol */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -962,6 +963,8 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
 		}
 		return status;
 	case CFI_MFR_ST:
+		if (!(info->flags & SPI_QUAD_IO_PROTOCOL))
+			return 0;
 		status = micron_quad_enable(nor);
 		if (status) {
 			dev_err(nor->dev, "Micron quad-read not enabled\n");
-- 
1.7.4
