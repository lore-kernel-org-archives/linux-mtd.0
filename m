Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUYxR-0006zU-0z
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 15:19:27 +0000
Date: Wed, 5 Dec 2018 16:19:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <alexandre.belloni@bootlin.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
Message-ID: <20181205161902.0744f562@bbrezillon>
In-Reply-To: <b6f66057-7b7c-8e9c-1a05-71bf6611ffaa@microchip.com>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-2-boris.brezillon@bootlin.com>
 <b6f66057-7b7c-8e9c-1a05-71bf6611ffaa@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 Dec 2018 15:08:49 +0000
<Tudor.Ambarus@microchip.com> wrote:

> Hi, Boris,
> 
> On 11/29/2018 04:41 PM, Boris Brezillon wrote:
> > Some flash_info entries have the SPI_NOR_4B_OPCODES flag set to let the
> > core know that the flash supports 4B opcode. While this solution works
> > fine for id-based caps detection, it doesn't work that well when relying
> > on SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so
> > that the SFDP parsing code can set it when appropriate.
> > 
> > Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > Changes in v4:
> > - Set SNOR_F_4B_OPCODES flag outside of the if (mtd->size > 0x1000000)
> >   block
> > - Do not set SNOR_F_4B_OPCODES when BFPT_DWORD1_ADDRESS_BYTES_4_ONLY,
> >   because 4byte only does not imply 4B opcodes are supported  
> 
> and you got rid of the superfluous check "(JEDEC_MFR(nor->info) !=
> SNOR_MFR_SPANSION)", which is good, thanks.
> 
> And I guess you should have dropped my rb tag, because I haven't reviewed v4
> yet. No worries, just saying ...

Yes, my bad.

> 
> > 
> > Changes in v3:
> > - Clear SNOR_F_4B_OPCODES flag when SFDP fails
> > - Add Alexandre R-b
> > 
> > Changes in v2:
> > - Fix the commit message
> > - Fix the ->addr_width check
> > - Add a comma at the end of the SNOR_F_4B_OPCODES definition
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++----------
> >  include/linux/mtd/spi-nor.h   |  1 +
> >  2 files changed, 13 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index c1d9c2e50bee..98b8d9a778aa 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -3311,6 +3311,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
> >  
> >  		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> >  			nor->addr_width = 0;
> > +			nor->flags &= ~SNOR_F_4B_OPCODES;
> >  			/* restore previous erase map */
> >  			memcpy(&nor->erase_map, &prev_map,
> >  			       sizeof(nor->erase_map));
> > @@ -3561,9 +3562,7 @@ static int spi_nor_init(struct spi_nor *nor)
> >  		}
> >  	}
> >  
> > -	if ((nor->addr_width == 4) &&
> > -	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> > -	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
> > +	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> >  		/*
> >  		 * If the RESET# pin isn't hooked up properly, or the system
> >  		 * otherwise doesn't perform a reset command in the boot
> > @@ -3595,10 +3594,8 @@ static void spi_nor_resume(struct mtd_info *mtd)
> >  void spi_nor_restore(struct spi_nor *nor)
> >  {
> >  	/* restore the addressing mode */
> > -	if ((nor->addr_width == 4) &&
> > -	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> > -	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
> > -	    (nor->flags & SNOR_F_BROKEN_RESET))
> > +	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
> > +	    nor->flags & SNOR_F_BROKEN_RESET)
> >  		set_4byte(nor, false);
> >  }
> >  EXPORT_SYMBOL_GPL(spi_nor_restore);
> > @@ -3750,6 +3747,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  	if (info->flags & SPI_NOR_NO_FR)
> >  		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> >  
> > +	if (info->flags & SPI_NOR_4B_OPCODES ||
> > +	    (JEDEC_MFR(info) == SNOR_MFR_SPANSION && mtd->size > SZ_16M))
> > +		nor->flags |= SNOR_F_4B_OPCODES;
> > +  
> 
> you are potentially overwriting the SNOR_F_4B_OPCODES that may be set in SFDP. I
> suggest to set SNOR_F_4B_OPCODES flag inside of the "if (mtd->size > 0x1000000)"
> block.

Shouldn't we override this value anyway? I mean, I thought flash_info
flags had precedence on the SFDP ones. Also, just because the flash is
smaller than 16MB, doesn't mean it does not support 4B opcodes. We
probably won't use the 4B opcodes in that case, but still.

> 
> >  	/*
> >  	 * Configure the SPI memory:
> >  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
> > @@ -3768,13 +3769,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  	} else if (mtd->size > 0x1000000) {
> >  		/* enable 4-byte addressing if the device exceeds 16MiB */
> >  		nor->addr_width = 4;
> > -		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
> > -		    info->flags & SPI_NOR_4B_OPCODES)
> > -			spi_nor_set_4byte_opcodes(nor);
> >  	} else {
> >  		nor->addr_width = 3;
> >  	}
> >  
> > +	if (nor->addr_width == 4 &&
> > +	    nor->flags & SNOR_F_4B_OPCODES)  
> 
> the conditions fit in a single line

Will fix that.
