Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atX7v-0007Vl-Fb
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:11:52 +0000
Date: Fri, 22 Apr 2016 11:11:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3 00/11] mtd: nand: get rid of NAND_ECC_SOFT_BCH
Message-ID: <20160422111129.4d7bae1e@bbrezillon>
In-Reply-To: <1460926387-9563-1-git-send-email-zajec5@gmail.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
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

On Sun, 17 Apr 2016 22:52:56 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This patchset completes usage of the new "algo" field and drops unwanted
> NAND_ECC_SOFT_BCH.

Rebased on top of nand/next and applied all except "mtd: nand: hisi504:
set ECC algorithm based on DT info" which is not needed anymore.

Thanks,

Boris

>=20
> It's based on nand/next git repository.
>=20
> V2: Drop avr32 patch and modify atmel patch
>     Out-of-commit comment in hisi504 patch
>     Fixes in nand_base.c to handle mode && algo correctly
> V3: Fix condition in 9/11
>=20
> Rafa=C5=82 Mi=C5=82ecki (11):
>   mtd: nand: bf5xx: set ECC algorithm explicitly
>   mtd: nand: davinci: set ECC algorithm explicitly
>   mtd: nand: atmel: set ECC algorithm explicitly
>   CRIS v32: nand: set ECC algorithm explicitly
>   staging: mt29f_spinand: set ECC algorithm explicitly
>   mtd: nand: set ECC algorithm to Hamming on fallback
>   mtd: nand: hisi504: set ECC algorithm based on DT info
>   mtd: nand: fsmc: validate ECC setup by checking algorithm directly
>   mtd: nand: read ECC algorithm from the new field
>   of: mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch" mapping
>   mtd: mtd: drop NAND_ECC_SOFT_BCH enum value
>=20
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c |   1 +
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c |   1 +
>  drivers/mtd/nand/atmel_nand.c                  |  13 +++
>  drivers/mtd/nand/bf5xx_nand.c                  |   1 +
>  drivers/mtd/nand/davinci_nand.c                |   8 ++
>  drivers/mtd/nand/fsmc_nand.c                   |  10 ++-
>  drivers/mtd/nand/hisi504_nand.c                |   1 +
>  drivers/mtd/nand/jz4780_nand.c                 |   1 -
>  drivers/mtd/nand/nand_base.c                   | 117 +++++++++++++++----=
------
>  drivers/mtd/nand/nandsim.c                     |   2 +-
>  drivers/mtd/nand/sunxi_nand.c                  |   2 -
>  drivers/of/of_mtd.c                            |   9 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c  |   1 +
>  include/linux/mtd/nand.h                       |   1 -
>  14 files changed, 110 insertions(+), 58 deletions(-)
>=20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
