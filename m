Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6W3s-0005S2-94
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2018 06:50:36 +0000
Date: Thu, 12 Apr 2018 08:49:19 +0200
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
Message-ID: <20180412084919.1ca7991d@xps13>
In-Reply-To: <2c93157a2982365ceaa8af17d5e3b97a@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-4-git-send-email-absahu@codeaurora.org>
 <20180410105945.65f2cade@xps13>
 <2c93157a2982365ceaa8af17d5e3b97a@codeaurora.org>
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

On Thu, 12 Apr 2018 12:03:58 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-10 14:29, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Wed,  4 Apr 2018 18:12:19 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> The NAND flash controller generates ECC uncorrectable error =20
> >> first in case of completely erased page. Currently driver
> >> applies the erased page detection logic for other operation
> >> errors also so fix this and return EIO for other operational
> >> errors.
> > > I am sorry I don't understand very well what is the purpose of this =
=20
> > patch, could you please explain it again? =20
> > > Do you mean that you want to avoid having rising ECC errors when you =
=20
> > read erased pages?
> >   Thanks Miquel for your review. =20
>=20
>   QCOM NAND flash controller has in built erased page
>   detection HW.
>   Following is the flow in the HW if controller tries
>   to read erased page
>=20
>   1. First ECC uncorrectable error will be generated from
>      ECC engine since ECC engine first calculates the ECC with
>      all 0xff and match the calculated ECC with ECC code in OOB
>      (which is again all 0xff).
>   2. After getting ECC error, erased CW detection HW checks if
>      all the bytes in page are 0xff and then it updates the
>      status in separate register NAND_ERASED_CW_DETECT_STATUS
>=20
>   So the erased CW detect status should be checked only if
>   ECC engine generated the uncorrectable error.
>=20
>   Currently for all other operational errors also (like TIMEOUT,
>   MPU errors etc), the erased CW detect register was being
>   checked.

This is very clear, thanks. I don't know very much this controller so I
think you can add this information in the commit message for future
reference.

>=20
> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org> =20
> >> ---
> >>  drivers/mtd/nand/qcom_nandc.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-) =20
> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mtd/nand/qc=
om_nandc.c =20
> >> index 17321fc..57c16a6 100644
> >> --- a/drivers/mtd/nand/qcom_nandc.c
> >> +++ b/drivers/mtd/nand/qcom_nandc.c
> >> @@ -1578,6 +1578,7 @@ static int parse_read_errors(struct >> qcom_nand=
_host *host, u8 *data_buf,
> >>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> >>  	unsigned int max_bitflips =3D 0;
> >>  	struct read_stats *buf;
> >> +	bool flash_op_err =3D false;
> >>  	int i; =20
> >> >>  	buf =3D (struct read_stats *)nandc->reg_read_buf; =20
> >> @@ -1599,7 +1600,7 @@ static int parse_read_errors(struct >> qcom_nand=
_host *host, u8 *data_buf,
> >>  		buffer =3D le32_to_cpu(buf->buffer);
> >>  		erased_cw =3D le32_to_cpu(buf->erased_cw); =20
> >> >> -		if (flash & (FS_OP_ERR | FS_MPU_ERR)) { =20
> >> +		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {
> > > And later you have another "if (buffer & BS_UNCORRECTABLE_BIT)" which=
 =20
> > is then redundant, unless that is not what you actually want to do? =20
>=20
>   Yes. That check seems to be redundant. I will fix that.
>=20
> > > Maybe you can add comments before the if ()/ else if () to explain in=
 =20
> > which case you enter each branch. =20
>=20
>   Sure. That would be better. Will add the same in next patch set.
>=20
> > >>  			bool erased; =20
> >> >>  			/* ignore erased codeword errors */ =20
> >> @@ -1641,6 +1642,8 @@ static int parse_read_errors(struct >> qcom_nand=
_host *host, u8 *data_buf,
> >>  						max_t(unsigned int, max_bitflips, ret);
> >>  				}
> >>  			}
> >> +		} else if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
> >> +			flash_op_err =3D true;
> >>  		} else {
> >>  			unsigned int stat; =20
> >> >> @@ -1654,6 +1657,9 @@ static int parse_read_errors(struct >> qcom_n=
and_host *host, u8 *data_buf, =20
> >>  			oob_buf +=3D oob_len + ecc->bytes;
> >>  	} =20
> >> >> +	if (flash_op_err) =20
> >> +		return -EIO;
> >> +
> > > In you are propagating an error related to the controller, this is =20
> > fine, but I think you just want to raise the fact that a NAND
> > uncorrectable error occurred, in this case you should just increment
> > mtd->ecc_stats.failed and return 0 (returning max_bitflips here would >=
 be
> > fine too has it would be 0 too). =20
>=20
>    The flash_op_err will be for other operational errors only (like timeo=
ut,
>    MPU error, device failure etc). For correctable errors,
>=20
>    ret =3D nand_check_erased_ecc_chunk(data_buf,
>                            data_len, eccbuf, ecclen, oob_buf,
>                            extraooblen, ecc->strength);

Why do you need nand_check_erased_ecc_chunk() if the blank page check
is done in hw?

Thanks,
Miqu=C3=A8l

>                    if (ret < 0) {
>                            mtd->ecc_stats.failed++;
>                    } else {
>                            mtd->ecc_stats.corrected +=3D ret;
>=20
>   Already, it is incrementing mtd->ecc_stats.failed
>=20
>   Thanks,
>   Abhishek



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
