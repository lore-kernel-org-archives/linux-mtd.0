Received: from mail.phytec.co.uk ([217.6.246.34] helo=root.phytec.de)
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1apZsq-0004xK-0J
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 11:19:56 +0000
Date: Mon, 11 Apr 2016 13:18:52 +0200
From: Stefan Christ <s.christ@phytec.de>
To: linux-mtd@lists.infradead.org
Cc: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, eliedebrauwer@gmail.com
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions
Message-ID: <20160411111852.GE2430@lws-christ>
References: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
MIME-Version: 1.0
In-Reply-To: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

*ping for my last email. Again this is a real issue for deployed devices and
should be fixed in the mainline kernel.

I hope that the patch author maybe step up and vote that his patch gets
accepted into mainline, too.

The original patch disccusion is

   http://lists.infradead.org/pipermail/linux-mtd/2014-January/051356.html

There seems to be no issues left with this patch.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ

On Tue, Mar 15, 2016 at 09:35:37AM +0100, Stefan Christ wrote:
> From: Elie De Brauwer <eliedebrauwer@gmail.com>
>=20
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi=5Fecc=5Fread=5Fpage to return failure as soon as a single non-1-bit =
is
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
>     UBIFS error (pid 74): ubifs=5Fscan: corrupt empty space at LEB 3059:7=
2260
>     UBIFS error (pid 74): ubifs=5Fscanned=5Fcorruption: corruption at LEB=
 3059:72260
>     UBIFS error (pid 74): ubifs=5Fscanned=5Fcorruption: first 8192 bytes =
from LEB 3059:72260
>     UBIFS error (pid 74): ubifs=5Fscan: LEB 3059 scanning failed
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
>  #define HW=5FBCH=5FSTATUS0				0x00000010
>  #define HW=5FBCH=5FMODE				0x00000020
> +#define BM=5FBCH=5FMODE=5FERASE=5FTHRESHOLD=5FMASK	0xff
>  #define HW=5FBCH=5FENCODEPTR			0x00000030
>  #define HW=5FBCH=5FDATAPTR				0x00000040
>  #define HW=5FBCH=5FMETAPTR				0x00000050
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 0f68a99..a724dcb 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -256,6 +256,7 @@ int bch=5Fset=5Fgeometry(struct gpmi=5Fnand=5Fdata *t=
his)
>  	unsigned int ecc=5Fstrength;
>  	unsigned int page=5Fsize;
>  	unsigned int gf=5Flen;
> +	unsigned int erase=5Fthreshold;
>  	int ret;
> =20
>  	if (common=5Fnfc=5Fset=5Fgeometry(this))
> @@ -298,6 +299,14 @@ int bch=5Fset=5Fgeometry(struct gpmi=5Fnand=5Fdata *=
this)
>  			| BF=5FBCH=5FFLASH0LAYOUT1=5FDATAN=5FSIZE(block=5Fsize, this),
>  			r->bch=5Fregs + HW=5FBCH=5FFLASH0LAYOUT1);
> =20
> +	/* Set the tolerance for bitflips when reading erased blocks. */
> +	erase=5Fthreshold =3D gf=5Flen / 2;
> +	if (erase=5Fthreshold > bch=5Fgeo->ecc=5Fstrength)
> +		erase=5Fthreshold =3D bch=5Fgeo->ecc=5Fstrength;
> +
> +	writel(erase=5Fthreshold & BM=5FBCH=5FMODE=5FERASE=5FTHRESHOLD=5FMASK,
> +		r->bch=5Fregs + HW=5FBCH=5FMODE);
> +
>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch=5Fregs + HW=5FBCH=5FLAYOUTSELECT);
> =20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 235ddcb..ba852e8 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -991,6 +991,30 @@ static void block=5Fmark=5Fswapping(struct gpmi=5Fna=
nd=5Fdata *this,
>  	p[1] =3D (p[1] & mask) | (from=5Foob >> (8 - bit));
>  }
> =20
> +/*
> + * Count the number of 0 bits in a supposed to be
> + * erased region and correct them. Return the number
> + * of bitflips or zero when the region was correct.
> + */
> +static unsigned int erased=5Fsector=5Fbitflips(unsigned char *data,
> +					unsigned int chunk,
> +					struct bch=5Fgeometry *geo)
> +{
> +	unsigned int flip=5Fbits =3D 0;
> +	int i;
> +	int base =3D geo->ecc=5Fchunk=5Fsize * chunk;
> +
> +	/* Count bitflips */
> +	for (i =3D 0; i < geo->ecc=5Fchunk=5Fsize; i++)
> +		flip=5Fbits +=3D hweight8(~data[base + i]);
> +
> +	/* Correct bitflips by 0xFF'ing this chunk. */
> +	if (flip=5Fbits)
> +		memset(&data[base], 0xFF, geo->ecc=5Fchunk=5Fsize);
> +
> +	return flip=5Fbits;
> +}
> +
>  static int gpmi=5Fecc=5Fread=5Fpage(struct mtd=5Finfo *mtd, struct nand=
=5Fchip *chip,
>  				uint8=5Ft *buf, int oob=5Frequired, int page)
>  {
> @@ -1002,6 +1026,7 @@ static int gpmi=5Fecc=5Fread=5Fpage(struct mtd=5Fin=
fo *mtd, struct nand=5Fchip *chip,
>  	dma=5Faddr=5Ft    auxiliary=5Fphys;
>  	unsigned int  i;
>  	unsigned char *status;
> +	unsigned int  flips;
>  	unsigned int  max=5Fbitflips =3D 0;
>  	int           ret;
> =20
> @@ -1036,15 +1061,27 @@ static int gpmi=5Fecc=5Fread=5Fpage(struct mtd=5F=
info *mtd, struct nand=5Fchip *chip,
>  	status =3D auxiliary=5Fvirt + nfc=5Fgeo->auxiliary=5Fstatus=5Foffset;
> =20
>  	for (i =3D 0; i < nfc=5Fgeo->ecc=5Fchunk=5Fcount; i++, status++) {
> -		if ((*status =3D=3D STATUS=5FGOOD) || (*status =3D=3D STATUS=5FERASED))
> +		if (*status =3D=3D STATUS=5FGOOD)
>  			continue;
> =20
>  		if (*status =3D=3D STATUS=5FUNCORRECTABLE) {
>  			mtd->ecc=5Fstats.failed++;
>  			continue;
>  		}
> -		mtd->ecc=5Fstats.corrected +=3D *status;
> -		max=5Fbitflips =3D max=5Ft(unsigned int, max=5Fbitflips, *status);
> +
> +		/*
> +		 * The number of bitflips are either counted in software
> +		 * in case of an erased chunk or otherwise reported by
> +		 * the BCH block.
> +		 */
> +		if (*status =3D=3D STATUS=5FERASED)
> +			flips =3D erased=5Fsector=5Fbitflips(payload=5Fvirt, i,
> +							nfc=5Fgeo);
> +		else
> +			flips =3D *status;
> +
> +		mtd->ecc=5Fstats.corrected +=3D flips;
> +		max=5Fbitflips =3D max=5Ft(unsigned int, max=5Fbitflips, flips);
>  	}
> =20
>  	if (oob=5Frequired) {
> --=20
> 1.9.1
>=20
>=20

> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
