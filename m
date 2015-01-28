Date: Wed, 28 Jan 2015 15:17:42 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 2/9] mtd: pxa3xx_nand: add a non mandatory ECC clock
Message-ID: <20150128141742.GB11705@kwain>
References: <1422367816-4257-1-git-send-email-antoine.tenart@free-electrons.com>
 <1422367816-4257-3-git-send-email-antoine.tenart@free-electrons.com>
 <20150128113552.5dd3edc4@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150128113552.5dd3edc4@xhacker>
Cc: "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jisheng!

On Wed, Jan 28, 2015 at 11:35:52AM +0800, Jisheng Zhang wrote:
> On Tue, 27 Jan 2015 06:10:09 -0800
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
> 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index d00ac392d1c4..2681ec4abafa 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -180,7 +180,7 @@ struct pxa3xx_nand_info {
> >  	struct nand_hw_control	controller;
> >  	struct platform_device	 *pdev;
> >  
> > -	struct clk		*clk;
> > +	struct clk		*clk, *ecc_clk;
> >  	void __iomem		*mmio_base;
> >  	unsigned long		mmio_phys;
> >  	struct completion	cmd_complete, dev_ready;
> > @@ -1608,7 +1608,7 @@ static int alloc_nand_resource(struct platform_device
> > *pdev) 
> >  	spin_lock_init(&chip->controller->lock);
> >  	init_waitqueue_head(&chip->controller->wq);
> > -	info->clk = devm_clk_get(&pdev->dev, NULL);
> > +	info->clk = devm_clk_get(&pdev->dev, "nfc");
> >  	if (IS_ERR(info->clk)) {
> 
> Do we need to fall back to unnamed clock here? Otherwise I guess it will break
> other platforms.

Yes, as Andrew pointed out we need to keep the NULL here to avoid
breaking other platforms.

> >  
> >  	/* initialize all interrupts to be disabled */
> > @@ -1687,6 +1694,9 @@ static int alloc_nand_resource(struct platform_device
> > *pdev) fail_free_buf:
> >  	free_irq(irq, info);
> >  	kfree(info->data_buff);
> > +fail_disable_ecc_clk:
> > +	if (!IS_ERR(info->ecc_clk))
> > +		clk_disable_unprepare(info->ecc_clk);
> 
> we can remove the IS_ERR check to simplify this error path since commit
> 63589e92c2d9("clk: Ignore error and NULL pointers passed to clk_{unprepare, disable}()")
> 
> >  fail_disable_clk:
> >  	clk_disable_unprepare(info->clk);
> >  	return ret;
> > @@ -1709,6 +1719,8 @@ static int pxa3xx_nand_remove(struct platform_device
> > *pdev) pxa3xx_nand_free_buff(info);
> >  
> >  	clk_disable_unprepare(info->clk);
> > +	if (!IS_ERR(info->ecc_clk))
> > +		clk_disable_unprepare(info->ecc_clk);
> 
> we can remove the IS_ERR check too.

Yes! Thanks for the hint, I'll remove these useless checks in v2.

Thanks!

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
