Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlYnG-0007tF-GR
 for linux-mtd@lists.infradead.org; Sat, 17 May 2014 07:12:31 +0000
Date: Sat, 17 May 2014 15:12:02 +0800 (SGT)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: delete unneeded call to platform_get_drvdata
In-Reply-To: <CAOMZO5AymcCnC6Awt2LiGP9yz=baRA0HLoLRUSBgNeg3b5=9xQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1405171511140.2587@hadrien>
References: <1400308369-24375-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAOMZO5AymcCnC6Awt2LiGP9yz=baRA0HLoLRUSBgNeg3b5=9xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Sat, 17 May 2014, Fabio Estevam wrote:

> On Sat, May 17, 2014 at 3:32 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > Platform_get_drvdata is an accessor function, and has no purpose if its
> > result is not used.
> >
> > The semantic patch that fixes this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @@
> > identifier x;
> > type T;
> > @@
> > - T x = platform_get_drvdata(...);
> > ... when != x
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> >  drivers/mtd/nand/bf5xx_nand.c |    4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> > index b7a2494..b5fbd48 100644
> > --- a/drivers/mtd/nand/bf5xx_nand.c
> > +++ b/drivers/mtd/nand/bf5xx_nand.c
> > @@ -840,15 +840,11 @@ out_err_kzalloc:
> >
> >  static int bf5xx_nand_suspend(struct platform_device *dev, pm_message_t pm)
> >  {
> > -       struct bf5xx_nand_info *info = platform_get_drvdata(dev);
> > -
> >         return 0;
> >  }
> >
> >  static int bf5xx_nand_resume(struct platform_device *dev)
> >  {
> > -       struct bf5xx_nand_info *info = platform_get_drvdata(dev);
> > -
> >         return 0;
>
> In this case bf5xx_nand_suspend/resume could be removed?

I don't know.  It looks like it is intentional to have a definition that
returns an indication of success?  The complete set of definitions is:

#ifdef CONFIG_PM

static int bf5xx_nand_suspend(struct platform_device *dev, pm_message_t
pm)
{
        struct bf5xx_nand_info *info = platform_get_drvdata(dev);

	return 0;
}

static int bf5xx_nand_resume(struct platform_device *dev)
{
        struct bf5xx_nand_info *info = platform_get_drvdata(dev);

        return 0;
}

#else
#define bf5xx_nand_suspend NULL
#define bf5xx_nand_resume NULL
#endif

julia
