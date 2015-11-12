Received: from mail-bl2on0129.outbound.protection.outlook.com ([65.55.169.129]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwonI-0005Js-9X
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 10:07:53 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: Xu Han <han.xu@freescale.com>
CC: Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Li Leo <LeoLi@freescale.com>,
 Scott Wood <scottwood@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Thu, 12 Nov 2015 10:07:29 +0000
Message-ID: <BLUPR03MB1348A5FF31DA8A5D3302FA483120@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111175112.GA30612@chopperman.am.freescale.net>
In-Reply-To: <20151111175112.GA30612@chopperman.am.freescale.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> > According to the initial commit message of regmap, it is targeting non-
> memory mapped buses. (regmap: Add generic non-memory mapped register
> access API)  But in the imx2_wdt driver, it is used for memory-mapped reg=
ister
> space.  So it seems that using such a complex framework just to deal with
> endian is an over-kill.
> >
> > when it is not necessary to enable the clock every time we access the r=
egister.
> > We don't think it is obvious to us how to use it for handling endiannes=
s,
> especially not the way imx2_wdt uses regmap.  __regmap_init_mmio_clk()
> calls regmap_mmio_gen_context() which errors out if reg_format_endian is
> not REGMAP_ENDIAN_DEFAULT or REGMAP_ENDIAN_NATIVE, and elsewhere
> regmap-mmio.c It seems only little-endian accessors.
> >
> > Although it is possible to add the endianness support in the
> > regmap_mmio driver, we don't see too much value in using it especially
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
>=20
> I think the implement is fine, but I prefer to use quirk rather than read=
 from dts?
> Please also rebase the patch to latest l2-mtd code.
>=20

Ok, I will rebase the patch to latest l2-mtd code in the next version.

Thanks.
