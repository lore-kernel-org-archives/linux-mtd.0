Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsooK-00039h-V3
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 07:11:21 +0000
Received: by mail-pb0-f46.google.com with SMTP id md12so6566743pbc.19
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 23:10:59 -0800 (PST)
Date: Mon, 16 Dec 2013 23:10:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217071052.GG12034@norris-Latitude-E6410>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131216043040.GB27109@shlinux2.ap.freescale.net>
Cc: dwmw2@infradead.org, Elie De Brauwer <eliedebrauwer@gmail.com>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 12:30:41PM +0800, Huang Shijie wrote:
> On Sun, Dec 15, 2013 at 07:44:21PM +0100, Elie De Brauwer wrote:
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > @@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
> >  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
> >  
> > +	/*
> > +	 * Set the tolerance for bitflips when reading erased blocks
> > +	 * equal to the ecc_strength.
> > +	 */
> Please also add the following comment :
>    "We even detect the bitflips for SLC nand."

I don't think we need a comment specifically about SLC here in the code.
Unless otherwise stated, I think any comments should apply to both SLC
and MLC, right? But it could be worth mentioning in the _commit message_
that this problem occurs on both MLC and SLC, just for history's sake.

> > @@ -1094,6 +1101,16 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
> >  	return reg & mask;
> >  }
> >  
> > +/* Returns 1 if the last transaction consisted only out of ones. */
> > +int gpmi_allones(struct gpmi_nand_data *this)

Sorry to nitpick, but 'allones' is a bit confusing. It took me a few
seconds to parse that, since it almost looks like it could be a real
English word. Perhaps gpmi_all_ones()?

Thanks,
Brian
