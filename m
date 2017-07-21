Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYgJu-0004XN-SY
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 22:22:53 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ludovic Barre <ludovic.barre@st.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC] mtd: atmel-quadspi: fix build issues
Date: Sat, 22 Jul 2017 00:21:54 +0200
Message-Id: <20170721222204.3402340-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I ran into a link-time error with the atmel-quadspi driver on the
EBSA110 platform:

drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
:(.text+0x1ee3c): undefined reference to `_memcpy_toio'
:(.text+0x1ee48): undefined reference to `_memcpy_fromio'

The problem is that _memcpy_toio/_memcpy_fromio are not available
on that platform, and we have to prevent building the driver there.

A related problem is that the functions are not portable APIs
and should not be called directly from a device driver. On
little-endian machines, the regular memcpy_toio/memcpy_fromio
functions are defined as optimized versions using multi-byte
transfers that are much faster.

Cyrille mentioned that initially using memcpy_toio/memcpy_fromio
did not work, but I suspect that this was the result of a bug
that has since been fixed. With that change, we can also
compile-test on other architectures.

Link: http://lists.infradead.org/pipermail/linux-mtd/2016-July/068583.html
Fixes: 161aaab8a067 ("mtd: atmel-quadspi: add driver for Atmel QSPI controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/Kconfig         | 2 +-
 drivers/mtd/spi-nor/atmel-quadspi.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 293c8a4d1e49..22e5fc4080f8 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -41,7 +41,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL_QUADSPI
 	tristate "Atmel Quad SPI Controller"
-	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
+	depends on ARCH_AT91 || (COMPILE_TEST && !ARCH_EBSA110)
 	depends on OF && HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
index ba76fa8f2031..ff3849106e77 100644
--- a/drivers/mtd/spi-nor/atmel-quadspi.c
+++ b/drivers/mtd/spi-nor/atmel-quadspi.c
@@ -208,9 +208,9 @@ static int atmel_qspi_run_transfer(struct atmel_qspi *aq,
 	if (cmd->enable.bits.address)
 		ahb_mem += cmd->address;
 	if (cmd->tx_buf)
-		_memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
+		memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
 	else
-		_memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
+		memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
 
 	return 0;
 }
-- 
2.9.0
