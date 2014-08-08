Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFnc0-0000kj-Jy
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 17:05:57 +0000
Date: Fri, 8 Aug 2014 14:04:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
Message-ID: <20140808170428.GA6094@arch.cereza>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1401160341.192042842@f271.i.mail.ru>
Cc: Alexander Holler <holler@ahsoftware.de>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Picking on this old thread...

On 27 May 07:12 AM, Alexander Shiyan wrote:
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index 7588fe2..7f62e7c 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -1584,8 +1584,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
> >  		host->mtd = mtd;
> >  		host->cs = cs;
> >  		host->info_data = info;
> > -		mtd->priv = host;
> > -		mtd->owner = THIS_MODULE;
> > +		mtd_setup_common_members(mtd, host, pdev);
> >  
> >  		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
> >  		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
> > -- 
> 
> Should we add "driver.owner = THIS_MODULE" field for struct platform_driver in this case?
> 

As far as I can see, for platform drivers, the owner of the driver is fixed to
THIS_MODULE in __platform_driver_register().

If there's anything left to fix for this driver, please let me know.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
