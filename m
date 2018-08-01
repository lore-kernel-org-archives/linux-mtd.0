Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkmbp-0006rO-UA
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 08:35:55 +0000
Date: Wed, 1 Aug 2018 10:35:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/4] mtd: rawnand: Improve compile-test coverage
Message-ID: <20180801103541.73645a6d@xps13>
In-Reply-To: <20180718234010.18e1036b@xps13>
References: <20180718085652.30391-1-boris.brezillon@bootlin.com>
 <20180718234010.18e1036b@xps13>
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

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 18 Jul 2018
23:40:10 +0200:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 2018
> 10:56:48 +0200:
>=20
> > Hello,
> >=20
> > This is an attempt at adding "depends || COMPILE_TEST" to all NAND
> > drivers that have no compile-time dependencies on arch
> > features/headers.
> >=20
> > This will hopefully help us (NAND/MTD maintainers) in detecting build
> > issues earlier. Unfortunately we still have a few drivers that can't
> > easily be modified to be arch independent.
> >=20
> > Regards,
> >=20
> > Boris
> >=20
> > Changes in v2:
> > - Fix a few problems reported by kbuild robots and Stephen Rothwell
> >=20
> > Changes in v3:
> > - Drop depends on !IA64 since Arnd has added {read,write}s{b,w,l}()
> >   accessors to this arch
> > - Make sure the orion driver compiles when __LINUX_ARM_ARCH__ is not
> >   defined
> >=20
> > Boris Brezillon (4):
> >   mtd: rawnand: s3c2410: Allow selection of this driver when
> >     COMPILE_TEST=3Dy
> >   mtd: rawnand: orion: Avoid direct inclusion of asm headers
> >   mtd: rawnand: orion: Handle cases where __LINUX_ARM_ARCH__ is not
> >     defined
> >   mtd: rawnand: orion: Allow selection of this driver when
> >     COMPILE_TEST=3Dy
> >=20
> >  drivers/mtd/nand/raw/Kconfig      | 6 ++++--
> >  drivers/mtd/nand/raw/orion_nand.c | 6 +++---
> >  2 files changed, 7 insertions(+), 5 deletions(-)
> >  =20
>=20
> Series applied to nand/next, thanks for this work that will speed up
> our local tests.

As we received build robots complaints about both orion and s3c
drivers, I removed both patches to avoid build issues:

mtd: rawnand: s3c2410: Allow selection of this driver when COMPILE_TEST=3Dy
mtd: rawnand: orion: Allow selection of this driver when COMPILE_TEST=3Dy

Let's fix the issues and include them in the next release.

Thanks,
Miqu=C3=A8l
