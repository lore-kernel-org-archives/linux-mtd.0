Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vu2FE-00073l-Gm
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 15:44:09 +0000
Received: by mail-pa0-f54.google.com with SMTP id rd3so2760007pab.41
 for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2013 07:43:46 -0800 (PST)
Date: Fri, 20 Dec 2013 23:43:40 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: parse out the datasheet's required minimum
 ECC for Hynix(>=26nm)
Message-ID: <20131220154336.GA667@gmail.com>
References: <1385974906-29891-1-git-send-email-b32955@freescale.com>
 <1385976026-31606-1-git-send-email-b32955@freescale.com>
 <20131220064407.GA16475@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131220064407.GA16475@norris-Latitude-E6410>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 19, 2013 at 10:44:07PM -0800, Brian Norris wrote:
> On Mon, Dec 02, 2013 at 05:20:26PM +0800, Huang Shijie wrote:
> > Parse out the datasheet's required minimum ECC for Hynix nand chips which
> > use the >=26 technology and the id length is 6.
> > 
> > Referencd to the H27UBG8T2B.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/nand/nand_base.c |   20 ++++++++++++++++++++
> >  1 files changed, 20 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 4dab696..5c1ffd0 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > +			chip->ecc_step_ds = 512;
> > +		} else {
> > +			chip->ecc_step_ds = 1024;
> > +			if (tmp == 5)
> > +				chip->ecc_strength_ds = 24;
> > +			else if (tmp == 6)
> > +				chip->ecc_strength_ds = 32;
> > +			else /* (tmp == 7) */
> > +				chip->ecc_strength_ds = 40;
> 
> This ECC table looks incorrect. It matches my datasheet for H27UBG8T2B
> (26nm) but it is incorrect for my H27UBG8T2A (32nm). My datasheet says:

I do not a H27UBG8T2A chip, it is a bad news to me.
why Hynix can not keep the same syntax?
I will abandon the ECC info in the next version.

> 
>   0 ==> 1-bit/512-bytes
>   1 ==> 2-bits/512-bytes
>   2 ==> 4-bits/512-bytes
>   3 ==> 8-bits/512-bytes
>   4 ==> 16-bits/512-bytes
>   5 ==> 24-bits/2048-bytes
>   6 ==> 24-bits/1024-bytes
>   7 ==> Reserved
> 
> Not sure if that's a preliminary version that changed for production
> (the datasheet is Rev 0.6, from 2009; I don't have samples on hand for
> this one), but this demonstrates the larger problem I have with this
> patch series...
> 
> ...that keeping track of minimum ECC requirements is not a scalable
> practice for all flash, especially those that avoid using any proper
> standards. It's difficult enough just getting OOB/page/block sizes
> correct without adding this to the mix. If we add one more thing to get
> wrong (ECC strength/step), we become increasingly fragile.
> 
> Furthermore, it seems that GPMI is the only driver that needs this
not the only. The atmel-nand.c also uses it.

> information in Linux. All other systems determine these things within
> their bootloader, or through some restriction on the devices they
> support (e.g., only support Hamming ECC). So it doesn't seem 100% clear
> that we *must* detect the minimum ECC properties in nand_base. In fact,
> you even agreed (in another thread) that gpmi-nand should probably
> define a more precise nand-ecc-strength and nand-ecc-step-size binding;
> such a binding could eliminate the need for runtime auto-detection.

yes. you can add the new DTs when you are free. Or I add it when i
finish my job in my hands.

thanks
Huang Shijie
