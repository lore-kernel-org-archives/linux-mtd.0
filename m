Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUMTv-0001sY-7a
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 23:51:05 +0000
From: "Langer, Thomas" <thomas.langer@intel.com>
To: Sebastien Decourriere <sebtx452@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Subject: RE: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness
 swap is enabled
Date: Thu, 19 Jan 2017 23:50:39 +0000
Message-ID: <0DAF21CFE1B20740AE23D6AF6E54843F1E6E2999@IRSMSX101.ger.corp.intel.com>
References: <1484820415-12439-1-git-send-email-sebtx452@gmail.com>
In-Reply-To: <1484820415-12439-1-git-send-email-sebtx452@gmail.com>
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

Hello Sebastien,

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org [mailto:linux-mips-bounce@linux-
> mips.org] On Behalf Of Sebastien Decourriere
> Sent: Thursday, January 19, 2017 11:07 AM
> To: linux-mtd@lists.infradead.org
> Cc: linux-mips@linux-mips.org; Sebastien Decourriere <sebtx452@gmail.com>
> Subject: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swa=
p
> is enabled
>=20
> The purpose of this patch is to enable the software address endianness
> swapping only when the in SoC EBU endianness swapping is disabled.
> To perform this check, I look at Bit 30 of the EBU_CON_0 register.
> Actually, the driver expects that the in SoC swapping is disabled.
> This is the case with current bootloaders shuch as U-boot.
>=20
> This applies only to vr9 (xrx200) rev 1.2 and ar10 (xrx300).
>=20
> I have a router which uses a proprietary bootloader which keeps
> the in SoC swapping enabled. The SoC in this router is a vrx200 v1.2.
> In this SoC version, I can keep the in SoC swapping without any problem.
>=20
> This patch replaces my previous broken patch.
>=20
> Signed-off-by: Sebastien Decourriere <sebtx452@gmail.com>
> ---
>  drivers/mtd/maps/lantiq-flash.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-
> flash.c
> index c8febb3..1cbbdcb 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -38,6 +38,8 @@ enum {
>  	LTQ_NOR_NORMAL
>  };
>=20
> +#define EBU_ENDIAN_SWAP		BIT(30)
> +
>  struct ltq_mtd {
>  	struct resource *res;
>  	struct mtd_info *mtd;
> @@ -113,6 +115,20 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	struct ltq_mtd *ltq_mtd;
>  	struct cfi_private *cfi;
>  	int err;
> +	bool mtd_addr_swap;
> +
> +	/* If SoC is vr9 >=3D 1.2 or ar10 and EBU endian swap
> +	   is enabled, we don't need to do software address swap */
> +	if ( ltq_ebu_r32(LTQ_EBU_BUSCON0) & EBU_ENDIAN_SWAP ) {

This register does not exist for all Lantiq SoCs, even the definition
is only in "arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h", but
not in "arch/mips/include/asm/mach-lantiq/falcon/lantiq_soc.h"

Please add at least a compile check for the define.

> +		switch (ltq_soc_type()) {
> +			case SOC_TYPE_VR9_2 :
> +			case SOC_TYPE_AR10 :
> +				mtd_addr_swap =3D false;
> +				break;
> +			default :
> +				mtd_addr_swap =3D true;
Missing break

> +		}
> +	} else mtd_addr_swap =3D true;

Has this been checked with checkpatch.pl?
This line results in message "ERROR: trailing statements should be on next =
line",
some other warning about spaces are also in this patch.

>=20
>  	if (of_machine_is_compatible("lantiq,falcon") &&
>  			(ltq_boot_select() !=3D BS_FLASH)) {
> @@ -150,7 +166,10 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	ltq_mtd->map->copy_from =3D ltq_copy_from;
>  	ltq_mtd->map->copy_to =3D ltq_copy_to;
>=20
> -	ltq_mtd->map->map_priv_1 =3D LTQ_NOR_PROBING;
> +	if (mtd_addr_swap)
> +		ltq_mtd->map->map_priv_1 =3D LTQ_NOR_PROBING;
> +	else
> +		ltq_mtd->map->map_priv_1 =3D LTQ_NOR_NORMAL;
>  	ltq_mtd->mtd =3D do_map_probe("cfi_probe", ltq_mtd->map);
>  	ltq_mtd->map->map_priv_1 =3D LTQ_NOR_NORMAL;
>=20
> @@ -163,8 +182,10 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);
>=20
>  	cfi =3D ltq_mtd->map->fldrv_priv;
> -	cfi->addr_unlock1 ^=3D 1;
> -	cfi->addr_unlock2 ^=3D 1;
> +	if (mtd_addr_swap) {
> +		cfi->addr_unlock1 ^=3D 1;
> +		cfi->addr_unlock2 ^=3D 1;
> +	}
>=20
>  	err =3D mtd_device_register(ltq_mtd->mtd, NULL, 0);
>  	if (err) {
> --
> 2.1.4
>=20

Regards,
Thomas
