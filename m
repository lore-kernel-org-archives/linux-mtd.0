Received: from mail-qk0-f172.google.com ([209.85.220.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn6vs-0007Ee-CD
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 15:28:37 +0000
Received: by qkht68 with SMTP id t68so55617844qkh.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 08:28:14 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:24:17 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: pxa3xx_nand: switch to device PM
Message-ID: <20151016152416.GA14509@laptop.cereza>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
 <20151012210741.GN107187@google.com>
 <CAAEAJfDWY2ztYK5y=cBsrntztP+Hm_cDFovPY2YeyRS4XXrr8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAEAJfDWY2ztYK5y=cBsrntztP+Hm_cDFovPY2YeyRS4XXrr8w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 Oct 03:32 PM, Ezequiel Garcia wrote:
> +Robert
> 
> On 12 October 2015 at 18:07, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Oct 12, 2015 at 01:33:12PM -0700, Brian Norris wrote:
> >> The old PM model is deprecated. This is equivalent.
> >>
> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >
> > Sorry, this patch was garbage. Below is the correct one:
> >

Tested on Armada XP-GP using standby and checking nandtest
continues to work after a resume.

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Patch looks good, so:

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!

> > ---
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index cce5a32eef60..51b67ae5ac1c 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -1889,21 +1889,21 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
> >  }
> >
> >  #ifdef CONFIG_PM
> > -static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
> > +static int pxa3xx_nand_suspend(struct device *dev)
> >  {
> > -       struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
> > +       struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
> >
> >         if (info->state) {
> > -               dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
> > +               dev_err(dev, "driver busy, state = %d\n", info->state);
> >                 return -EAGAIN;
> >         }
> >
> >         return 0;
> >  }
> >
> > -static int pxa3xx_nand_resume(struct platform_device *pdev)
> > +static int pxa3xx_nand_resume(struct device *dev)
> >  {
> > -       struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
> > +       struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
> >
> >         /* We don't want to handle interrupt without calling mtd routine */
> >         disable_int(info, NDCR_INT_MASK);
> > @@ -1930,15 +1930,19 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
> >  #define pxa3xx_nand_resume     NULL
> >  #endif
> >
> > +static const struct dev_pm_ops pxa3xx_nand_pm_ops = {
> > +       .suspend        = pxa3xx_nand_suspend,
> > +       .resume         = pxa3xx_nand_resume,
> > +};
> > +
> >  static struct platform_driver pxa3xx_nand_driver = {
> >         .driver = {
> >                 .name   = "pxa3xx-nand",
> >                 .of_match_table = pxa3xx_nand_dt_ids,
> > +               .pm     = &pxa3xx_nand_pm_ops,
> >         },
> >         .probe          = pxa3xx_nand_probe,
> >         .remove         = pxa3xx_nand_remove,
> > -       .suspend        = pxa3xx_nand_suspend,
> > -       .resume         = pxa3xx_nand_resume,
> >  };
> >
> >  module_platform_driver(pxa3xx_nand_driver);
> > --
> > 2.6.0.rc2.230.g3dd15c0
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
> -- 
> Ezequiel García, VanguardiaSur
> www.vanguardiasur.com.ar

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
