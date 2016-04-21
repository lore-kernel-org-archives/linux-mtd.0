Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atLTD-0005RT-Tg
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 20:45:04 +0000
From: Mikael Starvik <mikael.starvik@axis.com>
To: =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Jesper  Nilsson" <jespern@axis.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-cris-kernel <linux-cris-kernel@axis.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 04/11] CRIS v32: nand: set ECC algorithm explicitly
Date: Thu, 21 Apr 2016 20:44:39 +0000
Message-ID: <6529E3BC-D594-4B3A-8735-1A79A71886CB@axis.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>,
 <1460926387-9563-5-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460926387-9563-5-git-send-email-zajec5@gmail.com>
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Mikael Starvik <starvik@axis.com>

> 17 apr. 2016 kl. 22:53 skrev Rafa=B3 Mi=B3ecki <zajec5@gmail.com>:
>=20
> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
>=20
> Signed-off-by: Rafa=B3 Mi=B3ecki <zajec5@gmail.com>
> ---
> arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 1 +
> arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 1 +
> 2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/a=
rch-v32/drivers/mach-a3/nandflash.c
> index 5aa3f51..3f646c7 100644
> --- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> @@ -157,6 +157,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void=
)
>   /* 20 us command delay time */
>   this->chip_delay =3D 20;
>   this->ecc.mode =3D NAND_ECC_SOFT;
> +    this->ecc.algo =3D NAND_ECC_HAMMING;
>=20
>   /* Enable the following for a flash based bad block table */
>   /* this->bbt_options =3D NAND_BBT_USE_FLASH; */
> diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/a=
rch-v32/drivers/mach-fs/nandflash.c
> index a7c17b0..a745405 100644
> --- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> @@ -148,6 +148,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void=
)
>   /* 20 us command delay time */
>   this->chip_delay =3D 20;
>   this->ecc.mode =3D NAND_ECC_SOFT;
> +    this->ecc.algo =3D NAND_ECC_HAMMING;
>=20
>   /* Enable the following for a flash based bad block table */
>   /* this->bbt_options =3D NAND_BBT_USE_FLASH; */
> --=20
> 1.8.4.5
>=20
