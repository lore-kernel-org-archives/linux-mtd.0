Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKSBz-0005N7-OG
 for linux-mtd@lists.infradead.org; Sun, 20 May 2018 17:32:25 +0000
Date: Sun, 20 May 2018 19:32:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com,
 richard@nod.at, marek.vasut@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 1/1] mtd: rawnand: hynix: fix decoding the OOB size on
 H27UCG8T2BTR
Message-ID: <20180520193210.442c54d1@xps13>
In-Reply-To: <20180519124431.16000-2-martin.blumenstingl@googlemail.com>
References: <20180519124431.16000-1-martin.blumenstingl@googlemail.com>
 <20180519124431.16000-2-martin.blumenstingl@googlemail.com>
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

Hi Martin,

On Sat, 19 May 2018 14:44:31 +0200, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The datasheet of the H27UCG8T2BTR states that this chip has a page size
> of "16,384 + 1,280(Spare) bytes". The description of the "4th Byte of
> Device Identifier Description" indicates that bits 6, 3 and 2 are
> encoding the "Redundant Area Size / 8KB", where 640 bytes is a value of
> 0x6 (110 in binary notation).
>=20
> hynix_nand_extract_oobsize decodes an OOB size of 640 bytes for this
> chip. Kernel boot log extract before this patch:
> nand: Could not find valid ONFI parameter page; aborting
> nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
> nand: Hynix NAND 8GiB 3,3V 8-bit
> nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
>       OOB size: 640
>=20
> However, based on the description in the datasheet we need to multiply
> the OOB size with 2, because it's "640 spare bytes per 8192 bytes page
> size" and this NAND chip has a page size of 16384 (=3D 2 * 8192). After
> this patch the kernel boot log reports:
> nand: Could not find valid ONFI parameter page; aborting
> nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
> nand: Hynix NAND 8GiB 3,3V 8-bit
> nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
>       OOB size: 1280
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/mtd/nand/raw/nand_hynix.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nan=
d_hynix.c
> index d542908a0ebb..60d9c54b769f 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -473,6 +473,10 @@ static void hynix_nand_extract_oobsize(struct nand_c=
hip *chip,
>  			WARN(1, "Invalid OOB size");
>  			break;
>  		}
> +
> +		/* Reference: H27UCG8T2BTR - "Redundant Area Size / 8KB" */
> +		if (mtd->writesize =3D=3D SZ_16K)
> +			mtd->oobsize *=3D 2;

As we're not entirely sure this is the case for all Hynix 16k pages
NAND chips, would you mind narrowing the fix to only this reference?
Something like the following:

    if (!strcmp("H27UCG8T2BTR", chip->parameters.model))

with a nice comment forward explaining why you do it.

>  	}
>  }
> =20

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
