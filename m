From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Fri, 6 Aug 2010 14:33:48 +0530
Subject: RE: [PATCH v4 0/4] nand prefetch-irq support and ecc layout chanage
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030E65BEFD@dbde02.ent.ti.com>
References: <1280764192-15053-1-git-send-email-s-ghorai@ti.com> 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tony,

> -----Original Message-----
> From: Ghorai, Sukumar
> Sent: Wednesday, August 04, 2010 9:29 AM
> To: linux-omap@vger.kernel.org; 'Tony Lindgren'
> Cc: linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org
> Subject: RE: [PATCH v4 0/4] nand prefetch-irq support and ecc layout
> chanage
>=20
> > -----Original Message-----
> > From: Ghorai, Sukumar
> > Sent: Monday, August 02, 2010 9:20 PM
> > To: linux-omap@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org=
;
> > Ghorai, Sukumar
> > Subject: [PATCH v4 0/4] nand prefetch-irq support and ecc layout chanag=
e
> >
> >    The following set of patches applies on top of omap-for-linus.
> >
> >    v4: Comments incorporated
> >
> >    v3: http://www.mail-archive.com/linux-
> > omap@vger.kernel.org/msg32071.html
> >    	Rebase on latest codebase and previous patch(posted).
> > 	http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31963.html
> >
> >    v2: Rebase on latest codebase and previous patch(posted).
> > 	http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31471.html
> >
> >    v1: http://www.mail-archive.com/linux-
> > omap@vger.kernel.org/msg26666.html
> >
> > Sukumar Ghorai (4):
> > 	omap3: nand: prefetch in irq mode support
> > 	omap: nand: configurable fifo threshold to gain the throughput
> > 	omap: nand: ecc layout select from board file
> > 	omap: nand: making ecc layout as compatible with romcode ecc
> >
> >  arch/arm/mach-omap2/board-flash.c      |    5 +-
> >  arch/arm/mach-omap2/gpmc.c             |   15 ++-
> >  arch/arm/plat-omap/include/plat/gpmc.h |    9 +-
> >  arch/arm/plat-omap/include/plat/irqs.h |    1 +
> >  arch/arm/plat-omap/include/plat/nand.h |    7 +
> >  drivers/mtd/nand/Kconfig               |   14 ++-
> >  drivers/mtd/nand/omap2.c               |  277
> > ++++++++++++++++++++++++++++---
> >  7 files changed, 294 insertions(+), 34 deletions(-)
> [Ghorai]
> Tony,
> Would you please check if you have any input further?

[Ghorai]=20
Tony,
Would you please check the status of these patch(s).

Regards,
Ghorai
