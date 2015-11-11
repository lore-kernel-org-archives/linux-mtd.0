Received: from mail-bl2on0749.outbound.protection.outlook.com
 ([2a01:111:f400:fc09::749] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwZjr-0005mL-Tk
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 18:03:21 +0000
Date: Wed, 11 Nov 2015 11:51:13 -0600
From: Han Xu <han.xu@freescale.com>
To: Yuan Yao-B46683 <yao.yuan@freescale.com>
CC: Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Li Yang-Leo-R58472
 <LeoLi@freescale.com>, Wood Scott-B07421 <scottwood@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20151111175112.GA30612@chopperman.am.freescale.net>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 04:49:41AM -0500, Yuan Yao-B46683 wrote:
> Hi Fabio Estevam,
> 
> Thanks for your suggestion.
> We have an internal discussions for that.
> 
> We think that:
> According to the initial commit message of regmap, it is targeting non-memory mapped buses. (regmap: Add generic non-memory mapped register access API)  But in the imx2_wdt driver, it is used for memory-mapped register space.  So it seems that using such a complex framework just to deal with endian is an over-kill.
> 
> when it is not necessary to enable the clock every time we access the register.  
> We don't think it is obvious to us how to use it for handling endianness, especially not the way imx2_wdt uses regmap.  __regmap_init_mmio_clk() calls regmap_mmio_gen_context() which errors out if reg_format_endian is not REGMAP_ENDIAN_DEFAULT or REGMAP_ENDIAN_NATIVE, and elsewhere regmap-mmio.c It seems only little-endian accessors.
> 
> Although it is possible to add the endianness support in the regmap_mmio driver, we don't see too much value in using it especially 
> 
> So we think:
> static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> *addr) {
>       if (q->big_endian)
>               iowrite32be(val, addr);
>       else
>               iowrite32(val, addr);
> }
> This way is an easier, more effective solution to do the endian issue.
> 
> How about your think?

I think the implement is fine, but I prefer to use quirk rather than
read from dts? Please also rebase the patch to latest l2-mtd code.

> 
> Best Regards,
> Yuan Yao
> 
> On Sat, Oct 24, 2015 at 11:47 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > On Fri, Oct 23, 2015 at 5:53 AM, Yuan Yao <yao.yuan@freescale.com> wrote:
> > 
> > > +static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> > > +*addr) {
> > > +       if (q->big_endian)
> > > +               iowrite32be(val, addr);
> > > +       else
> > > +               iowrite32(val, addr);
> > > +}
> > 
> > I suggest you to implement regmap support for this driver instead.
> > 
> > Take a look at drivers/watchdog/imx2_wdt.c for a reference.
> > 
> > Then you only need to pass 'big-endian' as a property for the qspi in the .dtsi
> > file and regmap core will take care of endianness.

-- 
Best Regards,

Han "Allen" Xu
