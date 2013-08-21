Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC33M-0001tl-7u
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 07:42:05 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RESEND][PATCH] mtd: chips: Add support for PMC SPI Flash chips
 in m25p80.c
Date: Wed, 21 Aug 2013 09:41:38 +0200
References: <51E3CB64.4080107@wanadoo.fr> <20130821072729.GA31788@brian-ubuntu>
In-Reply-To: <20130821072729.GA31788@brian-ubuntu>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201308210941.38483.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Michel Stempin <michel.stempin@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> + Marek, since he's been reviewing (with dismay?) the increase in macro
> flags in this driver. If there are any objections, I can amend/drop the
> patch.

Hmmm ... this SECT_4K_PMC seems too combined to me. Why don't we use the SECT_4K 
flag and another flag to indicate it's a PMC part? Even better, I recall you can 
just read the chip jedec ID and determine if it's a PMC part according to that. 
Then if it is PMC AND the SECT_4K flag is set, there is no need to add another 
flag at all, no?

> But in the meantime, I fixed a conflict with stuff that's been applied
> since you submitted this patch, and applied to l2-mtd.git. Thanks!
> 
> Brian
> 
> On Mon, Jul 15, 2013 at 12:13:56PM +0200, Michel Stempin wrote:
> > Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit),
> > Pm25LV010 (1 Mbit) and Pm25LQ032 (32 Mbit) SPI Flash chips.
> > 
> > This patch addresses two generations of PMC SPI Flash chips:
> >  - Pm25LV512 and Pm25LV010: these have 4KB sectors and 32KB
> >  
> >    blocks. The 4KB sector erase uses a non-standard opcode
> >    (0xd7). They do not support JEDEC RDID (0x9f), and so they can only
> >    be detected by matching their name string with pre-configured
> >    platform data. Because of the cascaded acquisitions, the datasheet
> >    is no longer available on the current manufacturer's website,
> >    although it is still commonly used in some recent wireless routers
> >    (<https://forum.openwrt.org/viewtopic.php?pid=186360#p186360>). The
> >    only public datasheet available seems to be on GeoCities:
> >    <http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf>
> >  
> >  - Pm25LQ032: a newer generation flash, with 4KB sectors and 32KB
> >  
> >    blocks. It uses the standard erase and JEDEC read-ID
> >    opcodes. Manufacturer's datasheet is here:
> >    <http://www.chingistek.com/img/Product_Files/Pm25LQ032C%20datasheet%20
> >    v1.6.1.pdf>
> > 
> > This patch is resent in order to take into account both Brian Norris
> > remarks and this upstream patch:
> > 
> > commit e534ee4f9ca29fdb38eea4b0c53f2154fbd8c1ee
> > Author: Krzysztof Mazur <krzysiek@podlesie.net>
> > Date:   Fri Feb 22 15:51:05 2013 +0100
> > 
> >     mtd: m25p80: introduce SST_WRITE flag for SST byte programming
> >     
> >     Not all SST devices implement the SST byte programming command.
> >     Some devices (like SST25VF064C) implement only standard m25p80 page
> >     write command.
> >     
> >     Now SPI flash devices that need sst_write() are explicitly marked
> >     with new SST_WRITE flag and the decision to use sst_write() is based
> >     on this flag instead of manufacturer id.
> >     
> >     Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>
> >     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > 
> > Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> > Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
> > ---
> > 
> >  drivers/mtd/devices/m25p80.c |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 2f3d2a5..55c8b5f 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -43,6 +43,7 @@
> > 
> >  #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high 
frequency) */
> >  #define	OPCODE_PP		0x02	/* Page program (up to 256 
bytes) */
> >  #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
> > 
> > +#define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips 
*/
> > 
> >  #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
> >  #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash chip */
> >  #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) 
*/
> > 
> > @@ -682,6 +683,7 @@ struct flash_info {
> > 
> >  #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly 
*/
> >  #define	M25P_NO_ERASE	0x02		/* No erase command needed */
> >  #define	SST_WRITE	0x04		/* use SST byte programming */
> > 
> > +#define	SECT_4K_PMC	0x08		/* OPCODE_BE_4K_PMC works 
uniformly */
> > 
> >  };
> >  
> >  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
> > 
> > @@ -762,6 +764,11 @@ static const struct spi_device_id m25p_ids[] = {
> > 
> >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
> >  	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
> > 
> > +	/* PMC */
> > +	{ "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
> > +	{ "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
> > +	{ "pm25lq032", INFO(0x7f9d46, 0, 64 * 1024,  64, SECT_4K) },
> > +
> > 
> >  	/* Spansion -- single (large) sector size only, at least
> >  	
> >  	 * for the chips listed here (without boot sectors).
> >  	 */
> > 
> > @@ -1014,6 +1021,9 @@ static int m25p_probe(struct spi_device *spi)
> > 
> >  	if (info->flags & SECT_4K) {
> >  	
> >  		flash->erase_opcode = OPCODE_BE_4K;
> >  		flash->mtd.erasesize = 4096;
> > 
> > +	} else if (info->flags & SECT_4K_PMC) {
> > +		flash->erase_opcode = OPCODE_BE_4K_PMC;
> > +		flash->mtd.erasesize = 4096;
> > 
> >  	} else {
> >  	
> >  		flash->erase_opcode = OPCODE_SE;
> >  		flash->mtd.erasesize = info->sector_size;

Best regards,
Marek Vasut
