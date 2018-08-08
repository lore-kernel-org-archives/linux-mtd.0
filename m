Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnL5M-0005t5-KU
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2018 09:48:58 +0000
Date: Wed, 8 Aug 2018 11:48:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Jane Wan <Jane.Wan@nokia.com>, Jagdish
 Gediya <jagdish.gediya@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: fsl-ifc: fixup SRAM init for newer ctrl
 versions
Message-ID: <20180808114832.61d31c29@xps13>
In-Reply-To: <20180806092137.9287-3-kurt@linutronix.de>
References: <20180806092137.9287-1-kurt@linutronix.de>
 <20180806092137.9287-3-kurt@linutronix.de>
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

Hi Kurt,

Subject prefix should be "mtd: rawnand: fsl_ifc:".

Kurt Kanzenbach <kurt@linutronix.de> wrote on Mon,  6 Aug 2018 11:21:37
+0200:

> Newer versions of the IFC controller use a different method of initializi=
ng the
> internal SRAM: Instead of reading from flash, a bit in the NAND configura=
tion
> register has to be set in order to trigger the self-initializing process.
>=20
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 18 ++++++++++++++++++
>  include/linux/fsl_ifc.h             |  2 ++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/f=
sl_ifc_nand.c
> index e4f5792dc589..384d5e12b05c 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -30,6 +30,7 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/nand_ecc.h>
>  #include <linux/fsl_ifc.h>
> +#include <linux/iopoll.h>
> =20
>  #define ERR_BYTE		0xFF /* Value returned for read
>  					bytes when read failed	*/
> @@ -769,6 +770,23 @@ static int fsl_ifc_sram_init(struct fsl_ifc_mtd *pri=
v)
>  	uint32_t csor =3D 0, csor_8k =3D 0, csor_ext =3D 0;
>  	uint32_t cs =3D priv->bank;
> =20
> +	if (ctrl->version > FSL_IFC_VERSION_1_1_0) {

This is redundant and fsl_ifc_sram_init() is called only if
"ctrl->version > FSL_FC_VERSION_1_1_0".

So this means this function has never worked?

If this is the case, there should be at least a Fixes: tag.

Maybe it would be cleaner to always call fsl_ifc_sram_init() from the
probe(), and just exit with a "return 0" here if the version is old?
(I'll let you choose the way you prefer).

> +		u32 ncfgr, status;
> +		int ret;
> +
> +		/* Trigger auto initialization */
> +		ncfgr =3D ifc_in32(&ifc_runtime->ifc_nand.ncfgr);
> +		ifc_out32(ncfgr | IFC_NAND_NCFGR_SRAM_INIT_EN, &ifc_runtime->ifc_nand.=
ncfgr);
> +
> +		/* Wait until done */
> +		ret =3D readx_poll_timeout(ifc_in32, &ifc_runtime->ifc_nand.ncfgr,
> +					 status, !(status & IFC_NAND_NCFGR_SRAM_INIT_EN),
> +					 10, 1000);

Nit: I always prefer when delays/timeouts are defined (and may be
reused).

> +		if (ret)
> +			dev_err(priv->dev, "Failed to initialize SRAM!\n");

Space

> +		return ret;
> +	}
> +
>  	/* Save CSOR and CSOR_ext */
>  	csor =3D ifc_in32(&ifc_global->csor_cs[cs].csor);
>  	csor_ext =3D ifc_in32(&ifc_global->csor_cs[cs].csor_ext);
> diff --git a/include/linux/fsl_ifc.h b/include/linux/fsl_ifc.h
> index 3fdfede2f0f3..5f343b796ad9 100644
> --- a/include/linux/fsl_ifc.h
> +++ b/include/linux/fsl_ifc.h
> @@ -274,6 +274,8 @@
>   */
>  /* Auto Boot Mode */
>  #define IFC_NAND_NCFGR_BOOT		0x80000000
> +/* SRAM Initialization */
> +#define IFC_NAND_NCFGR_SRAM_INIT_EN	0x20000000
>  /* Addressing Mode-ROW0+n/COL0 */
>  #define IFC_NAND_NCFGR_ADDR_MODE_RC0	0x00000000
>  /* Addressing Mode-ROW0+n/COL0+n */


Thanks,
Miqu=C3=A8l
