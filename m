Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5xC-0000ec-Hx
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:37:49 +0000
CC: MTD Maling List <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Frode Isaksen
 <fisaksen@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King
 <linux@armlinux.org.uk>
From: Vignesh R <vigneshr@ti.com>
Subject: Handling vmalloc'd buffers in spi-nor
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>
Message-ID: <8cf1d1d9-38a1-cbef-9a9b-07d2ecf2727f@ti.com>
Date: Tue, 21 Feb 2017 14:07:08 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have come across couple of problems[1] when using m25p80 driver with
SPI flash over SPI bus with DMA. Basically filesystems like UBIFS may
pass vmalloc'd buffers to SPI NOR layer which will end up in SPI layer.
SPI core does try to handle such buffers (see spi_map_buf()) by doing
vmalloc_to_page() and creating scatterlist.
But, its known that this does not work well with VIVT/aliasing cache
architectures.
This also fails when buffers are addressed using LPAE (buffers in region
higher than 32 bit addressable region), if DMA is 32bit only.

IMO, it would be better if vmalloc'd buffers are handled in SPI NOR
layer, just like nand, instead of passing them onto SPI layer.
In order to deal with vmalloc'd buffers passed by higher layers (like
UBIFS), I propose to use pre-allocated per flash bounce buffer equal to
the sector size of the flash. This feature can be enabled using a flag
similar to NAND_USE_BOUNCE_BUFFER. The changes will be mostly restricted
to spi_nor_read/write functions. This will help SPI drivers to use DMA
with NOR flashes with filesystems.

This would also enable other SPI NOR drivers to safely use DMA in their
read/write callbacks.

Any thoughts/comments?

Thanks!

[1]https://www.spinics.net/lists/arm-kernel/msg563773.html

-- 
Regards
Vignesh
