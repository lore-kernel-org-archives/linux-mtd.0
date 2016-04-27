Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avKJV-000316-8N
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 07:55:13 +0000
Date: Wed, 27 Apr 2016 09:54:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH V2] mtd: nand: fix NULL pointer dereference in
 of_get_nand_ecc_algo
Message-ID: <20160427095450.5f45b3af@bbrezillon>
In-Reply-To: <1461705408-12858-1-git-send-email-zajec5@gmail.com>
References: <1461695776-29740-1-git-send-email-zajec5@gmail.com>
 <1461705408-12858-1-git-send-email-zajec5@gmail.com>
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

On Tue, 26 Apr 2016 23:16:47 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Our array nand_ecc_algos doesn't specify mappings for all available
> enum nand_ecc_algo values. The one missing there is NAND_ECC_UNKNOWN
> as this value is reserved for algorithm not being specified at all.
> It means we have to be careful when iterating this array and avoid
> NULL values.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Changes squashed into "mtd: nand: add support for "nand-ecc-algo" DT
property".

Thanks,

Boris

> ---
> V2: Iterate from NAND_ECC_HAMMING instead of checking for NULL as preferr=
ed by
> Boris.
> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a5417a0..2e6ba44 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4015,7 +4015,7 @@ static int of_get_nand_ecc_algo(struct device_node =
*np)
> =20
>  	err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
>  	if (!err) {
> -		for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
> +		for (i =3D NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
>  			if (!strcasecmp(pm, nand_ecc_algos[i]))
>  				return i;
>  		return -ENODEV;



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
