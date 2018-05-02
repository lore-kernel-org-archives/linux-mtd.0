Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDtgb-0000ZL-GL
 for linux-mtd@lists.infradead.org; Wed, 02 May 2018 15:28:55 +0000
Date: Wed, 2 May 2018 17:28:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180502172830.7697e75f@xps13>
In-Reply-To: <7db679c90cc041c78a1eb1fadf505bcd@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
 <20180426090321.1a5dee5b@xps13>
 <7db679c90cc041c78a1eb1fadf505bcd@svr-chch-ex1.atlnz.lc>
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

Hi Chris,


> >>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda
> >>>>>>> nand: Macronix MX30LF2G18AC
> >>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz=
e: 64

When forcing the ONFI parameters in the core to match the
characteristics of your chip, it looks like I hit the same problems:
http://code.bulix.org/nun6tn-327366

I will search for a fix and let you know.

>=20
> --- 8< ---
> Subject: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
>=20
> marvell_nfc_wait_op() expects the delay to be expressed in milliseconds
> but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing
> tPROG_max to marvell_nfc_wait_op().
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   drivers/mtd/nand/raw/marvell_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c=20
> b/drivers/mtd/nand/raw/marvell_nand.c
> index 1d779a35ac8e..e4b964fd40d8 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1074,7 +1074,7 @@ static int=20
> marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>   		return ret;
>=20
>   	ret =3D marvell_nfc_wait_op(chip,
> -				  chip->data_interface.timings.sdr.tPROG_max);
> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
>   	return ret;
>   }
>=20
> @@ -1494,7 +1494,7 @@ static int=20
> marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,
>   	}
>=20
>   	ret =3D marvell_nfc_wait_op(chip,
> -				  chip->data_interface.timings.sdr.tPROG_max);
> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
>=20
>   	marvell_nfc_disable_hw_ecc(chip);
>=20
> --- 8< ---

Could you please send this patch officially with the proper Fixes:/Cc:
tags?

Thanks,
Miqu=C3=A8l


--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
