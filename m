Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEOFk-0001Cc-Ga
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 00:07:14 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: fix command xtype in BCH write hook
Date: Fri, 4 May 2018 00:06:48 +0000
Message-ID: <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Miquel,=0A=
=0A=
On 03/05/18 22:00, Miquel Raynal wrote:=0A=
> One layout supported by the Marvell NAND controller supports NAND pages=
=0A=
> of 2048 bytes, all handled in one single chunk when using BCH with a=0A=
> strength of 4-bit per 512 bytes. In this case, instead of the generic=0A=
> XTYPE_WRITE_DISPATCH/XTYPE_LAST_NAKED_RW couple, the controller expects=
=0A=
> to receive XTYPE_MONOLITHIC_RW.=0A=
> =0A=
> This fixes problems at boot like:=0A=
> =0A=
> [    1.315475] Scanning device for bad blocks=0A=
> [    3.203108] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    3.209564] nand_bbt: error while writing BBT block -110=0A=
> [    4.243106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    5.283106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    5.289562] nand_bbt: error -110 while marking block 2047 bad=0A=
> [    6.323106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    6.329559] nand_bbt: error while writing BBT block -110=0A=
> [    7.363106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    8.403105] marvell-nfc f10d0000.flash: Timeout waiting for RB signal=
=0A=
> [    8.409559] nand_bbt: error -110 while marking block 2046 bad=0A=
> ...=0A=
> =0A=
> Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller dr=
iver")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>=0A=
=0A=
For the following combinations=0A=
=0A=
SoC             NAND                    Size     EB      Page OOB=0A=
---             ----                    ----     --      ---- ---=0A=
Armada-385      Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224=0A=
Armada-385      Micron MT29F2G08ABAEAWP 256 MiB  128 KiB 2048 64=0A=
Armada-385      Macronix MX30LF2G18AC   256 MiB  128 KiB 2048 64=0A=
Armada-98DX4251 AMD/Spansion S34ML08G2  1024 MiB 128 KiB 2048 128=0A=
Armada-98DX4251 Macronix MX60LF8G18AC   1024 MiB 128 KiB 2048 64=0A=
Armada-98DX4251 Micron MT29F8G08ABABAWP 1024 MiB 512 KiB 4096 224=0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
I do have one platform that passes the initial detection but starts to =0A=
report ubifs errors when mounted.=0A=
=0A=
Armada-98DX4251 Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224=0A=
=0A=
This is probably unrelated to this particular fix. It may be as simple =0A=
as something not catering for the Armada-98DX4251 SoC or a genuine =0A=
difference between Armada-98DX4251 and Armada-385. 4.16.4 with =0A=
pxa3xx_nand works with this combination.=0A=
=0A=
> ---=0A=
> =0A=
> Chris,=0A=
> =0A=
> Can you please give this patch a try? This is very likely to solve your=
=0A=
> boot issue.=0A=
> =0A=
> Thanks,=0A=
> Miqu=E8l=0A=
> =0A=
>   drivers/mtd/nand/raw/marvell_nand.c | 8 +++++++-=0A=
>   1 file changed, 7 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c=0A=
> index e4b964fd40d8..db5ec4e8bde9 100644=0A=
> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
> @@ -1408,6 +1408,7 @@ marvell_nfc_hw_ecc_bch_write_chunk(struct nand_chip=
 *chip, int chunk,=0A=
>   	struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);=0A=
>   	struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);=0A=
>   	const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)->layo=
ut;=0A=
> +	u32 xtype;=0A=
>   	int ret;=0A=
>   	struct marvell_nfc_op nfc_op =3D {=0A=
>   		.ndcb[0] =3D NDCB0_CMD_TYPE(TYPE_WRITE) | NDCB0_LEN_OVRD,=0A=
> @@ -1423,7 +1424,12 @@ marvell_nfc_hw_ecc_bch_write_chunk(struct nand_chi=
p *chip, int chunk,=0A=
>   	 * last naked write.=0A=
>   	 */=0A=
>   	if (chunk =3D=3D 0) {=0A=
> -		nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_WRITE_DISPATCH) |=0A=
> +		if (lt->nchunks =3D=3D 1)=0A=
> +			xtype =3D XTYPE_MONOLITHIC_RW;=0A=
> +		else=0A=
> +			xtype =3D XTYPE_WRITE_DISPATCH;=0A=
> +=0A=
> +		nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(xtype) |=0A=
>   				  NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |=0A=
>   				  NDCB0_CMD1(NAND_CMD_SEQIN);=0A=
>   		nfc_op.ndcb[1] |=3D NDCB1_ADDRS_PAGE(page);=0A=
> =0A=
=0A=
