Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OOWAJ-0005jB-7w
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 13:26:56 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Tue, 15 Jun 2010 18:56:37 +0530
Subject: RE: [PATCH v5 0/3] omap3 nand: cleanup exiting platform related code
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030DDBEF8A@dbde02.ent.ti.com>
References: <s-ghorai@ti.com> <1275637205-489-1-git-send-email-s-ghorai@ti.com>
	<AANLkTinf8OcvHbLggdEJNGLvlAtSeExKri-IqNlwLpYD@mail.gmail.com>
In-Reply-To: <AANLkTinf8OcvHbLggdEJNGLvlAtSeExKri-IqNlwLpYD@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "tony@atomide.com" <tony@atomide.com>,
	Vimal Singh <vimal.newwork@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: Tuesday, June 08, 2010 10:43 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org;
> tony@atomide.com; mike@compulab.co.il
> Subject: Re: [PATCH v5 0/3] omap3 nand: cleanup exiting platform related
> code
>=20
> Reviewed-by: Vimal Singh <vimal.newwork@gmail.com>
>=20
> On Fri, Jun 4, 2010 at 1:10 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> > =A0 The following set of patches applies on top of for-next branch.
> > =A0 =A0 =A0 =A0http://git.kernel.org/?p=3Dlinux/kernel/git/tmlind/linux=
-omap-
> 2.6.git
> > =A0 Patches verified on: omap3430-SDP, omap3630-sdp, zoom3 and beagle
> board
> >
> > =A0 And these are the patches required to address the following input -
> > =A0 =A0 1. The NAND driver needs to stop tinkering with the GPMC regist=
ers
> > =A0 =A0 =A0 =A0The omap General Purpose Memory Controller (GPMC) regist=
ers are
> omap
> > =A0 =A0 =A0 =A0specific, and not driver specific. Tinkering with these =
registers
> can
> > =A0 =A0 =A0 =A0cause issues with the other devices on the GPMC.
> >
> > =A0 =A0 2. Passing hardcoded GPMC_CS0_BASE needs to go from the board f=
iles
> > =A0 =A0 =A0 =A0Passing hardcoded GPMC virtual addressess is sure way to=
 mess up
> things.
> > =A0 =A0 =A0 =A0This should all become unnecessary once the NAND drivers=
 stops
> messing
> > =A0 =A0 =A0 =A0with the GPMC registers directly.
> > =A0 =A0 Discussion: http://www.mail-archive.com/linux-
> omap@vger.kernel.org/msg27630.html
> >
> > =A0 Changes in this series -
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Unused function removed.
> >
> > =A0Functions related to ecc and prefetch engine are optimized.
> > =A0v4: http://www.mail-archive.com/linux-
> omap@vger.kernel.org/msg29458.html
> >
> > =A0Few functionality was missing =A0like - There should be some locking=
 as
> only
> > =A0 one chipselect can use the ECC or prefetch engine at a time. If you
> have
> > =A0 NAND in two chipselects, bad things would happen.
> > =A0v3: http://www.mail-archive.com/linux-
> omap@vger.kernel.org/msg28715.html
> >
> > =A0Additionally, it was needed to implement more functions for the
> platform
> > =A0init code to use.
> > =A0v2: http://www.mail-archive.com/linux-
> omap@vger.kernel.org/msg28467.html
> >
> > =A0v1: http://www.mail-archive.com/linux-
> omap@vger.kernel.org/msg28164.html
> >
> >
> > Sukumar Ghorai (3):
> > =A0 =A0 =A0 =A0omap3 gpmc: functionality enhancement
> > =A0 =A0 =A0 =A0omap3 nand: cleanup virtual address usages
> > =A0 =A0 =A0 =A0omap3 nand: fix issue in board file to detect nand
> > =A0arch/arm/mach-omap2/board-cm-t35.c =A0 =A0 =A0 =A0 | =A0 20 +---
> > =A0arch/arm/mach-omap2/board-devkit8000.c =A0 =A0 | =A0 25 +---
> > =A0arch/arm/mach-omap2/board-omap3beagle.c =A0 =A0| =A0 24 +---
> > =A0arch/arm/mach-omap2/board-omap3touchbook.c | =A0 25 +---
> > =A0arch/arm/mach-omap2/board-overo.c =A0 =A0 =A0 =A0 =A0| =A0 24 +---
> > =A0arch/arm/mach-omap2/board-sdp-flash.c =A0 =A0 =A0| =A0 =A05 -
> > =A0arch/arm/mach-omap2/gpmc-nand.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 39 ++--=
--
> > =A0arch/arm/mach-omap2/gpmc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0228
> +++++++++++++++++++++++++---
> > =A0arch/arm/plat-omap/include/plat/gpmc.h =A0 =A0 | =A0 36 ++++-
> > =A0arch/arm/plat-omap/include/plat/nand.h =A0 =A0 | =A0 =A06 +-
> > =A0drivers/mtd/nand/omap2.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A022=
9 ++++++++-------------
> -------
> > =A011 files changed, 320 insertions(+), 341 deletions(-)

[Ghorai] Any comments or input on these patch?

> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> >
>=20
>=20
>=20
> --
> Regards,
> Vimal Singh
