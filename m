Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f16ba-0007pS-EV
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2018 08:38:52 +0000
Date: Wed, 28 Mar 2018 10:38:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 00/16] Fix probe functions error path
Message-ID: <20180328103828.28f61da5@bbrezillon>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
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

On Wed, 21 Mar 2018 14:01:41 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello all,
>=20
> In order to remove the limitation that prevents dynamic allocations
> during the identification phase (nand_scan_ident()), we need to get rid
> of the nand_scan_ident()/nand_scan_tail() calls from drivers and only
> export nand_scan().
>=20
> This series prepares the migration to nand_scan() by first fixing (and
> enhancing some times) the probe function error path of the drivers that
> do not use nand_scan() yet.
>=20
> The three main problems addressed in the series are:
> 1/ a wrong error path that does not free/disable the resources
>    correctly.
> 2/ nand_cleanup() is not called upon error after a successful
>    nand_scan_tail().
> 3/ nand_release() is called instead of nand_cleanup(). nand_release()
>    does call nand_cleanup() and also mtd_device_unregister(), which
>    should not be called while mtd_device_register() as succeeded.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  * Extracted only the patches fixing the error path from the first huge
>    series (50+ patches) that also converted the drivers to nand_scan().
>  * Changed wrong nand_release() calls to nand_cleanup().
>=20
>=20
> Miquel Raynal (16):
>   mtd: rawnand: brcmnand: fix probe function error path
>   mtd: rawnand: cafe: fix probe function error path
>   mtd: rawnand: davinci: fix probe function error path
>   mtd: rawnand: denali: fix probe function error path

Applied patches 1 to 4...

>   mtd: rawnand: docg4: fix the probe function error path
>   mtd: rawnand: fsl_elbc: fix probe function error path
>   mtd: rawnand: fsl_ifc: fix probe function error path
>   mtd: rawnand: fsmc: fix and enhance probe function error path
>   mtd: rawnand: mxc: fix probe function error path
>   mtd: rawnand: omap2: fix the probe function error path
>   mtd: rawnand: sh_flctl: fix the probe function error path
>   mtd: rawnand: tango: fix probe function error path

... patches 9 to 12...

>   mtd: rawnand: hisi504: fix and enhance the probe function error path
>   mtd: rawnand: lpc32xx_mlc: fix and enhance the probe function error
>     path
>   mtd: rawnand: lpc32xx_slc: fix and enhance the probe function error
>     path
>   mtd: rawnand: s3c2410: enhance the probe function error path

... and patch 16.

>=20
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c |  6 ++++-
>  drivers/mtd/nand/raw/cafe_nand.c         | 18 +++++++++------
>  drivers/mtd/nand/raw/davinci_nand.c      |  6 +++--
>  drivers/mtd/nand/raw/denali.c            |  4 +++-
>  drivers/mtd/nand/raw/docg4.c             | 22 +++++++++---------
>  drivers/mtd/nand/raw/fsl_elbc_nand.c     |  9 ++++++--
>  drivers/mtd/nand/raw/fsl_ifc_nand.c      |  8 ++++++-
>  drivers/mtd/nand/raw/fsmc_nand.c         | 27 +++++++++++++----------
>  drivers/mtd/nand/raw/hisi504_nand.c      | 35 ++++++++++----------------=
---
>  drivers/mtd/nand/raw/lpc32xx_mlc.c       | 38 +++++++++++++++++---------=
------
>  drivers/mtd/nand/raw/lpc32xx_slc.c       | 26 ++++++++++++----------
>  drivers/mtd/nand/raw/mxc_nand.c          | 11 +++++----
>  drivers/mtd/nand/raw/omap2.c             |  5 ++++-
>  drivers/mtd/nand/raw/s3c2410.c           | 24 ++++++++++----------
>  drivers/mtd/nand/raw/sh_flctl.c          |  4 ++++
>  drivers/mtd/nand/raw/tango_nand.c        |  4 +++-
>  16 files changed, 140 insertions(+), 107 deletions(-)
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
