Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXsId-0004PO-Tf
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 18:02:46 +0000
Date: Tue, 26 Jun 2018 20:02:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v4 14/15] mtd: rawnand: qcom: erased page bitflips
 detection
Message-ID: <20180626200229.7f638f7e@xps13>
In-Reply-To: <1529479662-4026-15-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
 <1529479662-4026-15-git-send-email-absahu@codeaurora.org>
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

On Wed, 20 Jun 2018 12:57:41 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> NAND parts can have bitflips in an erased page due to the
> process technology used. In this case, QCOM NAND controller
> is not able to identify that page as an erased page.
> Currently the driver calls nand_check_erased_ecc_chunk() for
> identifying the erased pages but this won=E2=80=99t work always since the
> checking is being with ECC engine returned data. In case of
> bitflips, the ECC engine tries to correct the data and then it
> generates the uncorrectable error. Now, this data is not equal to
> original raw data. For erased CW identification, the raw data
> should be read again from NAND device and this
> nand_check_erased_ecc_chunk function() should be called for raw
> data only.
>=20
> Now following logic is being added to identify the erased
> codeword bitflips.
>=20
> 1. In most of the cases, not all the codewords will have bitflips
>    and only single CW will have bitflips. So, there is no need to
>    read the complete raw page data. The NAND raw read can be
>    scheduled for any CW in page. The NAND controller works on CW
>    basis and it will update the status register after each CW read.
>    Maintain the bitmask for the CW which generated the uncorrectable
>    error.
> 2. Do raw read for all the CW's which generated the uncorrectable
>    error.
> 3. Both DATA and OOB need to be checked for number of 0. The
>    top-level API can be called with only data buf or OOB buf so use
>    chip->databuf if data buf is null and chip->oob_poi if
>    OOB buf is null for copying the raw bytes temporarily.
> 4. For each CW, check the number of 0 in cw_data and usable
>    oob bytes, The bbm and spare (unused) bytes bit flip won=E2=80=99t
>    affect the ECC so don=E2=80=99t check the number of bitflips in this a=
rea.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v3:
>=20
>  1. Major changes in erased codeword detection for
>     raw read function

I really prefer this version, much more readable from my point of view!

>=20
> * Changes from v2:
>   NONE
>=20
> * Changes from v1:
>  1. Minor change in commit message
>  2. invalidate pagebuf if databuf or oob_poi is used
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 127 +++++++++++++++++++++++++++-----=
------
>  1 file changed, 90 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 160acdf..e34edf1 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1656,20 +1656,95 @@ static int check_flash_errors(struct qcom_nand_ho=
st *host, int cw_cnt)
>  }
> =20
>  /*
> + * Bitflips can happen in erased codewords also so this function counts =
the
> + * number of 0 in each CW for which ECC engine returns the uncorrectable
> + * error. The page will be assumed as erased if this count is less than =
or
> + * equal to the ecc->strength for each CW.
> + *
> + * 1. Both DATA and OOB need to be checked for number of 0. The
> + *    top-level API can be called with only data buf or OOB buf so use
> + *    chip->data_buf if data buf is null and chip->oob_poi if oob buf
> + *    is null for copying the raw bytes.
> + * 2. Perform raw read for all the CW which has uncorrectable errors.
> + * 3. For each CW, check the number of 0 in cw_data and usable OOB bytes.
> + *    The BBM and spare bytes bit flip won=E2=80=99t affect the ECC so d=
on=E2=80=99t check
> + *    the number of bitflips in this area.
> + */
> +static int
> +check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
> +		      u8 *oob_buf, unsigned long uncorrectable_cws,
> +		      int page, unsigned int max_bitflips)
> +{
> +	struct nand_chip *chip =3D &host->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> +	int cw, data_size, oob_size, ret =3D 0;
> +
> +	if (!data_buf) {
> +		data_buf =3D chip->data_buf;
> +		chip->pagebuf =3D -1;
> +	}
> +
> +	if (!oob_buf) {
> +		oob_buf =3D chip->oob_poi;
> +		chip->pagebuf =3D -1;
> +	}
> +
> +	for (cw =3D 0; cw < ecc->steps && uncorrectable_cws; cw++) {

Last nitpick:

Could you have a look to bitmap.c and bitops.h and use a
for_each_set_bit() loop?

No need to resend all the patches, you can send a v5 just for this
patch, the others are fine for me.

Thanks,
Miqu=C3=A8l
