Received: from mail-bn1bon0139.outbound.protection.outlook.com
 ([157.56.111.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwaS0-0001kJ-9H
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 18:48:57 +0000
Message-ID: <1447267701.2262.201.camel@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
From: Scott Wood <scottwood@freescale.com>
To: Han Xu <han.xu@freescale.com>, Yuan Yao-B46683 <yao.yuan@freescale.com>
CC: Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Li Yang-Leo-R58472
 <LeoLi@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Wed, 11 Nov 2015 12:48:21 -0600
In-Reply-To: <20151111175112.GA30612@chopperman.am.freescale.net>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111175112.GA30612@chopperman.am.freescale.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-11-11 at 11:51 -0600, Han Xu wrote:
> On Fri, Oct 30, 2015 at 04:49:41AM -0500, Yuan Yao-B46683 wrote:
> > Hi Fabio Estevam,
> > 
> > Thanks for your suggestion.
> > We have an internal discussions for that.
> > 
> > We think that:
> > According to the initial commit message of regmap, it is targeting non
> > -memory mapped buses. (regmap: Add generic non-memory mapped register
> > access API)  But in the imx2_wdt driver, it is used for memory-mapped
> > register space.  So it seems that using such a complex framework just to
> > deal with endian is an over-kill.
> > 
> > when it is not necessary to enable the clock every time we access the
> > register.  
> > We don't think it is obvious to us how to use it for handling endianness,
> > especially not the way imx2_wdt uses regmap.  __regmap_init_mmio_clk()
> > calls regmap_mmio_gen_context() which errors out if reg_format_endian is
> > not REGMAP_ENDIAN_DEFAULT or REGMAP_ENDIAN_NATIVE, and elsewhere regmap
> > -mmio.c It seems only little-endian accessors.
> > 
> > Although it is possible to add the endianness support in the regmap_mmio
> > driver, we don't see too much value in using it especially 
> > 
> > So we think:
> > static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> > *addr) {
> >       if (q->big_endian)
> >               iowrite32be(val, addr);
> >       else
> >               iowrite32(val, addr);
> > }
> > This way is an easier, more effective solution to do the endian issue.
> > 
> > How about your think?
> 
> I think the implement is fine, but I prefer to use quirk rather than
> read from dts? Please also rebase the patch to latest l2-mtd code.

What specifically do you mean by "use quirk rather than read from dts"?  The
information has to come from the device tree at some point, and it can't be
inferred from the compatible string (and thus the choice of
fsl_qspi_devtype_data instance) because the variance is in how the controller
is hooked up to the SoC, not in the controller itself.

-Scott
