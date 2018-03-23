Received: from mail-ve1eur02on061f.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::61f]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezEsT-0002dw-JX
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 05:04:43 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "oss@buserror.net" <oss@buserror.net>, Leo Li <leoyang.li@nxp.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: RE: [PATCH][v5] mtd: rawnand: fsl_ifc: Fix eccstat array overflow for
 IFC ver >= 2.0.0
Date: Fri, 23 Mar 2018 05:04:15 +0000
Message-ID: <HE1PR0402MB27787356BB94AB5D0C69153C90A80@HE1PR0402MB2778.eurprd04.prod.outlook.com>
References: <1521669973-10450-1-git-send-email-jagdish.gediya@nxp.com>
In-Reply-To: <1521669973-10450-1-git-send-email-jagdish.gediya@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi Boris,

> -----Original Message-----
> From: Jagdish Gediya
> Sent: Thursday, March 22, 2018 3:36 AM
> To: linux-mtd@lists.infradead.org
> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
> oss@buserror.net; Leo Li <leoyang.li@nxp.com>; Jagdish Gediya
> <jagdish.gediya@nxp.com>; stable@vger.kernel.org; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: [PATCH][v5] mtd: rawnand: fsl_ifc: Fix eccstat array overflow fo=
r IFC
> ver >=3D 2.0.0
>=20
> Number of ECC status registers i.e. (ECCSTATx) has been increased in IFC
> version 2.0.0 due to increase in SRAM size. This is causing eccstat array=
 to over
> flow.
>=20
> So, replace eccstat array with u32 variable to make it fail-safe and inde=
pendent
> of number of ECC status registers or SRAM size.
>=20
> Fixes: bccb06c353af ("mtd: nand: ifc: update bufnum mask for ver >=3D 2.0=
.0")
> Cc: stable@vger.kernel.org # 3.18+
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> ---
> Changes for v2: Incorporated comments from Miquel Raynal and Boris Brezil=
lon
>         - Updated patch subject
>         - Remove usage of eccstat array
>         - Added Cc: stable@vger.kernel.org
>=20
> Changes for v3: Incorporated comments from Boris Brezillon
>         - Added fixes tag
>=20
> Changes for v4: Incorporated comments from Boris Brezillon
>=20
> Changes for v5: Incorporated comments from Boris Brezillon

I am seeing this patch[v5]'s state as superseded @ https://patchwork.ozlabs=
.org/project/linux-mtd/list/?series=3D&submitter=3D73665&state=3D9&q=3D&arc=
hive=3D&delegate=3D , May I know the reason?
>=20
>  drivers/mtd/nand/fsl_ifc_nand.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_n=
and.c
> index 4872a7b..f0b4ecd 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -173,14 +173,9 @@ static void set_addr(struct mtd_info *mtd, int
> column, int page_addr, int oob)
>=20
>  /* returns nonzero if entire page is blank */  static int check_read_ecc=
(struct
> mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
> -			  u32 *eccstat, unsigned int bufnum)
> +			  u32 eccstat, unsigned int bufnum)
>  {
> -	u32 reg =3D eccstat[bufnum / 4];
> -	int errors;
> -
> -	errors =3D (reg >> ((3 - bufnum % 4) * 8)) & 15;
> -
> -	return errors;
> +	return  (eccstat >> ((3 - bufnum % 4) * 8)) & 15;
>  }
>=20
>  /*
> @@ -193,7 +188,7 @@ static void fsl_ifc_run_command(struct mtd_info
> *mtd)
>  	struct fsl_ifc_ctrl *ctrl =3D priv->ctrl;
>  	struct fsl_ifc_nand_ctrl *nctrl =3D ifc_nand_ctrl;
>  	struct fsl_ifc_runtime __iomem *ifc =3D ctrl->rregs;
> -	u32 eccstat[4];
> +	u32 eccstat;
>  	int i;
>=20
>  	/* set the chip select for NAND Transaction */ @@ -228,8 +223,8 @@
> static void fsl_ifc_run_command(struct mtd_info *mtd)
>  	if (nctrl->eccread) {
>  		int errors;
>  		int bufnum =3D nctrl->page & priv->bufnum_mask;
> -		int sector =3D bufnum * chip->ecc.steps;
> -		int sector_end =3D sector + chip->ecc.steps - 1;
> +		int sector_start =3D bufnum * chip->ecc.steps;
> +		int sector_end =3D sector_start + chip->ecc.steps - 1;
>  		__be32 *eccstat_regs;
>=20
>  		if (ctrl->version >=3D FSL_IFC_VERSION_2_0_0) @@ -237,10
> +232,12 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  		else
>  			eccstat_regs =3D ifc->ifc_nand.v1_nand_eccstat;
>=20
> -		for (i =3D sector / 4; i <=3D sector_end / 4; i++)
> -			eccstat[i] =3D ifc_in32(&eccstat_regs[i]);
> +		eccstat =3D ifc_in32(&eccstat_regs[sector_start / 4]);
> +
> +		for (i =3D sector_start; i <=3D sector_end; i++) {
> +			if ((i !=3D sector_start) && !(i % 4))
> +				eccstat =3D ifc_in32(&eccstat_regs[i / 4]);
>=20
> -		for (i =3D sector; i <=3D sector_end; i++) {
>  			errors =3D check_read_ecc(mtd, ctrl, eccstat, i);
>=20
>  			if (errors =3D=3D 15) {
> --
> 1.9.1

Thanks,
Jagdish
