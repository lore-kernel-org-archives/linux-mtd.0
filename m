Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeP5p-0006CV-Qj
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 12:53:50 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] drivers: mtd: m25p80: convert "bool" read check into
 an enum
Date: Thu, 7 Nov 2013 13:53:27 +0100
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
 <201311062124.37279.marex@denx.de>
 <20131107080646.GE3805@norris.computersforpeace.net>
In-Reply-To: <20131107080646.GE3805@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311071353.27910.marex@denx.de>
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

Hi Brian,

> On Wed, Nov 06, 2013 at 09:24:37PM +0100, Marek Vasut wrote:
> > Dear Sourav Poddar,
> > 
> > > This is a cleanup prior to adding quad read support. This will
> > > fecilitate easy addition of more read commands check under an enum
> > > rather that defining a seperate bool for it.
> > > 
> > > Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> > > Suggested-by: Brian Norris <computersforpeace@gmail.com>
> > > ---
> > > 
> > >  drivers/mtd/devices/m25p80.c |   71
> > > 
> > > +++++++++++++++++++++++++++++++++-------- 1 files changed, 57
> > > insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/devices/m25p80.c
> > > b/drivers/mtd/devices/m25p80.c index 7eda71d..cfafdce 100644
> > > --- a/drivers/mtd/devices/m25p80.c
> > > +++ b/drivers/mtd/devices/m25p80.c
> > > @@ -84,6 +84,11 @@
> > > 
> > >  /*********************************************************************
> > >  ****
> > > 
> > > ***/
> > > 
> > > +enum read_type {
> > > +	M25P80_NORMAL = 0,
> > > +	M25P80_FAST,
> > > +};
> > > +
> > > 
> > >  struct m25p {
> > >  
> > >  	struct spi_device	*spi;
> > >  	struct mutex		lock;
> > > 
> > > @@ -94,7 +99,7 @@ struct m25p {
> > > 
> > >  	u8			read_opcode;
> > >  	u8			program_opcode;
> > >  	u8			*command;
> > > 
> > > -	bool			fast_read;
> > > +	enum read_type		flash_read;
> > > 
> > >  };
> > >  
> > >  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> > > 
> > > @@ -350,6 +355,24 @@ static int m25p80_erase(struct mtd_info *mtd,
> > > struct erase_info *instr) }
> > > 
> > >  /*
> > > 
> > > + * Dummy Cycle calculation for different type of read.
> > > + * It can be used to support more commands with
> > > + * different dummy cycle requirement.
> > > + */
> > > +static inline int m25p80_dummy_cycles_read(struct m25p *flash)
> > > +{
> > > +	switch (flash->flash_read) {
> > > +	case M25P80_FAST:
> > > +		return 1;
> > > +	case M25P80_NORMAL:
> > > +		return 0;
> > > +	default:
> > > +		dev_err(&flash->spi->dev, "No valid read type supported");
> > 
> > Does dev_err() insert newlines automatically?
> 
> Not sure if this is a rhetorical question, but I'll answer: no,
> dev_err() does not insert newlines automatically. The string parameter
> should contain the '\n'.
> 
> This pair of patches looks good otherwise. I'll see if others have
> reviews to make, and I can just fixup the newlines if that's the only
> change to make.

Yep, I think the patches are good otherwise. Thanks!
 
> Thanks,
> Brian
