From: "G, Manjunath Kondaiah" <manjugk@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Tue, 28 Sep 2010 21:05:02 +0530
Subject: RE: [GIT PULL] omap2 sparse fixes
Message-ID: <E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F94C9@dbde02.ent.ti.com>
References: <E0D41E29EB0DAC4E9F3FF173962E9E9402785A390E@dbde02.ent.ti.com>
	<20100923225851.GR4211@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F859E@dbde02.ent.ti.com>
	<20100925001914.GO4211@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F917C@dbde02.ent.ti.com>
	<20100928152139.GB3117@atomide.com>
In-Reply-To: <20100928152139.GB3117@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Samuel Ortiz <sameo@linux.intel.com>, Dmitry Torokhov <dtor@mail.ru>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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



> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]=20
> Sent: Tuesday, September 28, 2010 8:52 PM
> To: G, Manjunath Kondaiah
> Cc: linux-omap@vger.kernel.org;=20
> linux-arm-kernel@lists.infradead.org; Samuel Ortiz; Dmitry=20
> Torokhov; linux-mtd@lists.infradead.org; Russell King - ARM Linux
> Subject: Re: [GIT PULL] omap2 sparse fixes
>=20
> * G, Manjunath Kondaiah <manjugk@ti.com> [100928 01:04]:
> >=20
> > Three patches are fixed using above method which are:
> > OMAP: mach-omap2: Fix static function warnings
> > OMAP: plat-omap: Fix static function warnings TWL IRQ: Fix fucntion=20
> > declaration warnings
>=20
> OK thanks.
> =20
> > are available in the git repository at:
> >=20
> >   git://dev.omapzoom.org/pub/scm/manju/kernel-omap3-dev.git=20
> > sparse_fixes_v3
> >=20
> > G, Manjunath Kondaiah (10):
> >       OMAP: mach-omap2: Fix incorrect assignment warnings
> >       OMAP: mach-omap2: Fix static declaration warnings
> >       OMAP2plus: Fix static function warnings
> >       OMAP: mach-omap2: Fix miscellaneous sparse warnings
> >       OMAP: plat-omap: Fix static function warnings
> >       OMAP: NAND: Fix static declaration warning
> >       TWL CORE: Fix sparse warning
> >       TWL IRQ: Fix fucntion declaration warnings
>=20
> Didn't Samuel just reply that he has applied these two TWL fixes?

Samuel applied only one patch and other patch is yet to be applied.
Do you want me to pull out these two twl patches from the series?

-Manjunath
