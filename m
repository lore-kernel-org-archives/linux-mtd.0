Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQgfV-00073Z-3H
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 21:40:23 +0000
Date: Sun, 17 Dec 2017 22:39:55 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v3 0/4] mtd: Preparation patches for the SPI NAND framework
Message-ID: <20171217223955.24b94353@xps13>
In-Reply-To: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
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

Hello Boris,

On Fri, 15 Dec 2017 13:39:50 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
>=20
> Here is a set of patches to prepare the introduction of the generic
> NAND and SPI frameworks.
>=20
> The last 2 patches have already been submitted here [1], and the first
> two are new, and should also help simplify other drivers/frameworks
> in providing generic code for already existing logic.
>=20
> If you want to see the overall picture of the SPI NAND framework you
> can have a look at this branch [2].
>=20
> Regards,
>=20
> Boris
>=20
> [1]https://patchwork.ozlabs.org/patch/780477/
> [2]https://github.com/bbrezillon/linux-0day/commits/nand/spi-nand-squashed
>=20
> Boris Brezillon (4):
>   mtd: Do not allow MTD devices with inconsistent erase properties
>   mtd: Add an helper to make erase request aligned on ->erasesize
>   mtd: Stop directly calling master ->_xxx() hooks from mtdpart code
>   mtd: Fallback to ->_read/write_oob() when ->_read/write() is missing

I did not spot anything strange on the four patches :) so for the
series:

Reviewed-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Thank you,
Miqu=C3=A8l

>=20
>  drivers/mtd/devices/docg3.c        |  65 -----------------
>  drivers/mtd/mtdcore.c              |  36 +++++++++-
>  drivers/mtd/mtdpart.c              | 141
> ++++++++++++++-----------------------
> drivers/mtd/nand/nand_base.c       |  56 ---------------
> drivers/mtd/onenand/onenand_base.c |  63 -----------------
> include/linux/mtd/mtd.h            |  28 ++++++++ 6 files changed,
> 115 insertions(+), 274 deletions(-)
>=20



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
