Received: from mail-dm3nam03on0603.outbound.protection.outlook.com
 ([2a01:111:f400:fe49::603]
 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNE34-0007qj-BZ
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 09:34:55 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, Michal Simek <michals@xilinx.com>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Thu, 15 Nov 2018 09:34:16 +0000
Message-ID: <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

Hi Boris & Miquel,

I am updating the driver by addressing your comments, and I have one concer=
n,  especially in anfc_read_page_hwecc(),=20
there I am checking for erased pages bit flips.
Since Arasan NAND controller doesn't have multibit error detection beyond 2=
4-bit( it can correct up to 24 bit),
i.e. there is no indication from controller to detect uncorrectable error b=
eyond 24bit.
So I took some error count as default value(MULTI_BIT_ERR_CNT  16, I put th=
is based on the error count that=20
I got while reading erased page on Micron device).
And during a page read, will just read the error count register and compare=
 this value with the default error count(16) and if it is more=20
Than default then I am checking for erased page bit flips.
I am doubting that this will not work in all cases.
In my case it is just working because the error count that it got on an era=
sed page is 16.
Could you please suggest a way to do detect erased_page bit flips when read=
ing a page with HW-ECC?.

> +
> +/*
> + * Arasan NAND controller can't detect errors beyond 24-bit in BCH
> + * For an erased page we observed that multibit error count as 16
> + * with 24-bit ECC. so if the count is equal to or greater than 16
> + * then we can say that its an uncorrectable ECC error.
> + */
> +#define MULTI_BIT_ERR_CNT 16
> +
>=20
> +}
> +
> +static int anfc_read_page_hwecc(struct nand_chip *chip, u8 *buf,
> +				int oob_required, int page)
> +{
> +	struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u8 *ecc_code =3D chip->ecc.code_buf;
> +	u8 *p;
> +	int eccsize =3D chip->ecc.size;
> +	int eccbytes =3D chip->ecc.bytes;
> +	int stat =3D 0, i;
> +	u32 ret;
> +	unsigned int max_bitflips =3D 0;
> +	u32 eccsteps =3D chip->ecc.steps;
> +	u32 one_bit_err =3D 0, multi_bit_err =3D 0;
> +
> +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT,
> NAND_CMD_RNDOUTSTART);
> +	anfc_config_ecc(nfc, true);
> +
> +	ret =3D nand_read_page_op(chip, page, 0, buf, mtd->writesize);
> +	if (ret)
> +		return ret;
> +
> +	anfc_config_ecc(nfc, false);
> +	if (achip->strength) {
> +		/*
> +		 * In BCH mode Arasan NAND controller can correct ECC upto
> +		 * 24-bit Beyond that, it can't even detect errors.
> +		 */
> +		multi_bit_err =3D readl(nfc->base + ECC_ERR_CNT_OFST);
> +		multi_bit_err =3D ((multi_bit_err & PAGE_ERR_CNT_MASK) >> 8);
> +	} else {
> +		/*
> +		 * In Hamming mode Arasan NAND controller can correct ECC upto
> +		 * 1-bit and can detect upto 2-bit errors.
> +		 */
> +		one_bit_err =3D readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		multi_bit_err =3D readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +		/* Clear ecc error count register 1Bit, 2Bit */
> +		writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +	}
> +
> +	if (oob_required)
> +		chip->ecc.read_oob(chip, page);
> +
> +	if (multi_bit_err >=3D MULTI_BIT_ERR_CNT) {
> +		if (!oob_required)
> +			chip->ecc.read_oob(chip, page);
> +
> +		mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
> +					   chip->ecc.total);
> +		p =3D buf;
> +		for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes,
> +		     p +=3D eccsize) {
> +			stat =3D nand_check_erased_ecc_chunk(p,
> +							   chip->ecc.size,
> +							   &ecc_code[i],
> +							   eccbytes,
> +							   NULL, 0,
> +							   chip->ecc.strength);
> +			if (stat < 0) {
> +				mtd->ecc_stats.failed++;
> +			} else {
> +				mtd->ecc_stats.corrected +=3D stat;
> +				max_bitflips =3D max_t(unsigned int, max_bitflips,
> +						     stat);
> +			}
> +		}
> +	}
> +
> +	return max_bitflips;
> +}
> +
> +

Thanks,
Naga Sureshkumar Relli.
