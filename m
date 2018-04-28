Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fCOcu-0003p1-VN
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2018 12:06:55 +0000
Date: Sat, 28 Apr 2018 14:06:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jane Wan <Jane.Wan@nokia.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, ties.bos@nokia.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <Boris.Brezillon@bootlin.com>
Subject: Re: [PATCH 2/2] Use bit-wise majority to recover the contents of
 ONFI parameter
Message-ID: <20180428140638.2e2c04dd@xps13>
In-Reply-To: <1524788396-32380-3-git-send-email-Jane.Wan@nokia.com>
References: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
 <1524788396-32380-3-git-send-email-Jane.Wan@nokia.com>
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

Same comments as before, please: get the right maintainers, add a
commit log, rebase and fix the title prefix.

Have you ever needed/tried this algorithm before?=20

On Thu, 26 Apr 2018 17:19:56 -0700, Jane Wan
<Jane.Wan@nokia.com> wrote:

> Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> ---
>  drivers/mtd/nand/nand_base.c |   35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c2e1232..161b523 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3153,8 +3153,10 @@ static int nand_flash_detect_onfi(struct mtd_info =
*mtd, struct nand_chip *chip,
>  					int *busw)
>  {
>  	struct nand_onfi_params *p =3D &chip->onfi_params;
> -	int i, j;
> -	int val;
> +	int i, j, k, len, val;
> +	uint8_t copy[3][256], v8;

Please use u8 instead of uint8_t (./scripts/checkpatch.pl --strict will
give you the list of styling issues to fix.

I don't think you should allocate that much space on the stack, please
use dynamic allocation.

> +
> +	len =3D (sizeof(*p) > 256) ? 256 : sizeof(*p);

This is a maximum derivation, there are helpers for that.

I am not sure this is relevant, won't you read only 256 bytes anyway?

> =20
>  	/* Try ONFI for unknown chip or LP */
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> @@ -3170,11 +3172,36 @@ static int nand_flash_detect_onfi(struct mtd_info=
 *mtd, struct nand_chip *chip,
>  				le16_to_cpu(p->crc)) {
>  			break;
>  		}

Space.

> +		pr_err("CRC of parameter page %d is not valid\n", i);
> +		for (j =3D 0; j < len; j++)
> +			copy[i][j] =3D ((uint8_t *)p)[j];

'copy' is maybe not a meaningful name.

>  	}
> =20
>  	if (i =3D=3D 3) {
> -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> -		return 0;
> +		pr_err("Could not find valid ONFI parameter page\n");
> +		pr_info("Recover ONFI parameters with bit-wise majority\n");
> +		for (j =3D 0; j < len; j++) {
> +			if (copy[0][j] =3D=3D copy[1][j] ||
> +			    copy[0][j] =3D=3D copy[2][j]) {
> +				((uint8_t *)p)[j] =3D copy[0][j];
> +			} else if (copy[1][j] =3D=3D copy[2][j]) {
> +				((uint8_t *)p)[j] =3D copy[1][j];
> +			} else {
> +				((uint8_t *)p)[j] =3D 0;
> +				for (k =3D 0; k < 8; k++) {
> +					v8 =3D (copy[0][j] >> k) & 0x1;

v8 could be declared in the else statement of in the for loop.
The name could also be changed.

> +					v8 +=3D (copy[1][j] >> k) & 0x1;
> +					v8 +=3D (copy[2][j] >> k) & 0x1;
> +					if (v8 > 1)
> +						((uint8_t *)p)[j] |=3D (1 << k);

Please use the BIT() macro.

> +				}
> +			}
> +		}

Space.

> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) !=3D
> +		    le16_to_cpu(p->crc)) {
> +			pr_err("ONFI parameter recovery failed, aborting\n");
> +			return 0;
> +		}
>  	}
> =20
>  	/* Check version */

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
