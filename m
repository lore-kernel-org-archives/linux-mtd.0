Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9dnD-0002ZW-N8
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 12:33:36 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Vimal Singh <vimal.newwork@gmail.com>, "Artem.Bityutskiy@nokia.com"
	<Artem.Bityutskiy@nokia.com>, Tony Lindgren <tony@atomide.com>
Date: Wed, 5 May 2010 18:03:22 +0530
Subject: RE: Upcoming merge window and omap NAND patches
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D7DEB6B@dbde02.ent.ti.com>
References: <20100504220803.GN29604@atomide.com>
	<1273034943.3702.19.camel@localhost>
	<l2wce9ab5791005042311lf1c1a15fu891457f4e0863d6@mail.gmail.com>
In-Reply-To: <l2wce9ab5791005042311lf1c1a15fu891457f4e0863d6@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Steve Sakoman <sakoman@gmail.com>,
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
I understand your comment/input. And I will work on it.=20

All existing omap3 boards are using same old fashion. So let me see how man=
y board I can test before post the patch. I will update this next week.

Regards,
Ghorai

> -----Original Message-----
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: 2010-05-05 11:42
> To: Artem.Bityutskiy@nokia.com
> Cc: Tony Lindgren; linux-omap@vger.kernel.org; linux-
> mtd@lists.infradead.org; Ghorai, Sukumar; Steve Sakoman; Mike Rapoport
> Subject: Re: Upcoming merge window and omap NAND patches
>=20
> On Wed, May 5, 2010 at 10:19 AM, Artem Bityutskiy
> <Artem.Bityutskiy@nokia.com> wrote:
> > On Wed, 2010-05-05 at 00:08 +0200, ext Tony Lindgren wrote:
> >> Hi all,
> >>
> >> There are several omap NAND patches pending, but some basic things
> >> should be fixed first.
> >>
> >> 1. The NAND driver needs to stop tinkering with the GPMC registers
> >>
> >> The omap General Purpose Memory Controller (GPMC) registers are omap
> >> specific, and not driver specific. Tinkering with these registers
> >> can cause issues with the other devices on the GPMC.
> >>
> >> To find out what needs to disappear fomr the NAND driver, just do:
> >>
> >> $ grep baseaddr drivers/mtd/nand/omap2.c
> >>
> >> Any GPMC register tinkering needs to happen in arch/arm/mach-
> omap2/gpmc.c.
> >> If there are not currently GPMC functions to do something in gpmc.c,
> then
> >> let's add the necessary support there.
> >>
> >> 2. Passing hardcoded GPMC_CS0_BASE needs to go from the board files
> >>
> >> Passing hardcoded GPMC virtual addressess is sure way to mess up
> >> things. This should all become unnecessary once the NAND drivers
> >> stops messing with the GPMC registers directly.
> >>
> >> So, as a result, I'm not planning on pushing any omap NAND related
> >> patches until these basic issues are fixed. I'll mark these patches
> >> as "Changes requested" in patchwork.kernel.org even if these patches
> >> don't have anything else wrong with them.
> >>
> >> Let's fix the basic things for good, and put the other patches on
> >> hold for a while. Sorry if this causes problems!
> >
> > Hi,
> >
> > fair enough. I guess Vimal should address this, as he seems to be the T=
I
> > mr. NAND, right? :-)
>=20
> Hi All,
>=20
> Sorry again. I am no more with TI and I don't have any board with me
> too. So, I'm unable to fix these.  :(
> I hope someone else from TI can take care of it.
>=20
> --
> Regards,
> Vimal Singh
