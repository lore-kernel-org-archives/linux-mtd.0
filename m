Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5p8J-00038v-JI
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 09:00:13 +0000
Date: Tue, 10 Apr 2018 10:59:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/9] mtd: nand: qcom: erased page detection for
 uncorrectable errors only
Message-ID: <20180410105945.65f2cade@xps13>
In-Reply-To: <1522845745-6624-4-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-4-git-send-email-absahu@codeaurora.org>
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

Hi Abhishek,

On Wed,  4 Apr 2018 18:12:19 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> The NAND flash controller generates ECC uncorrectable error
> first in case of completely erased page. Currently driver
> applies the erased page detection logic for other operation
> errors also so fix this and return EIO for other operational
> errors.

I am sorry I don't understand very well what is the purpose of this
patch, could you please explain it again?

Do you mean that you want to avoid having rising ECC errors when you
read erased pages?

>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 17321fc..57c16a6 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1578,6 +1578,7 @@ static int parse_read_errors(struct qcom_nand_host =
*host, u8 *data_buf,
>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>  	unsigned int max_bitflips =3D 0;
>  	struct read_stats *buf;
> +	bool flash_op_err =3D false;
>  	int i;
> =20
>  	buf =3D (struct read_stats *)nandc->reg_read_buf;
> @@ -1599,7 +1600,7 @@ static int parse_read_errors(struct qcom_nand_host =
*host, u8 *data_buf,
>  		buffer =3D le32_to_cpu(buf->buffer);
>  		erased_cw =3D le32_to_cpu(buf->erased_cw);
> =20
> -		if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
> +		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {

And later you have another "if (buffer & BS_UNCORRECTABLE_BIT)" which
is then redundant, unless that is not what you actually want to do?

Maybe you can add comments before the if ()/ else if () to explain in
which case you enter each branch.

>  			bool erased;
> =20
>  			/* ignore erased codeword errors */
> @@ -1641,6 +1642,8 @@ static int parse_read_errors(struct qcom_nand_host =
*host, u8 *data_buf,
>  						max_t(unsigned int, max_bitflips, ret);
>  				}
>  			}
> +		} else if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
> +			flash_op_err =3D true;
>  		} else {
>  			unsigned int stat;
> =20
> @@ -1654,6 +1657,9 @@ static int parse_read_errors(struct qcom_nand_host =
*host, u8 *data_buf,
>  			oob_buf +=3D oob_len + ecc->bytes;
>  	}
> =20
> +	if (flash_op_err)
> +		return -EIO;
> +

In you are propagating an error related to the controller, this is
fine, but I think you just want to raise the fact that a NAND
uncorrectable error occurred, in this case you should just increment
mtd->ecc_stats.failed and return 0 (returning max_bitflips here would be
fine too has it would be 0 too).

>  	return max_bitflips;
>  }
> =20

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
