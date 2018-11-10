Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLPcX-000063-OO
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2018 09:32:03 +0000
Received: by mail-lj1-x241.google.com with SMTP id t9-v6so3618839ljh.6
 for <linux-mtd@lists.infradead.org>; Sat, 10 Nov 2018 01:31:51 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2 13/22] mtd: rawnand: Pass the CS line to be selected in
 struct nand_operation
Date: Sat, 10 Nov 2018 10:33:39 +0100
Message-ID: <1618873.xLhFaQ4tnF@z50>
In-Reply-To: <20181110090459.7a903858@bbrezillon>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
 <2312482.kRjraIG7a0@z50> <20181110090459.7a903858@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Saturday, November 10, 2018 9:04:59 AM CET Boris Brezillon wrote:
> Hi Janusz,
> 
> On Sat, 10 Nov 2018 02:30:04 +0100
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > Hi Boris,
> > 
> > On Tuesday, November 6, 2018 4:08:01 PM CET Boris Brezillon wrote:
> > > In order to deprecate the ->select_chip hook we need to pass the CS
> > > line a NAND operations are targeting. This is done through the
> > > addition of a cs field to the nand_operation struct.
> > > 
> > > We also need to keep track of the currently selected target to
> > > properly initialize op->cs, hence the ->cur_cs field addition to the
> > > nand_chip struct.
> > > 
> > > Note that op->cs is not assigned in nand_exec_op() because we might
> > > rework the way we execute NAND operations in the future (adopt a
> > > queuing mechanism instead of the serialization we have right now).
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > > Changes in v2:
> > > - Initialize ->cur_cs
> > > ---
> > >  drivers/mtd/nand/raw/internals.h  |  3 +++
> > >  drivers/mtd/nand/raw/nand_base.c  | 39 +++++++++++++++++--------------
> > >  drivers/mtd/nand/raw/nand_hynix.c |  4 ++--
> > >  include/linux/mtd/rawnand.h       | 11 ++++++++-
> > >  4 files changed, 37 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> > > index 6e2f61fbc5f0..b62728d5884b 100644
> > > --- a/drivers/mtd/nand/raw/internals.h
> > > +++ b/drivers/mtd/nand/raw/internals.h
> > > @@ -101,6 +101,9 @@ static inline int nand_exec_op(struct nand_chip *chip,
> > >  	if (!chip->exec_op)
> > >  		return -ENOTSUPP;
> > >  
> > > +	if (WARN_ON(op->cs >= chip->numchips))
> > > +		return -EINVAL;  
> > 
> > This needs a fix to nand_scan_ident() like the following:
> > 
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5034,10 +5034,11 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
> >  
> >  	/* Set the default functions */
> >  	nand_set_defaults(chip);
> >  
> >  	/* Read the flash type */
> > +	chip->numchips = 1;
> 
> Oh, you're right. Actually it should be
> 
> 	chip->numchips = maxchips;

Indeed, setting it to 1 would probably result in chips beyond the first one 
never detected, which is not my case.

> ... 
> > PS.
> > I'm ready to submit a series which converts ams-delta-nand to use GPIO 
> > API for data I/O.  My only concerns is which branch should I rebase it on.
> 
> I'd say nand/next, unless you have dependencies on new GPIO stuff that
> are not in 4.20-rc1.

All GPIO dependencies are already in 4..20-rc1.   My concern was rather 
related to a future merge with this series which will raise some conflicts 
against mine.

Thanks,
Janusz
