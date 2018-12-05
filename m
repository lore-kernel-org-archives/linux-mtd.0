Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUSHc-0003RB-Rm
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 08:11:50 +0000
Date: Wed, 5 Dec 2018 09:11:27 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: Move the nor->info assignment
 earlier in the scan func
Message-ID: <20181205091127.1c91eef6@bbrezillon>
In-Reply-To: <7376425b-fae3-2bce-4375-2c2c50c9e741@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-7-boris.brezillon@bootlin.com>
 <7376425b-fae3-2bce-4375-2c2c50c9e741@microchip.com>
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

On Tue, 4 Dec 2018 20:21:36 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/29/2018 04:10 PM, Boris Brezillon wrote:
> > Some functions called from spi_nor_scan() need a flash_info object.
> > Let's assign nor->info early on to avoid passing info as an extra
> > argument to each of these sub-functions.  
> 
> Why not to squash it with patch 3?

Makes sense. I'll squash this patch in patch 3 and reword the commit
message accordingly.

> 
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> > Changes in v2:
> > - New patch
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++----------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index d2b09f52b1fb..c1d9c2e50bee 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -238,9 +238,10 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
> >  				      ARRAY_SIZE(spi_nor_3to4_erase));
> >  }
> >  
> > -static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
> > -				      const struct flash_info *info)
> > +static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
> >  {
> > +	const struct flash_info *info = nor->info;
> > +
> >  	/* Do some manufacturer fixups first */
> >  	switch (JEDEC_MFR(info)) {
> >  	case SNOR_MFR_SPANSION:
> > @@ -2023,8 +2024,9 @@ static int spi_nor_check(struct spi_nor *nor)
> >  	return 0;
> >  }
> >  
> > -static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
> > +static int s3an_nor_scan(struct spi_nor *nor)
> >  {
> > +	const struct flash_info *info = nor->info;  
> 
> info is used in this function just to get info->n_sectors. We can dereference
> n_sectors directly.

Sure.

> 
> >  	int ret;
> >  	u8 val;
> >  
> > @@ -3204,10 +3206,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
> >  }
> >  
> >  static int spi_nor_init_params(struct spi_nor *nor,
> > -			       const struct flash_info *info,
> >  			       struct spi_nor_flash_parameter *params)
> >  {
> >  	struct spi_nor_erase_map *map = &nor->erase_map;
> > +	const struct flash_info *info = nor->info;
> >  	u8 i, erase_mask;
> >  
> >  	/* Set legacy flash parameters as default. */
> > @@ -3472,10 +3474,11 @@ static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
> >  	return 0;
> >  }
> >  
> > -static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
> > +static int spi_nor_setup(struct spi_nor *nor,
> >  			 const struct spi_nor_flash_parameter *params,
> >  			 const struct spi_nor_hwcaps *hwcaps)
> >  {
> > +	const struct flash_info *info = nor->info;  
> 
> info is used in this function just to pass the info->sector_size to
> spi_nor_select_erase(). We can dereference sector_size directly,  without even
> declaring a local variable.

Ditto.

Thanks for the review.

Boris
