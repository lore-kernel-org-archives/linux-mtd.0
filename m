Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKcS-0008P8-FD
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:07:13 +0000
Received: by mail-pb0-f44.google.com with SMTP id rp16so196180pbb.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 00:06:50 -0800 (PST)
Date: Thu, 7 Nov 2013 00:06:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] drivers: mtd: m25p80: convert "bool" read check into
 an enum
Message-ID: <20131107080646.GE3805@norris.computersforpeace.net>
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
 <1383748535-20462-2-git-send-email-sourav.poddar@ti.com>
 <201311062124.37279.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201311062124.37279.marex@denx.de>
Cc: Sourav Poddar <sourav.poddar@ti.com>, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 06, 2013 at 09:24:37PM +0100, Marek Vasut wrote:
> Dear Sourav Poddar,
> 
> > This is a cleanup prior to adding quad read support. This will fecilitate
> > easy addition of more read commands check under an enum rather that
> > defining a seperate bool for it.
> > 
> > Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> > Suggested-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/devices/m25p80.c |   71
> > +++++++++++++++++++++++++++++++++-------- 1 files changed, 57
> > insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 7eda71d..cfafdce 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -84,6 +84,11 @@
> > 
> >  /*************************************************************************
> > ***/
> > 
> > +enum read_type {
> > +	M25P80_NORMAL = 0,
> > +	M25P80_FAST,
> > +};
> > +
> >  struct m25p {
> >  	struct spi_device	*spi;
> >  	struct mutex		lock;
> > @@ -94,7 +99,7 @@ struct m25p {
> >  	u8			read_opcode;
> >  	u8			program_opcode;
> >  	u8			*command;
> > -	bool			fast_read;
> > +	enum read_type		flash_read;
> >  };
> > 
> >  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> > @@ -350,6 +355,24 @@ static int m25p80_erase(struct mtd_info *mtd, struct
> > erase_info *instr) }
> > 
> >  /*
> > + * Dummy Cycle calculation for different type of read.
> > + * It can be used to support more commands with
> > + * different dummy cycle requirement.
> > + */
> > +static inline int m25p80_dummy_cycles_read(struct m25p *flash)
> > +{
> > +	switch (flash->flash_read) {
> > +	case M25P80_FAST:
> > +		return 1;
> > +	case M25P80_NORMAL:
> > +		return 0;
> > +	default:
> > +		dev_err(&flash->spi->dev, "No valid read type supported");
> 
> Does dev_err() insert newlines automatically?

Not sure if this is a rhetorical question, but I'll answer: no,
dev_err() does not insert newlines automatically. The string parameter
should contain the '\n'.

This pair of patches looks good otherwise. I'll see if others have
reviews to make, and I can just fixup the newlines if that's the only
change to make.

Thanks,
Brian
