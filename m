Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL61l-0007k0-Ub
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 12:04:37 +0000
Date: Tue, 22 May 2018 14:04:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 10/14] mtd: rawnand: qcom: fix return value for raw
 page read
Message-ID: <20180522140416.252fb398@xps13>
In-Reply-To: <1525350041-22995-11-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-11-git-send-email-absahu@codeaurora.org>
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

On Thu,  3 May 2018 17:50:37 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Currently zero is being returned for all raw page read so
> fix the same.

What about "Fix value returned by ->read_page_raw() to be the
actual operation status, instead of always 0."?

>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v1:
>=20
>  NEW CHANGE
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index f85d8ab..17b7f3af 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1900,7 +1900,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info=
 *mtd,
> =20
>  	free_descs(nandc);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  /* implements ecc->read_oob() */

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
