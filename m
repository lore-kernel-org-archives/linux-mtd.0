Received: from mail-bl2nam02on0083.outbound.protection.outlook.com
 ([104.47.38.83] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMQ8n-0006fP-Gr
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 03:13:03 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Date: Wed, 6 Dec 2017 10:53:42 +0800
Message-ID: <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
In-Reply-To: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
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

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Restore the status to be compatible with legacy devices.
Take Freescale eSPI boot for example, it copies (in 3 Byte
addressing mode) the RCW and bootloader images from SPI flash
without firing a reset signal previously, so the reboot command
will fail without reseting the addressing mode of SPI flash.
This patch implement .shutdown function to restore the status
in reboot process, and add the same operation to the .remove
function.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Modified the commit to make this patch specific.

 drivers/mtd/devices/m25p80.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index dbe6a1de2bb8..a4e18f6aaa33 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -307,10 +307,18 @@ static int m25p_remove(struct spi_device *spi)
 {
 	struct m25p	*flash = spi_get_drvdata(spi);
 
+	spi_nor_restore(&flash->spi_nor);
+
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&flash->spi_nor.mtd);
 }
 
+static void m25p_shutdown(struct spi_device *spi)
+{
+	struct m25p *flash = spi_get_drvdata(spi);
+
+	spi_nor_restore(&flash->spi_nor);
+}
 /*
  * Do NOT add to this array without reading the following:
  *
@@ -386,6 +394,7 @@ static struct spi_driver m25p80_driver = {
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
 	.remove	= m25p_remove,
+	.shutdown	= m25p_shutdown,
 
 	/* REVISIT: many of these chips have deep power-down modes, which
 	 * should clearly be entered on suspend() to minimize power use.
-- 
2.14.1
