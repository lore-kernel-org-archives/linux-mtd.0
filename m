Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWHcw-0003tE-Cm
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 09:13:24 +0000
Date: Mon, 10 Dec 2018 10:12:44 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH 34/34] mtd: spi-nor: Add sfdp fixups hooks
Message-ID: <20181210101244.66864d91@bbrezillon>
In-Reply-To: <a82791ca-6c23-3b14-a839-f979041591d7@nokia.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
 <20181207092637.18687-35-boris.brezillon@bootlin.com>
 <a82791ca-6c23-3b14-a839-f979041591d7@nokia.com>
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

On Fri, 7 Dec 2018 16:29:41 +0000
"Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
wrote:

> >  
> >  /**
> >   * struct spi_nor_fixups - SPI NOR fixup hooks
> > + * @sfdp_hdr: SFDP header fixups
> > + * @sfdp_hdr: SFDP parameter headers fixups  
>        ^^^^^^^^
> Should be sfdp_param_hdrs

Oops.

> 
> >   * @post_bfpt: called after the BFPT table has been parsed
> >   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
> >   *	       that do not support RDSFDP). Typically used to tweak various
> > @@ -199,6 +201,11 @@ struct sfdp_bfpt {
> >   * table is broken or not available.
> >   */
> >  struct spi_nor_fixups {
> > +	int (*sfdp_hdr)(struct spi_nor *nor,
> > +			struct sfdp_header *hdr);
> > +	int (*sfdp_param_hdrs)(struct spi_nor *nor,
> > +			       struct sfdp_header *hdr,
> > +			       struct sfdp_parameter_header *param_hdrs);
> >  	int (*post_bfpt)(struct spi_nor *nor,
> >  			 const struct sfdp_parameter_header *bfpt_header,
> >  			 const struct sfdp_bfpt *bfpt,
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index 36343e3e6be0..a8cd070e4ea2 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -534,8 +534,8 @@ static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
> >  static int
> >  spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> >  			 const struct sfdp_parameter_header *bfpt_header,
> > -			 const struct sfdp_bfpt *bfpt,
> > -			 struct spi_nor_flash_parameter *params)
> > +                         const struct sfdp_bfpt *bfpt,
> > +                         struct spi_nor_flash_parameter *params)  
> 
> That's where checkpatch.pl would warn you

Didn't run checkpatch on this series (I tend to not run checkpatch
on big RFC series where I'm expecting feedback on the general
approach).

Anyway, this patch should be dropped since those hooks are not used,
and I don't think we should add new fixup hooks if we don't have a user.
