Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFnn1-00060i-G4
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 17:17:15 +0000
Received: by mail-pa0-f42.google.com with SMTP id lf10so7689807pab.29
 for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2014 10:16:53 -0700 (PDT)
Date: Fri, 8 Aug 2014 10:16:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
Message-ID: <20140808171650.GS3711@ld-irv-0074>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru>
 <20140808170428.GA6094@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140808170428.GA6094@arch.cereza>
Cc: Alexander Holler <holler@ahsoftware.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 08, 2014 at 02:04:28PM -0300, Ezequiel Garcia wrote:
> Picking on this old thread...
> 
> On 27 May 07:12 AM, Alexander Shiyan wrote:
> > > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > > index 7588fe2..7f62e7c 100644
> > > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > > @@ -1584,8 +1584,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
> > >  		host->mtd = mtd;
> > >  		host->cs = cs;
> > >  		host->info_data = info;
> > > -		mtd->priv = host;
> > > -		mtd->owner = THIS_MODULE;
> > > +		mtd_setup_common_members(mtd, host, pdev);
> > >  
> > >  		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
> > >  		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
> > > -- 
> > 
> > Should we add "driver.owner = THIS_MODULE" field for struct platform_driver in this case?
> > 
> 
> As far as I can see, for platform drivers, the owner of the driver is fixed to
> THIS_MODULE in __platform_driver_register().

Looks like it. So any driver using module_platform_driver() or
platform_driver_register() and also initializes
platform_driver.driver.owner is just being redundant.

Maybe another "cleanup" project for Jingoo Han? ;)

> If there's anything left to fix for this driver, please let me know.

pxa3xx_nand is still missing a parent for its MTD's (mtd->dev.parent). I
have a follow-up patch queued up locally that I need to send out
sometime.

Brian
