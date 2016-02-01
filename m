Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQ8G4-0005d1-Q5
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 06:46:45 +0000
From: Vignesh R <vigneshr@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Russell King <linux@arm.linux.org.uk>, <hramrach@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, Vignesh R <vigneshr@ti.com>
Subject: [RESEND][PATCH v5 3/3] mtd: devices: m25p80: add support for mmap
 read request
Date: Mon, 1 Feb 2016 12:14:25 +0530
Message-ID: <1454309065-11493-4-git-send-email-vigneshr@ti.com>
In-Reply-To: <1454309065-11493-1-git-send-email-vigneshr@ti.com>
References: <1454309065-11493-1-git-send-email-vigneshr@ti.com>
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

Certain spi controllers may provide accelerated interface to read from
m25p80 type flash devices. This interface provides better read
performance than regular SPI interface.
Call spi_flash_read(), if supported, to make use of such interface.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---

Resend v5:
Rebased on top of v4.5-rc1

v5: No changes

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
2.7.0
