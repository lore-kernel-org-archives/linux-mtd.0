Received: from de01.mail.all-tld.net ([195.140.232.8])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEh5U-0004tB-Rk
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 11:05:21 +0000
Date: Wed, 19 May 2010 13:05:00 +0200
From: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
To: Andrew Morton <akpm@linux-foundation.org>
References: <1271231840l.5270l.0l@i-dmzi_al.realan.de>
	<20100421152410.0fea5e12.akpm@linux-foundation.org>
In-Reply-To: <20100421152410.0fea5e12.akpm@linux-foundation.org> (from
	akpm@linux-foundation.org on Thu Apr 22 00:24:10 2010)
Message-Id: <1274267100l.1747l.1l@i-dmzi_al.realan.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	Iwo Mergler <iwo@call-direct.com.au>, linux-mtd@lists.infradead.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2010-04-22 00:24:10, Andrew Morton wrote:
> Finally..  Wouldn't it be better to just fix the atmel SPI driver so
> that it doesn't barf when handed vmalloc'ed memory?  Who do we ridicule
> about that?  <checks, adds cc>

You mean something like this instead?

diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c
index c4e0442..a9ad5e8 100644
--- a/drivers/spi/atmel_spi.c
+++ b/drivers/spi/atmel_spi.c
@@ -352,16 +352,30 @@ atmel_spi_dma_map_xfer(struct atmel_spi *as, struct s=
pi_transfer *xfer)
=20
 	xfer->tx_dma =3D xfer->rx_dma =3D INVALID_DMA_ADDRESS;
 	if (xfer->tx_buf) {
-		xfer->tx_dma =3D dma_map_single(dev,
-				(void *) xfer->tx_buf, xfer->len,
-				DMA_TO_DEVICE);
+		if (is_vmalloc_addr(xfer->tx_buf))
+			xfer->tx_dma =3D dma_map_page(dev,
+					vmalloc_to_page(xfer->tx_buf),
+					(unsigned long)xfer->tx_buf & (PAGE_SIZE-1),
+					xfer->len,
+					DMA_TO_DEVICE);
+		else
+			xfer->tx_dma =3D dma_map_single(dev,
+					(void *) xfer->tx_buf, xfer->len,
+					DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, xfer->tx_dma))
 			return -ENOMEM;
 	}
 	if (xfer->rx_buf) {
-		xfer->rx_dma =3D dma_map_single(dev,
-				xfer->rx_buf, xfer->len,
-				DMA_FROM_DEVICE);
+		if (is_vmalloc_addr(xfer->rx_buf))
+			xfer->rx_dma =3D dma_map_page(dev,
+					vmalloc_to_page(xfer->rx_buf),
+					(unsigned long)xfer->rx_buf & (PAGE_SIZE-1),
+					xfer->len,
+					DMA_FROM_DEVICE);
+		else
+			xfer->rx_dma =3D dma_map_single(dev,
+					xfer->rx_buf, xfer->len,
+					DMA_FROM_DEVICE);
 		if (dma_mapping_error(dev, xfer->rx_dma)) {
 			if (xfer->tx_buf)
 				dma_unmap_single(dev,
