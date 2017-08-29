Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dmfSK-0004rz-Ir
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 12:17:23 +0000
Date: Tue, 29 Aug 2017 14:16:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: make Samsung SLC NAND usable again
Message-ID: <20170829141658.252a84e0@bbrezillon>
In-Reply-To: <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
 <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
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

Hi Lothar,

On Tue, 29 Aug 2017 12:17:12 +0200
Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:

> commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
> logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
> chips. Prior to this commit chip->bits_per_cell was initialized by calling
> nand_get_bits_per_cell() before using nand_is_slc().
> With the offending commit this call is skipped, leaving
> chip->bits_per_cell cleared to zero when the manufacturer specific
> '.detect' function calls nand_is_slc() which in turn interprets
> bits_per_cell !=3D 1 as indication for an MLC chip.
> The effect is that e.g. a K9F1G08U0F NAND chip is falsely detected as
> MLC NAND with 4KiB page size rather than SLC with 2KiB page size.

Oops, sorry for this regression.

>=20
> Add a call to nand_get_bits_per_cell() before calling the .detect hook
> function in nand_manufacturer_detect(), so that the nand_is_slc()
> calls in the manufacturer specific code will return correct results.

I'd prefer a different solution (see below).

>=20
> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> ---
>  drivers/mtd/nand/nand_base.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9900476..bcc8cef1 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3820,10 +3820,13 @@ static void nand_manufacturer_detect(struct nand_=
chip *chip)
>  	 * nand_decode_ext_id() otherwise.
>  	 */
>  	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> -	    chip->manufacturer.desc->ops->detect)
> +	    chip->manufacturer.desc->ops->detect) {
> +		/* The 3rd id byte holds MLC / multichip data */
> +		chip->bits_per_cell =3D nand_get_bits_per_cell(chip->id.data[2]);

I'd prefer not to force this bit_per_cell detection here. How about
explicitly calling nand_decode_ext_id() from the samsung and hynix
->detect() hooks (see proposed diff below)?

Regards,

Boris

>  		chip->manufacturer.desc->ops->detect(chip);
> -	else
> +	} else {
>  		nand_decode_ext_id(chip);
> +	}
>  }
> =20
>  /*

--->8---
diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index b12dc7325378..d3d41ebc2164 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -547,6 +547,8 @@ static void hynix_nand_decode_id(struct nand_chip *chip)
 	bool valid_jedecid;
 	u8 tmp;
=20
+	nand_decode_ext_id(chip);
+
 	/*
 	 * Exclude all SLC NANDs from this advanced detection scheme.
 	 * According to the ranges defined in several datasheets, it might
@@ -554,10 +556,8 @@ static void hynix_nand_decode_id(struct nand_chip *chi=
p)
 	 * If that the case rework the test to let SLC NANDs go through the
 	 * detection process.
 	 */
-	if (chip->id.len < 6 || nand_is_slc(chip)) {
-		nand_decode_ext_id(chip);
+	if (chip->id.len < 6 || nand_is_slc(chip))
 		return;
-	}
=20
 	/* Extract pagesize */
 	mtd->writesize =3D 2048 << (chip->id.data[3] & 0x03);
diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsun=
g.c
index 1e0755997762..b009b47ac552 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -21,6 +21,8 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
=20
+	nand_decode_ext_id(chip);
+
 	/* New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44) */
 	if (chip->id.len =3D=3D 6 && !nand_is_slc(chip) &&
 	    chip->id.data[5] !=3D 0x00) {
@@ -89,8 +91,6 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 				chip->ecc_step_ds =3D 0;
 			}
 		}
-	} else {
-		nand_decode_ext_id(chip);
 	}
 }
