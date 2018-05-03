Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE6nh-0007oT-0A
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 05:29:07 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
Date: Thu, 3 May 2018 05:28:32 +0000
Message-ID: <a40b0454ea78494983c909fd6b2c08c8@svr-chch-ex1.atlnz.lc>
References: <20180503022128.10702-1-chris.packham@alliedtelesis.co.nz>
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

On 03/05/18 14:21, Chris Packham wrote:=0A=
> marvell_nfc_wait_op() expects the delay to be expressed in milliseconds=
=0A=
> but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing=0A=
> tPROG_max to marvell_nfc_wait_op().=0A=
> =0A=
> Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller dr=
iver")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
>   drivers/mtd/nand/raw/marvell_nand.c | 4 ++--=0A=
>   1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c=0A=
> index 1d779a35ac8e..e4b964fd40d8 100644=0A=
> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
> @@ -1074,7 +1074,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(str=
uct nand_chip *chip,=0A=
>   		return ret;=0A=
>   =0A=
>   	ret =3D marvell_nfc_wait_op(chip,=0A=
> -				  chip->data_interface.timings.sdr.tPROG_max);=0A=
> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
>   	return ret;=0A=
>   }=0A=
>   =0A=
> @@ -1494,7 +1494,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct=
 mtd_info *mtd,=0A=
>   	}=0A=
>   =0A=
>   	ret =3D marvell_nfc_wait_op(chip,=0A=
> -				  chip->data_interface.timings.sdr.tPROG_max);=0A=
> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
>   =0A=
>   	marvell_nfc_disable_hw_ecc(chip);=0A=
>   =0A=
=0A=
Actually I'm not so sure about this patch. While passing the pico-second =
=0A=
value for tPROG_max is clearly wrong and leads to seemingly indefinite =0A=
hangs on some systems. Converting the times to micro-seconds leaves us =0A=
with delays that are far too short.=0A=
=0A=
The old pxa3xx driver had hard coded 200ms delays. These delays now work =
=0A=
out to 1ms which seems every bit as wrong as 600000000ms.=0A=
=0A=
