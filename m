Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5qA8-0004NZ-Eq
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 10:06:11 +0000
Date: Tue, 10 Apr 2018 12:05:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 6/9] mtd: nand: qcom: support for checking read errors
 for last codeword
Message-ID: <20180410120542.24ea9ddb@xps13>
In-Reply-To: <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
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

On Wed,  4 Apr 2018 18:12:22 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Add boolean function argument in parse_read_errors to identify
> whether the read error has been called for complete page read or
> only last codeword read. This will help in subsequent patches to
> detect ECC errors in case of last codeword read.

Can you explain when this happen: "last codeword read"? I don't see the
use case.

Thanks,
Miqu=C3=A8l

>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index ba43752..dce97e8 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1570,7 +1570,7 @@ struct read_stats {
>   * errors. this is equivalent to what 'ecc->correct()' would do.
>   */
>  static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
> -			     u8 *oob_buf)
> +			     u8 *oob_buf, bool last_cw)
>  {
>  	struct nand_chip *chip =3D &host->chip;
>  	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(chip);
> @@ -1579,12 +1579,12 @@ static int parse_read_errors(struct qcom_nand_hos=
t *host, u8 *data_buf,
>  	unsigned int max_bitflips =3D 0;
>  	struct read_stats *buf;
>  	bool flash_op_err =3D false;
> -	int i;
> +	int i, cw_cnt =3D last_cw ? 1 : ecc->steps;
> =20
>  	buf =3D (struct read_stats *)nandc->reg_read_buf;
>  	nandc_read_buffer_sync(nandc, true);
> =20
> -	for (i =3D 0; i < ecc->steps; i++, buf++) {
> +	for (i =3D 0; i < cw_cnt; i++, buf++) {
>  		u32 flash, buffer, erased_cw;
>  		int data_len, oob_len;
> =20
> @@ -1743,7 +1743,8 @@ static int read_page_ecc(struct qcom_nand_host *hos=
t, u8 *data_buf,
>  	free_descs(nandc);
> =20
>  	if (!ret)
> -		ret =3D parse_read_errors(host, data_buf_start, oob_buf_start);
> +		ret =3D parse_read_errors(host, data_buf_start, oob_buf_start,
> +					false);
> =20
>  	return ret;
>  }



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
