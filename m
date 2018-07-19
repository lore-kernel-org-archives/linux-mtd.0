Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGC8-0001Xs-SQ
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:10:42 +0000
Date: Thu, 19 Jul 2018 23:10:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Changes in the internal raw NAND API
Message-ID: <20180719231016.39e3da4c@xps13>
In-Reply-To: <20180718231234.8534-1-miquel.raynal@bootlin.com>
References: <20180718231234.8534-1-miquel.raynal@bootlin.com>
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



> After having sent two versions of a series removing the
> nand_scan_ident/nand_scan_tail limitation that prevents us to allocate
> memory at critical moments, we are still discussing the internal API.
>=20
> To avoid sending again more than 20 patches, this is an RFC of the
> internal changes prior to the above modifications in each driver:
>=20
> 1/ Rename struct nand_hw_control -> struct nand_controller which is
>    much more meaningful.
> 2/ Rename the function initializing the above structure
>    nand_hw_control_init() -> nand_controller_init().
> 3/ Rename the dummy controller implementation in the nand_chip structure
>    hwcontrol -> dummy_controller.
> 3/ Create a nand_controller_ops structure which will be embedded in the
>    nand_controller structure. These operations are:
>    int (*attach_chip)(struct nand_chip *) and
>    void (*detach_chip)(struct nand_chip *).
>=20
> If we agree on this, I could merge them first and then send the bunch of
> patches making use of these API changes.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
> Changes since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Reworded the nand_controller structure documentation as suggested.
> * Used Boris' explanation of the introduction of the
>   ->attach/detach_chip() hooks. =20
> * Removed the initialization of controller->ops() in
>   nand_controller_init().
> * s/may be called/will be called/ in ->attach/detach_chip()
>   documentation line.
> * Also mentioned that ->detach_chip() will be called from
>   nand_cleanup().
>=20
> Changes since v1 (RFC):
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Added Acked-by tags from Boris.
> * Updated the commit logs as commented.
> * Squashed the 2 patches about nand_hw_control and
>   nand_init_hw_control().
> * Also added the rename of hwcontrol in patch 1.
> * Added helpers to 1/ check the controller operations are present and
>   2/ ->attach_chip() or ->detach_chip() is available, as suggested by
>   Boris.
>=20
>=20
> Miquel Raynal (2):
>   mtd: rawnand: better name for the controller structure
>   mtd: rawnand: add hooks that may be called during nand_scan()
>=20
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 10 ++++----
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  4 ++--
>  drivers/mtd/nand/raw/docg4.c                 |  4 ++--
>  drivers/mtd/nand/raw/fsl_elbc_nand.c         |  4 ++--
>  drivers/mtd/nand/raw/fsl_ifc_nand.c          |  4 ++--
>  drivers/mtd/nand/raw/jz4780_nand.c           |  7 +++---
>  drivers/mtd/nand/raw/marvell_nand.c          |  6 ++---
>  drivers/mtd/nand/raw/mtk_nand.c              |  2 +-
>  drivers/mtd/nand/raw/nand_base.c             | 36 ++++++++++++++++++++++=
++----
>  drivers/mtd/nand/raw/ndfc.c                  |  4 ++--
>  drivers/mtd/nand/raw/omap2.c                 |  2 +-
>  drivers/mtd/nand/raw/oxnas_nand.c            |  4 ++--
>  drivers/mtd/nand/raw/qcom_nandc.c            |  4 ++--
>  drivers/mtd/nand/raw/s3c2410.c               |  4 ++--
>  drivers/mtd/nand/raw/sunxi_nand.c            |  6 ++---
>  drivers/mtd/nand/raw/tango_nand.c            |  4 ++--
>  drivers/mtd/nand/raw/tegra_nand.c            |  6 ++---
>  drivers/mtd/nand/raw/txx9ndfmc.c             |  4 ++--
>  include/linux/mtd/rawnand.h                  | 29 +++++++++++++++++-----
>  19 files changed, 95 insertions(+), 49 deletions(-)
>=20

Series applied to nand/next.
