Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVC9S-00019U-Ji
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:10:31 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [v5,2/3] mtd: spi-nor: Add a post BFPT parsing fixup hook
Date: Fri,  7 Dec 2018 10:10:22 +0100
Message-Id: <20181207091022.16983-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181206103736.5957-3-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-12-06 at 10:37:35 UTC, Boris Brezillon wrote:
> Experience has proven that SFDP tables are sometimes wrong, and parsing
> of these broken tables can lead to erroneous flash config.
> 
> This leaves us 2 options:
> 
> 1/ set the SPI_NOR_SKIP_SFDP flag and completely ignore SFDP parsing
> 2/ fix things at runtime
> 
> While #1 should always work, it might imply extra work if most of the
> SFDP is correct. #2 has the benefit of keeping the generic SFDP parsing
> logic almost untouched while allowing SPI NOR manufacturer drivers to
> fix the broken bits.
> 
> Add a spi_nor_fixups struct where we'll put all our fixup hooks, each
> of them being called at a different point in the scan process.
> 
> We start a hook called just after the BFPT parsing to allow fixing up
> info extracted from the BFPT section. More hooks will be added if other
> sections need to be fixed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next.

Boris
