Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxSjg-0000yq-RU
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 08:00:43 +0000
Date: Wed, 5 Sep 2018 10:00:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Adrian Bunk <bunk@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Adrian Bunk <bunk@debian.org>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: onenand: fix parameter list build warning
Message-ID: <20180905100002.1c47f52f@xps13>
In-Reply-To: <561f2078-92e8-290f-626c-ff936b7285c1@infradead.org>
References: <03e45afe-c4f8-e69b-9cba-6a8863296ad4@infradead.org>
 <20180904233449.32e41787@xps13>
 <561f2078-92e8-290f-626c-ff936b7285c1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Randy,

Randy Dunlap <rdunlap@infradead.org> wrote on Tue, 4 Sep 2018 14:49:00
-0700:

> On 09/04/2018 02:34 PM, Miquel Raynal wrote:
> > Hi Randy,
> >=20
> > Randy Dunlap <rdunlap@infradead.org> wrote on Mon, 3 Sep 2018 12:32:04
> > -0700:
> >  =20
> >> From: Randy Dunlap <rdunlap@infradead.org>
> >>
> >> Fix build warning in <linux/mtd/onenand.h> by adding a "stub" struct
> >> for mtd_oob_ops:
> >>
> >> include/linux/mtd/onenand.h: warning: 'struct mtd_oob_ops' declared in=
side parameter list [enabled by default]
> >> include/linux/mtd/onenand.h: warning: its scope is only this definitio=
n or declaration, which is probably not what you want [enabled by default]
> >>
> >> Fixes: 607d1cb10426 ("[MTD] [OneNAND] proper onenand_bbt_read_oob() pr=
ototype")
> >>
> >> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> >> Cc: linux-mtd@lists.infradead.org
> >> Cc: David Woodhouse <dwmw2@infradead.org>
> >> Cc: Brian Norris <computersforpeace@gmail.com>
> >> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> >> Cc: Marek Vasut <marek.vasut@gmail.com>
> >> Cc: Richard Weinberger <richard@nod.at>
> >> Cc: Adrian Bunk <bunk@kernel.org>
> >> Cc: Adrian Bunk <bunk@debian.org>
> >> ---
> >>  include/linux/mtd/onenand.h |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> --- lnx-419-rc2.orig/include/linux/mtd/onenand.h
> >> +++ lnx-419-rc2/include/linux/mtd/onenand.h
> >> @@ -221,6 +221,7 @@ struct onenand_manufacturers {
> >>          char *name;
> >>  };
> >> =20
> >> +struct mtd_oob_ops;
> >>  int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
> >>  			 struct mtd_oob_ops *ops);
> >>  unsigned onenand_block(struct onenand_chip *this, loff_t addr); =20
> >=20
> > That's indeed a working solution, but there are a lot of other
> > structures in this file that come (like mtd_oob_ops) from
> > linux/mtd/mtd.h so I wonder if it would not make more sense to include
> > this header here?
> >=20
> > Thanks,
> > Miqu=C3=A8l =20
>=20
>=20
> Hi,
> Have you see this from Linus?
>=20
> https://lore.kernel.org/lkml/CA+55aFzMBptQt-QHMR0MM9MA3=3D1rxcf8ca5qHxrf4=
Mm0ZobE_A@mail.gmail.com/

I did not know this position, thanks for sharing.

However, I don't think we fall under the same situation here.

On a purely theoretical point of view, onenand is a type of MTD device,
and almost all the core structures it uses are from linux/mtd/mtd.h so
for me it seems an error not to include it.

After looking more closely at the code, the following files include
onenand.h:

$ ~/linux [master]$ git grep -l onenand.h
arch/arm/mach-mmp/ttc_dkb.c
arch/arm/mach-pxa/saar.c
arch/arm/mach-pxa/vpac270.c
arch/arm/plat-samsung/devs.c
arch/sh/boards/mach-kfr2r09/setup.c
drivers/mtd/nand/onenand/generic.c
drivers/mtd/nand/onenand/omap2.c
drivers/mtd/nand/onenand/onenand_base.c
drivers/mtd/nand/onenand/onenand_bbt.c
drivers/mtd/nand/onenand/samsung.c
include/linux/mtd/onenand.h

And the following files also already include mtd.h (before including onenan=
d.h):

$ ~/linux [master]$ git grep -l onenand.h|xargs grep mtd.h
arch/arm/mach-mmp/ttc_dkb.c:#include <linux/mtd/mtd.h>
arch/arm/mach-pxa/saar.c:#include <linux/mtd/mtd.h>
arch/arm/mach-pxa/vpac270.c:#include <linux/mtd/mtd.h>
arch/arm/plat-samsung/devs.c:#include <linux/mtd/mtd.h>
drivers/mtd/nand/onenand/generic.c:#include <linux/mtd/mtd.h>
drivers/mtd/nand/onenand/omap2.c:#include <linux/mtd/mtd.h>
drivers/mtd/nand/onenand/onenand_base.c:#include <linux/mtd/mtd.h>
drivers/mtd/nand/onenand/onenand_bbt.c:#include <linux/mtd/mtd.h>
drivers/mtd/nand/onenand/samsung.c:#include <linux/mtd/mtd.h>

The only file not already including directly mtd.h is:
arch/sh/boards/mach-kfr2r09/setup.c

So I suppose your issue comes from this file?

However, mtd.h is included by physmap.h, itself included by
mach-kfr2r09/setup.c after onenand.h; so all this files would be
recompiled anyway when touching mtd.h.

=46rom what I have seen, mach-kfr2r09/setup.c has no reason to include
onenand.h, so I would rather prefer to remove the inclusion.

Thanks,
Miqu=C3=A8l
