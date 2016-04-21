Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atL3a-0007rR-Vr
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 20:18:35 +0000
Date: Thu, 21 Apr 2016 22:18:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Mikael Starvik <starvik@axis.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Brian Norris
 <computersforpeace@gmail.com>, linux-cris-kernel@axis.com (open list:CRIS
 PORT), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH V3 04/11] CRIS v32: nand: set ECC algorithm explicitly
Message-ID: <20160421221811.3e8dcdff@bbrezillon>
In-Reply-To: <1460926387-9563-5-git-send-email-zajec5@gmail.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-5-git-send-email-zajec5@gmail.com>
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

On Sun, 17 Apr 2016 22:53:00 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Mikael, Jesper, could you review/ack this patch? I'd like to take it
into the nand tree to avoid any dependency problems.

Thanks,

Boris

> ---
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 1 +
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/a=
rch-v32/drivers/mach-a3/nandflash.c
> index 5aa3f51..3f646c7 100644
> --- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> @@ -157,6 +157,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	/* 20 us command delay time */
>  	this->chip_delay =3D 20;
>  	this->ecc.mode =3D NAND_ECC_SOFT;
> +	this->ecc.algo =3D NAND_ECC_HAMMING;
> =20
>  	/* Enable the following for a flash based bad block table */
>  	/* this->bbt_options =3D NAND_BBT_USE_FLASH; */
> diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/a=
rch-v32/drivers/mach-fs/nandflash.c
> index a7c17b0..a745405 100644
> --- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> @@ -148,6 +148,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	/* 20 us command delay time */
>  	this->chip_delay =3D 20;
>  	this->ecc.mode =3D NAND_ECC_SOFT;
> +	this->ecc.algo =3D NAND_ECC_HAMMING;
> =20
>  	/* Enable the following for a flash based bad block table */
>  	/* this->bbt_options =3D NAND_BBT_USE_FLASH; */



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
