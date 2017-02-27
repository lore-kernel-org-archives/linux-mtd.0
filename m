Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciK7v-0006Pw-OX
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 12:10:06 +0000
From: Vignesh R <vigneshr@ti.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, Vignesh R <vigneshr@ti.com>, Frode Isaksen
 <fisaksen@baylibre.com>, <linux-spi@vger.kernel.org>
Subject: [RFC PATCH 0/2] mtd: spi-nor: Handle vmalloc'd buffers
Date: Mon, 27 Feb 2017 17:38:37 +0530
Message-ID: <20170227120839.16545-1-vigneshr@ti.com>
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

This series implements bounce buffer support to handle vmalloc'd buffers
in case of drivers use DMA, similar to what is done in MTD NAND
framework.

I have tested this on two platform:
DRA74 SoC (cortex a15 @1GHz) with s25fl256s1 QSPI (SPI bus frequency
76.8 MHz) and I don't see any performance degradation with UBIFS
read/write(10MB file).
AM437x SoC (cortex a9 @1GHz) with macronix mx66l51235l QSPI flash (SPI bus
frequency 48MHz) and performance degradation is <4% for UBIFS.


Vignesh R (2):
  mtd: spi-nor: Introduce bounce buffer to handle vmalloc'd buffers
  mtd: devices: m25p80: Enable spi-nor bounce buffer support

 drivers/mtd/devices/m25p80.c  |  1 +
 drivers/mtd/spi-nor/spi-nor.c | 30 +++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   |  4 ++++
 3 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.11.0
