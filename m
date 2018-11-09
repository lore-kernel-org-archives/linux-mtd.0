Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL3dV-0002i1-Nw
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 10:03:34 +0000
Date: Fri, 9 Nov 2018 11:03:21 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Make sure SFDP-based 4B_OPCODE
 support detection works correctly
Message-ID: <20181109110321.120cb598@bbrezillon>
In-Reply-To: <6fa42403-3a20-cdbe-caa7-d90c88b51e27@microchip.com>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <10fab1c5-1a40-9d7a-b9d4-ce48afa1635d@microchip.com>
 <20181108180842.48ce6d1b@bbrezillon>
 <6fa42403-3a20-cdbe-caa7-d90c88b51e27@microchip.com>
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

On Fri, 9 Nov 2018 09:57:13 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/08/2018 07:08 PM, Boris Brezillon wrote:
> > On Thu, 8 Nov 2018 16:55:29 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> On 10/31/2018 04:45 PM, Boris Brezillon wrote:  
> >>> Some flash_info entries have the SPI_NOR_4B_OPCODES flag set to let the
> >>> core know that the flash supports 4B opcode. While this solution works
> >>> fine for id-based caps detection, it doesn't work that well when relying
> >>> on SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so that
> >>> spi_nor_parse_bfpt() can add it when the BFPT_DWORD1_ADDRESS_BYTES
> >>> field is set to BFPT_DWORD1_ADDRESS_BYTES_4_ONLY.
> >>>
> >>> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >>> Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>> ---
> >>> Changes in v3:
> >>> - Clear SNOR_F_4B_OPCODES flag when SFDP fails
> >>> - Add Alexandre R-b
> >>>
> >>> Changes in v2:
> >>> - Fix the commit message
> >>> - Fix the ->addr_width check
> >>> - Add a comma at the end of the SNOR_F_4B_OPCODES definition
> >>> ---
> >>>  drivers/mtd/spi-nor/spi-nor.c | 12 +++++++++---
> >>>  include/linux/mtd/spi-nor.h   |  1 +
> >>>  2 files changed, 10 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >>> index 3e54e31889c7..798915b5c2b0 100644
> >>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>> @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >>>  		break;
> >>>  
> >>>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> >>> +		nor->flags |= SNOR_F_4B_OPCODES;
> >>>  		nor->addr_width = 4;
> >>>  		break;
> >>>  
> >>> @@ -3252,6 +3253,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
> >>>  
> >>>  		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> >>>  			nor->addr_width = 0;
> >>> +			nor->flags &= ~SNOR_F_4B_OPCODES;
> >>>  			/* restore previous erase map */
> >>>  			memcpy(&nor->erase_map, &prev_map,
> >>>  			       sizeof(nor->erase_map));
> >>> @@ -3554,7 +3556,7 @@ static int spi_nor_init(struct spi_nor *nor)
> >>>  
> >>>  	if ((nor->addr_width == 4) &&
> >>>  	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> >>> -	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
> >>> +	    !(nor->flags & SNOR_F_4B_OPCODES)) {
> >>>  		/*
> >>>  		 * If the RESET# pin isn't hooked up properly, or the system
> >>>  		 * otherwise doesn't perform a reset command in the boot
> >>> @@ -3588,7 +3590,7 @@ void spi_nor_restore(struct spi_nor *nor)
> >>>  	/* restore the addressing mode */
> >>>  	if ((nor->addr_width == 4) &&
> >>>  	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> >>> -	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
> >>> +	    !(nor->flags & SNOR_F_4B_OPCODES) &&
> >>>  	    (nor->flags & SNOR_F_BROKEN_RESET))
> >>>  		set_4byte(nor, nor->info, 0);
> >>>  }
> >>> @@ -3746,11 +3748,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>>  		nor->addr_width = 4;
> >>>  		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
> >>>  		    info->flags & SPI_NOR_4B_OPCODES)
> >>> -			spi_nor_set_4byte_opcodes(nor, info);
> >>> +			nor->flags |= SNOR_F_4B_OPCODES;
> >>>  	} else {
> >>>  		nor->addr_width = 3;
> >>>  	}
> >>>  
> >>> +	if (nor->addr_width == 4 &&    
> >>
> >> Shouldn't SNOR_F_4B_OPCODES already imply nor->addr_width == 4?  
> > 
> > Can't we have NORs supporting 4B opcodes but are less than 16MB? In
> > this case SNOR_F_4B_OPCODES would be set and ->addr_width would be 3.  
> 
> I guess not, it wouldn't make sense, but who knows ... :)

Don't under-estimate flash manufacturers :-).

> 
> The 4-byte opcodes indicate that 4-bytes of address follow the instruction. And
> 4-byte addresses make sense for spi memories that exceed the 16MB density.

I'm pretty sure they use the same controller for <=16MB and >16MB
chips, so I wouldn't be surprised if some of their modern <=16MB chips
support 4B opcodes even if it's not needed.
