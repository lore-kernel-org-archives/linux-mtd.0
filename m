Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVkWU-0003bZ-RI
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 20:15:44 +0000
Date: Thu, 13 Jul 2017 22:15:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: han.xu@nxp.com, richard@nod.at, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: gpmi-nand: do not fail setting ONFI timing mode if
 available
Message-ID: <20170713221520.268bc554@bbrezillon>
In-Reply-To: <20170713192030.22177-1-miquel.raynal@free-electrons.com>
References: <20170713192030.22177-1-miquel.raynal@free-electrons.com>
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

Hi Miquel,

Le Thu, 13 Jul 2017 21:20:30 +0200,
Miquel Raynal <miquel.raynal@free-electrons.com> a =C3=A9crit :

> GPMI NFC driver fails to apply timing mode if the ->onfi_get_features()
> does not return the mode that was previously applied.
>=20
> We can assume that a nand chip supports a timing as long as it is
> read from the ONFI parameter page. Reading back a different mode than
> the one previously applied does not mean the mode is unsupported but
> that the nand chip does not implement the ONFI feature because it
> probably does not need to.
>=20
> The output of ->onfi_get_feature() is irrelevant so delete it.

Having the NAND part that is not supporting the get/set(timing_mode)
feature explicitly mentioned in the commit message would help reviewers
understand why this patch is needed.

Also mention that, even though the SET/GET_FEATURES(timing_mode) is
marked as required in the ONFI spec, this Macronix chip does not
support it which could be considered as a bug.

Regards,

Boris

>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 141bd70a49c2..4d137145439c 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -939,13 +939,6 @@ static int enable_edo_mode(struct gpmi_nand_data *th=
is, int mode)
>  	if (ret)
>  		goto err_out;
> =20
> -	/* [2] send GET FEATURE command to double-check the timing mode */
> -	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
> -	ret =3D nand->onfi_get_features(mtd, nand,
> -				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
> -	if (ret || feature[0] !=3D mode)
> -		goto err_out;
> -
>  	nand->select_chip(mtd, -1);
> =20
>  	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
