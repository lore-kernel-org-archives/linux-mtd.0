Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBmvp-0003zf-Rn
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 19:51:55 +0000
Date: Thu, 26 Apr 2018 21:51:38 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v3 00/11] Fix NAND controllers probe functions error path
Message-ID: <20180426215138.05b4df99@bbrezillon>
In-Reply-To: <20180421180043.18366-1-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
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

On Sat, 21 Apr 2018 20:00:32 +0200
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
> 0/ unproper error path (fuzzy, styling issues, undescriptive goto's).
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

Applied.

Thanks,

Boris

>=20
> Changes since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  * Reworked the few remaining patches that needed small changes.
>  * docg4: changed the commit message as proposed.
>  * fsl_elbc/fsl_ifc: moved the wrong nand_release() out of the
>    'remove' function to avoid double free possible issues.
>  * fsmc/hisi504/lpc32xx_mlc/lpc32xx_slc: split the changes in two
>    commits, one to fix the goto labels/style, one that actually fixes
>    the function.
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  * Extracted only the patches fixing the error path from the first huge
>    series (50+ patches) that also converted the drivers to nand_scan().
>  * Changed wrong nand_release() calls to nand_cleanup().
>=20
>=20
> Miquel Raynal (11):
>   mtd: rawnand: docg4: fix the probe function error path
>   mtd: rawnand: fsl_elbc: fix probe function error path
>   mtd: rawnand: fsl_ifc: fix probe function error path
>   mtd: rawnand: fsmc: clean the probe function style
>   mtd: rawnand: fsmc: fix the probe function error path
>   mtd: rawnand: hisi504: clean the probe function error path
>   mtd: rawnand: hisi504: fix the probe function error path
>   mtd: rawnand: lpc32xx_mlc: clean the probe function
>   mtd: rawnand: lpc32xx_mlc: fix the probe function error path
>   mtd: rawnand: lpc32xx_slc: clean the probe function
>   mtd: rawnand: lpc32xx_slc: fix the probe function error path
>=20
>  drivers/mtd/nand/raw/docg4.c         | 22 +++++++++++----------
>  drivers/mtd/nand/raw/fsl_elbc_nand.c | 13 ++++++++----
>  drivers/mtd/nand/raw/fsl_ifc_nand.c  | 12 +++++++++---
>  drivers/mtd/nand/raw/fsmc_nand.c     | 27 +++++++++++++------------
>  drivers/mtd/nand/raw/hisi504_nand.c  | 35 ++++++++++++------------------=
---
>  drivers/mtd/nand/raw/lpc32xx_mlc.c   | 38 +++++++++++++++++++-----------=
------
>  drivers/mtd/nand/raw/lpc32xx_slc.c   | 26 ++++++++++++------------
>  7 files changed, 91 insertions(+), 82 deletions(-)
>=20
