Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apaR5-0000fE-VZ
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 11:55:23 +0000
Date: Mon, 11 Apr 2016 13:54:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stefan Christ <s.christ@phytec.de>
Cc: linux-mtd@lists.infradead.org, han.xu@nxp.com, eliedebrauwer@gmail.com,
 shijie8@gmail.com
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions
Message-ID: <20160411135446.1f8401e1@bbrezillon>
In-Reply-To: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
References: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
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

Hi Stefan,

Sorry for the late reply.

On Tue, 15 Mar 2016 09:35:37 +0100
Stefan Christ <s.christ@phytec.de> wrote:

> From: Elie De Brauwer <eliedebrauwer@gmail.com>
>=20
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings). This problem was also observed
> when using SLC NAND devices.
>=20
> This patch configures the BCH block to mark a block as 'erased' if
> not too much bitflips are found (by setting the erase threshold). A
> consequence of this is that whenever an erased page is read, the
> number of bitflips will be counted and corrected in software,
> allowing the upper layers to take proper actions.
>=20
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> Acked-by: Huang Shijie <b32955@freescale.com>
> ---
> Hi,
>=20
> I'm reposting this patch, because it's still not in the mainline kernel t=
ree.
> It was taken from
>=20
>     http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.ht=
ml
>     [PATCH v7] mtd: gpmi: Deal with bitflips in erased regions
>=20
> The patch fixes the UBI corrupted empty space problem:
>=20
>     UBIFS error (pid 74): ubifs_scan: corrupt empty space at LEB 3059:722=
60
>     UBIFS error (pid 74): ubifs_scanned_corruption: corruption at LEB 305=
9:72260
>     UBIFS error (pid 74): ubifs_scanned_corruption: first 8192 bytes from=
 LEB 3059:72260
>     UBIFS error (pid 74): ubifs_scan: LEB 3059 scanning failed
>=20
> which occurs in real systems sometimes.
>=20
> I've tested the patch.  You can add my
>=20
>     Tested-by: Stefan Christ <s.christ@phytec.de>
>=20
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
>         Stefan Christ
>=20
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  |  1 +
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  9 +++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 43 ++++++++++++++++++++++++++++=
+++---
>  3 files changed, 50 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpm=
i-nand/bch-regs.h
> index 05bb91f..88cc89d 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -31,6 +31,7 @@
> =20
>  #define HW_BCH_STATUS0				0x00000010
>  #define HW_BCH_MODE				0x00000020
> +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
>  #define HW_BCH_ENCODEPTR			0x00000030
>  #define HW_BCH_DATAPTR				0x00000040
>  #define HW_BCH_METAPTR				0x00000050
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 0f68a99..a724dcb 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -256,6 +256,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  	unsigned int ecc_strength;
>  	unsigned int page_size;
>  	unsigned int gf_len;
> +	unsigned int erase_threshold;
>  	int ret;
> =20
>  	if (common_nfc_set_geometry(this))
> @@ -298,6 +299,14 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
> =20
> +	/* Set the tolerance for bitflips when reading erased blocks. */
> +	erase_threshold =3D gf_len / 2;
> +	if (erase_threshold > bch_geo->ecc_strength)
> +		erase_threshold =3D bch_geo->ecc_strength;

Can we make it consistent with other drivers and always use ecc_strength
instead of gf_len / 2?

> +
> +	writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
> +		r->bch_regs + HW_BCH_MODE);
> +
>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
> =20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 235ddcb..ba852e8 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -991,6 +991,30 @@ static void block_mark_swapping(struct gpmi_nand_dat=
a *this,
>  	p[1] =3D (p[1] & mask) | (from_oob >> (8 - bit));
>  }
> =20
> +/*
> + * Count the number of 0 bits in a supposed to be
> + * erased region and correct them. Return the number
> + * of bitflips or zero when the region was correct.
> + */
> +static unsigned int erased_sector_bitflips(unsigned char *data,
> +					unsigned int chunk,
> +					struct bch_geometry *geo)
> +{
> +	unsigned int flip_bits =3D 0;
> +	int i;
> +	int base =3D geo->ecc_chunk_size * chunk;
> +
> +	/* Count bitflips */
> +	for (i =3D 0; i < geo->ecc_chunk_size; i++)
> +		flip_bits +=3D hweight8(~data[base + i]);

Hm, the number of bitflips in this case is not always correct: you're
only counting bitflips in the data section and are completely ignoring
ECC bytes.

If you don't have direct access to ECC bytes, you should read them and
count the number of bitflips in there too.

> +
> +	/* Correct bitflips by 0xFF'ing this chunk. */
> +	if (flip_bits)
> +		memset(&data[base], 0xFF, geo->ecc_chunk_size);
> +
> +	return flip_bits;
> +}
> +

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
