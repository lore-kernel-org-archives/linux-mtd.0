Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fCOFL-0004lO-TD
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2018 11:42:33 +0000
Date: Sat, 28 Apr 2018 13:42:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jane Wan <Jane.Wan@nokia.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, ties.bos@nokia.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <Boris.Brezillon@bootlin.com>
Subject: Re: [PATCH 1/2] Fix FSL NAND driver to read all ONFI parameter pages
Message-ID: <20180428134218.3ae857eb@xps13>
In-Reply-To: <1524788396-32380-2-git-send-email-Jane.Wan@nokia.com>
References: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
 <1524788396-32380-2-git-send-email-Jane.Wan@nokia.com>
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

Hi Jane,

You forgot to Cc the right maintainers, please
use ./scripts/get_maintainer.pl for that.

> Signed-off-by: Jane Wan <Jane.Wan@nokia.com>

Please add a description of what your are doing in the commit message.
The description in the cover letter is good, you can copy the relevant
section here.

> ---
>  drivers/mtd/nand/fsl_ifc_nand.c |   10 ++++++----

Also, just for you to know, files have moved in a raw/ subdirectory, so
please rebase on top of 4.17-rc1 and prefix the commit title with
"mtd: rawnand: fsl_ifc:".

>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_n=
and.c
> index ca36b35..a3cf6ca 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -413,6 +413,7 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, uns=
igned int command,
>  	struct fsl_ifc_mtd *priv =3D chip->priv;
>  	struct fsl_ifc_ctrl *ctrl =3D priv->ctrl;
>  	struct fsl_ifc_runtime __iomem *ifc =3D ctrl->rregs;
> +	int len;
> =20
>  	/* clear the read buffer */
>  	ifc_nand_ctrl->read_bytes =3D 0;
> @@ -462,11 +463,12 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, u=
nsigned int command,
>  		ifc_out32(column, &ifc->ifc_nand.row3);
> =20
>  		/*
> -		 * although currently it's 8 bytes for READID, we always read
> -		 * the maximum 256 bytes(for PARAM)
> +		 * For READID, read 8 bytes that are currently used.
> +		 * For PARAM, read all 3 copies of 256-bytes pages.
>  		 */
> -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> -		ifc_nand_ctrl->read_bytes =3D 256;
> +		len =3D (command =3D=3D NAND_CMD_PARAM) ? (3 * 256) : 8;

There is already a "command =3D=3D NAND_CMD_PARAM" condition above, you
might want to use it.

> +		ifc_out32(len, &ifc->ifc_nand.nand_fbcr);
> +		ifc_nand_ctrl->read_bytes =3D len;
> =20
>  		set_addr(mtd, 0, 0, 0);
>  		fsl_ifc_run_command(mtd);

The overall ->cmdfunc() approach of this driver is horrible. However
this fixes its implementation to match the current state of the core,
so I guess it is fine.

Regards,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
