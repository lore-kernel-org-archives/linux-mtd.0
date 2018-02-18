Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enJsq-0007TC-LT
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 07:59:42 +0000
Date: Sun, 18 Feb 2018 08:59:18 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Convert FSMC NAND controller driver to ->exec_op()
Message-ID: <20180218085918.74a579b8@bbrezillon>
In-Reply-To: <20180216142248.32345-1-miquel.raynal@bootlin.com>
References: <20180216142248.32345-1-miquel.raynal@bootlin.com>
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

On Fri, 16 Feb 2018 15:22:46 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>=20
> Now that the ->exec_op() interface has been merged in the NAND core,
> convert the FSMC NAND controller driver to it.
>=20
> A previous step involves getting rid of ->IO_ADDR_[R|W] across the
> driver, which is almost entirely done in the first patch. Because the
> driver still uses at that point the default implementations of
> ->read/write_byte/word(), some references are still present but are =20
> removed as soon as the driver is moved to ->exec_op(), when this
> dependency disappears.
>=20
> Best regards,
> Miqu=C3=A8l
>=20
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Forgot about the NAND unique ID for now, this will need a deeper
>   rework of the MTD stack and is very (ONFI-)NAND-specific.
> - Split the migration of FSMC driver to ->exec_op() into two patches,
>   one to get rid of ->IO_ADDR_[R|W], the other to implement ->exec_op()
>   and ->select_chip() which is also needed.
> - Got rid of the additional ->regs entry in the FSMC structure, using
>   the existing entry ->regs_va instead.
>=20
>=20
> Miquel Raynal (2):
>   mtd: nand: fsmc: get rid of IO_ADDR_[R|W]
>   mtd: nand: fsmc: use ->exec_op()

Applied.

Thanks,

Boris

>=20
>  drivers/mtd/nand/fsmc_nand.c | 242 ++++++++++++++++++++++++-------------=
------
>  1 file changed, 137 insertions(+), 105 deletions(-)
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
