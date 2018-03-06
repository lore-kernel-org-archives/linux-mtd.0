Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1et7vl-0008Q2-Cs
 for linux-mtd@lists.infradead.org; Tue, 06 Mar 2018 08:26:43 +0000
Date: Tue, 6 Mar 2018 09:26:18 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?5qyn6Ziz5b+X5b+g?= <oyzhizhong@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, boris.brezillon@free-electrons.com, Marek
 =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>, richard@nod.at,
 vdavydov.dev@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtdchar: fix usage of mtd_ooblayout_ecc()
Message-ID: <20180306092618.1ac355d2@bbrezillon>
In-Reply-To: <CAPrnC+CMH-o_LCWqnEFH4v7K1VVVU3hstKorHb+-XZvp3xy6AA@mail.gmail.com>
References: <CAPrnC+CMH-o_LCWqnEFH4v7K1VVVU3hstKorHb+-XZvp3xy6AA@mail.gmail.com>
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

On Tue, 6 Mar 2018 11:13:25 +0800
=E6=AC=A7=E9=98=B3=E5=BF=97=E5=BF=A0 <oyzhizhong@gmail.com> wrote:

> Section was not properly computed. The value of OOB region definition is
> always ECC section 0 information in the OOB area, but we want to get all
> the ECC bytes information, so we should call
> mtd_ooblayout_ecc(mtd, section++, &oobregion) until it returns -ERANGE.
>=20

You still miss the Fixes and Cc-stable tags:

Fixes: c2b78452a9db ("mtd: use mtd_ooblayout_xxx() helpers where appropriat=
e")
Cc: <stable@vger.kernel.org>

Looks good otherwise.

I'm just curious, how did you find the problem? Do you have a userspace
tool that queries the OOB/ECC layout?

> Signed-off-by: OuYang ZhiZhong <oyzhizhong@gmail.com>
> ---
>  drivers/mtd/mtdchar.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index de8c902..7d80a8b 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -479,7 +479,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
>   for (i =3D 0; i < MTD_MAX_ECCPOS_ENTRIES;) {
>   u32 eccpos;
>=20
> - ret =3D mtd_ooblayout_ecc(mtd, section, &oobregion);
> + ret =3D mtd_ooblayout_ecc(mtd, section++, &oobregion);
>   if (ret < 0) {
>   if (ret !=3D -ERANGE)
>   return ret;
> @@ -526,7 +526,7 @@ static int get_oobinfo(struct mtd_info *mtd, struct
> nand_oobinfo *to)
>   for (i =3D 0; i < ARRAY_SIZE(to->eccpos);) {
>   u32 eccpos;
>=20
> - ret =3D mtd_ooblayout_ecc(mtd, section, &oobregion);
> + ret =3D mtd_ooblayout_ecc(mtd, section++, &oobregion);
>   if (ret < 0) {
>   if (ret !=3D -ERANGE)
>   return ret;



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
