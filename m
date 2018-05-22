Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL486-0007W4-HG
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 10:02:56 +0000
Date: Tue, 22 May 2018 12:02:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 09/14] mtd: rawnand: qcom: modify write_oob to remove
 read codeword part
Message-ID: <20180522120231.5dd32f8b@xps13>
In-Reply-To: <1525350041-22995-10-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-10-git-send-email-absahu@codeaurora.org>
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

Some nitpicking below.

On Thu,  3 May 2018 17:50:36 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> QCOM NAND layout protect available OOB data bytes with ECC also so

           ^controller

> when ecc->write_oob (qcom_nandc_write_oob) is being called then it

You can just state "->write_oob()"

> can't update just OOB bytes. Currently, it first reads the last
> codeword which includes old OOB bytes. Then it updates the old OOB
> bytes with new one and then again writes the codeword back.

                 ones?

> The reading codeword is unnecessary since all the other bytes
> should be 0xff only.

                                      since the user is responsible to
have these bytes cleared to 0xFF.

>=20
> This patch removes the read part and updates the oob bytes with

s/oob/OOB/

> all other data bytes as 0xff.

The end of the sentence is not clear for me. Do you mean that padding
with 0xFF is realized before write?

>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v1:
>=20
>  NEW CHANGE
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 61d0e7d..f85d8ab 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2067,10 +2067,9 @@ static int qcom_nandc_write_page_raw(struct mtd_in=
fo *mtd,
>   * implements ecc->write_oob()
>   *
>   * the NAND controller cannot write only data or only oob within a codew=
ord,

s/oob/OOB/

Remove the trailing ','

> - * since ecc is calculated for the combined codeword. we first copy the
> - * entire contents for the last codeword(data + oob), replace the old oob
> - * with the new one in chip->oob_poi, and then write the entire codeword.
> - * this read-copy-write operation results in a slight performance loss.
> + * since ecc is calculated for the combined codeword. So make all the da=
ta

s/ecc/ECC/

> + * bytes as 0xff and update the oob from chip->oob_poi, and then write
> + * the entire codeword again.

What about "Pad the data area with OxFF before writing."?

>   */
>  static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *=
chip,
>  				int page)
> @@ -2082,20 +2081,14 @@ static int qcom_nandc_write_oob(struct mtd_info *=
mtd, struct nand_chip *chip,
>  	int data_size, oob_size;
>  	int ret;
> =20
> -	host->use_ecc =3D true;
> -
> -	clear_bam_transaction(nandc);
> -	ret =3D copy_last_cw(host, page);
> -	if (ret)
> -		return ret;
> -
> -	clear_read_regs(nandc);
>  	clear_bam_transaction(nandc);
> =20
>  	/* calculate the data and oob size for the last codeword/step */
>  	data_size =3D ecc->size - ((ecc->steps - 1) << 2);
>  	oob_size =3D mtd->oobavail;
> +	host->use_ecc =3D true;

You don't need to move this line here, do you?

> =20
> +	memset(nandc->data_buffer, 0xff, host->cw_data);
>  	/* override new oob content to last codeword */
>  	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
>  				    0, mtd->oobavail);


Once fixed, you can add my:

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
