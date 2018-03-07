Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1etVer-00083W-5f
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 09:46:51 +0000
Date: Wed, 7 Mar 2018 10:46:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: linux-mtd@lists.infradead.org, oss@buserror.net,
 boris.brezillon@bootlin.com, computersforpeace@gmail.com,
 leoyang.li@nxp.com
Subject: Re: [PATCH] driver: mtd: ifc: increase eccstat array size for ver
 >= 2.0.0
Message-ID: <20180307104634.50c8a28a@xps13>
In-Reply-To: <20180307091656.16378-1-prabhakar.kushwaha@nxp.com>
References: <20180307091656.16378-1-prabhakar.kushwaha@nxp.com>
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

Hi Prabhakar,

On Wed,  7 Mar 2018 14:46:56 +0530, Prabhakar Kushwaha
<prabhakar.kushwaha@nxp.com> wrote:

> Number of ECC status registers i.e. (ECCSTATx) has been increased
> in IFC version 2.0.0 due to increase in SRAM size.
>=20
> Fix the resulting eccstat array overflow.
>=20
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>

Prefix should be "mtd: rawnand: fsl_ifc: ". It used to be "nand"
instead of "rawnand" but "raw NAND" drivers are moved into a separate
subfolder to make clear separations between families, and the prefix
should follow.

> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_n=
and.c
> index 4872a7ba6503..612f0990fa90 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -193,7 +193,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  	struct fsl_ifc_ctrl *ctrl =3D priv->ctrl;
>  	struct fsl_ifc_nand_ctrl *nctrl =3D ifc_nand_ctrl;
>  	struct fsl_ifc_runtime __iomem *ifc =3D ctrl->rregs;
> -	u32 eccstat[4];
> +	u32 eccstat[8];
>  	int i;
> =20
>  	/* set the chip select for NAND Transaction */
> @@ -237,8 +237,14 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  		else
>  			eccstat_regs =3D ifc->ifc_nand.v1_nand_eccstat;
> =20
> -		for (i =3D sector / 4; i <=3D sector_end / 4; i++)
> +		for (i =3D sector / 4; i <=3D sector_end / 4; i++) {
> +			if (i >=3D ARRAY_SIZE(eccstat)) {
> +				dev_err(priv->dev, "%s: eccstat small for %d\n",
> +					__func__, i);
> +				return;
> +			}

I suppose this check is here to prevent possible silent overflows
due to further enlargements of the number of ECC status registers, but
I don't think this is the right place to do so.

Actually, the only function in which this array is used is
check_read_ecc() and it does nothing else than looking at one register
in the array at a time. I am pretty sure this function could be
reworked a bit to get rid of the array and use a single "u32 eccstat;".

>  			eccstat[i] =3D ifc_in32(&eccstat_regs[i]);
> +		}
> =20
>  		for (i =3D sector; i <=3D sector_end; i++) {
>  			errors =3D check_read_ecc(mtd, ctrl, eccstat, i);

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
