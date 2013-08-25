Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDRUa-0007jS-IP
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2013 03:59:57 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so2173259pdj.29
 for <linux-mtd@lists.infradead.org>; Sat, 24 Aug 2013 20:59:31 -0700 (PDT)
Date: Sun, 25 Aug 2013 12:04:15 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/9] mtd: print out the cell information for nand chip
Message-ID: <20130825160412.GA2391@gmail.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-4-git-send-email-b32955@freescale.com>
 <20130824055821.GB32074@brian-ubuntu>
 <20130824210215.GB9456@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130824210215.GB9456@localhost>
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 24, 2013 at 06:02:16PM -0300, Ezequiel Garcia wrote:
> On Fri, Aug 23, 2013 at 10:58:21PM -0700, Brian Norris wrote:
> > On Mon, Aug 19, 2013 at 10:31:12AM +0800, Huang Shijie wrote:
> > > Print out the cell information for nand chip.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > >  drivers/mtd/nand/nand_base.c |    5 +++--
> > >  1 files changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > index 69c4b25..8b487d5 100644
> > > --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -3454,10 +3454,11 @@ ident_done:
> > >  		chip->cmdfunc = nand_command_lp;
> > >  
> > >  	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
> > > -		" %dMiB, page size: %d, OOB size: %d\n",
> > > +		" %dMiB, %s, page size: %d, OOB size: %d\n",
> > >  		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
> > >  		chip->onfi_version ? chip->onfi_params.model : type->name,
> > > -		(int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
> > > +		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> > > +		mtd->writesize, mtd->oobsize);
> > 
> > This message is getting mighty long (approx. 120 characters when
> > printed). Are you sure we need all this? Maybe split into two separate
> > pr_info's sometime. But I'm OK with merging this for now.
> > 
> 
> Hm.. well, although it's still a two-line message, I also don't like
> to see this growing.
> 
> I think we should try to answer: why would anyone want to see any of
> this when the kernel boots?
> 
> So maybe we should pr_info only the most important information,

But what information can be regarded as the most important?

if you think the cell type information is not so important, i can
abandon this patch.

thanks
Huang Shijie
