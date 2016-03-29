Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akmUv-0001ym-ID
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2016 05:47:26 +0000
From: Vignesh R <vigneshr@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Vignesh R <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
Date: Tue, 29 Mar 2016 11:16:17 +0530
Message-ID: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
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

Certain SPI controllers may provide accelerated hardware interface to
read from m25p80 type flash devices in order to provide better read
performance. SPI core supports such devices with spi_flash_read() API.
Call spi_flash_read(), if supported, to make use of such interface.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---

Resend v5:
Rebased on top of v4.6-rc1
v5: http://www.spinics.net/lists/devicetree/msg106696.html

 drivers/mtd/devices/m25p80.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7fa3051..7730e633d7d3 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	/* convert the dummy cycles to the number of bytes */
 	dummy /= 8;
 
+	if (spi_flash_read_supported(spi)) {
+		struct spi_flash_read_message msg;
+		int ret;
+
+		msg.buf = buf;
+		msg.from = from;
+		msg.len = len;
+		msg.read_opcode = nor->read_opcode;
+		msg.addr_width = nor->addr_width;
+		msg.dummy_bytes = dummy;
+		/* TODO: Support other combinations */
+		msg.opcode_nbits = SPI_NBITS_SINGLE;
+		msg.addr_nbits = SPI_NBITS_SINGLE;
+		msg.data_nbits = m25p80_rx_nbits(nor);
+
+		ret = spi_flash_read(spi, &msg);
+		*retlen = msg.retlen;
+		return ret;
+	}
+
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
-- 
2.7.4
