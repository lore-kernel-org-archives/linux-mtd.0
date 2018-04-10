Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5pKy-0002qO-Jt
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 09:13:21 +0000
Date: Tue, 10 Apr 2018 11:12:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 4/9] mtd: nand: qcom: fix null pointer access for erased
 buffer detection
Message-ID: <20180410111220.3873a24c@xps13>
In-Reply-To: <1522845745-6624-5-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-5-git-send-email-absahu@codeaurora.org>
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

On Wed,  4 Apr 2018 18:12:20 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> parse_read_errors can be called with only oob buf also in which
> case data_buf will be NULL.  If data_buf is NULL, then don=E2=80=99t
> treat this page as completely erased in case of ECC uncorrectable
> error.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 57c16a6..0ebcc55 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1607,9 +1607,11 @@ static int parse_read_errors(struct qcom_nand_host=
 *host, u8 *data_buf,
>  			if (host->bch_enabled) {
>  				erased =3D (erased_cw & ERASED_CW) =3D=3D ERASED_CW ?
>  					 true : false;

Why the parse_read_errors() function could not be called without
data_buf when using BCH? Are you sure the situation can only happen
without it?

Would the following apply here too, with a:

if (!data_buf) {
        erased =3D false;
} else {
        if (host->bch_enabled)
                ...
        else
                ...
}

> -			} else {
> +			} else if (data_buf) {
>  				erased =3D erased_chunk_check_and_fixup(data_buf,
>  								      data_len);
> +			} else {
> +				erased =3D false;
>  			}
> =20
>  			if (erased) {
> @@ -1652,7 +1654,8 @@ static int parse_read_errors(struct qcom_nand_host =
*host, u8 *data_buf,
>  			max_bitflips =3D max(max_bitflips, stat);
>  		}
> =20
> -		data_buf +=3D data_len;
> +		if (data_buf)
> +			data_buf +=3D data_len;
>  		if (oob_buf)
>  			oob_buf +=3D oob_len + ecc->bytes;
>  	}

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
