From: "G, Manjunath Kondaiah" <manjugk@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Thu, 30 Sep 2010 05:16:56 +0530
Subject: RE: [GIT PULL] omap2 sparse fixes
Message-ID: <E0D41E29EB0DAC4E9F3FF173962E9E9402DB7FE911@dbde02.ent.ti.com>
References: <E0D41E29EB0DAC4E9F3FF173962E9E9402785A390E@dbde02.ent.ti.com>
	<20100923225851.GR4211@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F859E@dbde02.ent.ti.com>
	<20100925001914.GO4211@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F917C@dbde02.ent.ti.com>
	<20100928152139.GB3117@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB3F94C9@dbde02.ent.ti.com>
	<20100928183157.GH3117@atomide.com>
	<E0D41E29EB0DAC4E9F3FF173962E9E9402DB7FE8F9@dbde02.ent.ti.com>
	<20100929215635.GC3117@atomide.com>
In-Reply-To: <20100929215635.GC3117@atomide.com>
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

=20

> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]=20
> Sent: Thursday, September 30, 2010 3:27 AM
> To: G, Manjunath Kondaiah
> Cc: linux-omap@vger.kernel.org;=20
> linux-arm-kernel@lists.infradead.org; Samuel Ortiz; Dmitry=20
> Torokhov; linux-mtd@lists.infradead.org; Russell King - ARM Linux
> Subject: Re: [GIT PULL] omap2 sparse fixes
>=20
> * G, Manjunath Kondaiah <manjugk@ti.com> [100929 12:42]:
> >=20
> > Tony,
> >=20
> > > -----Original Message-----
> > > From: Tony Lindgren [mailto:tony@atomide.com]
> > > Sent: Wednesday, September 29, 2010 12:02 AM
> > > To: G, Manjunath Kondaiah
> > > Cc: linux-omap@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; Samuel Ortiz;=20
> Dmitry Torokhov;=20
> > > linux-mtd@lists.infradead.org; Russell King - ARM Linux
> > > Subject: Re: [GIT PULL] omap2 sparse fixes
> > >=20
> > > * G, Manjunath Kondaiah <manjugk@ti.com> [100928 08:26]:
> > ...
> >=20
> > > Yes please take out all patches that are not in=20
> arch/arm/*omap*/ path.
> > > The others really should go to the driver maintainers.
> > >=20
> > > Tony
> >=20
> > Here is new branch which has only arch/arm/*omap*/ related patches.
>=20
> Thanks. Noticed one more thing though:
>=20
> In your patch "OMAP: mach-omap2: Fix static function=20
> warnings" looks like you're adding=20
> omap2_gp_clockevent_set_gptimer twice:

Sorry I missed removing this while adding it in timer-gp.h. Also, I noticed
in the same patch, the board_nand_init nd board_flash_init functions are
exported thrgough board-flash.h.=20

I moved board-flash.h from mach/board-flash.h to mach-omap2/board-flash.h s=
o
that only board files can access these functions.


>=20
> --- a/arch/arm/plat-omap/include/plat/timer-gp.h
> +++ b/arch/arm/mach-omap2/timer-gp.h
> @@ -11,7 +11,6 @@
>  #ifndef __ARCH_ARM_PLAT_OMAP_INCLUDE_MACH_TIMER_GP_H
>  #define __ARCH_ARM_PLAT_OMAP_INCLUDE_MACH_TIMER_GP_H
> =20
> -int __init omap2_gp_clockevent_set_gptimer(u8 id);
> +extern int __init omap2_gp_clockevent_set_gptimer(u8 id);
> =20
>  #endif
> -
> --- a/arch/arm/plat-omap/include/plat/dmtimer.h
> +++ b/arch/arm/plat-omap/include/plat/dmtimer.h
> @@ -81,6 +81,6 @@ unsigned int=20
> omap_dm_timer_read_counter(struct omap_dm_timer *timer); =20
> void omap_dm_timer_write_counter(struct omap_dm_timer *timer,=20
> unsigned int value);
> =20
>  int omap_dm_timers_active(void);
> -
> +int omap2_gp_clockevent_set_gptimer(u8 id);

Removed.

> =20
>  #endif /* __ASM_ARCH_DMTIMER_H */
>=20
> Please also be careful that your branch contains the same=20
> patches as you've posted for review. Nobody wants to pull=20
> different stuff than what was posted! Also looks like Paul=20
> had one comment related to the same patch.

Patches are same except pulling out twl and driver patches from
the series.

Paul's comment is addressed and changes are pushed to git branch.
Build tested with omap3_defconfig and boot tested with beagle board.

The following changes since commit 899611ee7d373e5eeda08e9a8632684e1ebbbf00=
:
  Linus Torvalds (1):
        Linux 2.6.36-rc6

are available in the git repository at:

  git://dev.omapzoom.org/pub/scm/manju/kernel-omap3-dev.git omap_sparse_fix=
esv2

G, Manjunath Kondaiah (7):
      OMAP: mach-omap2: Fix incorrect assignment warnings
      OMAP: mach-omap2: Fix static declaration warnings
      OMAP2plus: Fix static function warnings
      OMAP: mach-omap2: Fix miscellaneous sparse warnings
      OMAP: plat-omap: Fix static function warnings
      OMAP: Convert write/read functions to raw read/write
      OMAP3: Keypad: Fix incorrect type initializer

-Manjunath
