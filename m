Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVjWM-0002FZ-VJ
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 02:49:41 -0400
Subject: Re: [PATCH 1/2] NAND: nandsim sector-wise allocation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
In-Reply-To: <17701.15123.205461.480037@vaishnavi.localdomain>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
	<17701.15123.205461.480037@vaishnavi.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 06 Oct 2006 09:49:17 +0300
Message-Id: <1160117357.13696.37.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-10-05 at 22:34 +0530, Vijay Kumar wrote:
> The existing config options related to chip mapping and chip-wise
> allocation are moved to kernel configuration system.

BTW, it is a nice idea to add Signed-off-by, just a note for future
patches :-)

>=20
> Index: linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/Kconfig	2006-10-01 18:56:35=
.000000000 +0530
> +++ linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig	2006-10-01 20:35:47.0000=
00000 +0530
> @@ -239,4 +239,28 @@
>  	  The simulator may simulate various NAND flash chips for the
>  	  MTD nand layer.
> =20
> +choice=20
> +	depends on MTD_NAND_NANDSIM
> +	prompt "Mapping/allocation method"
> +	default MTD_NAND_NANDSIM_CHIP_ALLOC
> +
> +config  MTD_NAND_NANDSIM_CHIP_MAP
> +	bool "Mapped flash image"
> +	help
> +	  The flash data is stored in an image mapped to memory.
Is this option really needed? I've never heard somebody using it. Do you
use it? If no, will you mind to get rid of it at all? And then of course
MTD_NAND_NANDSIM_CHIP_ALLOC won't be needed as well.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
