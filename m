Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0EIG-000866-Cm
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 12:58:32 +0000
Received: by fxm28 with SMTP id 28so6584387fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Oct 2009 05:58:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
References: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
From: vimal singh <vimal.newwork@gmail.com>
Date: Tue, 20 Oct 2009 18:28:04 +0530
Message-ID: <ce9ab5790910200558p66774457w791eba985c293429@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: Add __nand_calculate_ecc() to NAND ECC functions
To: Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 19, 2009 at 11:41 AM, Akinobu Mita <akinobu.mita@gmail.com> wro=
te:
> Add __nand_calculate_ecc() which does not take struct mtd_info.
> The built-in 256/512 software ECC calculation and correction tester
> will use it.
>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> =A0drivers/mtd/nand/nand_ecc.c =A0| =A0 25 ++++++++++++++++++++-----
> =A0include/linux/mtd/nand_ecc.h | =A0 =A06 ++++++
> =A02 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index db7ae9d..809fb53 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -150,20 +150,19 @@ static const char addressbits[256] =3D {
> =A0};
>
> =A0/**
> - * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/51=
2-byte
> + * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/=
512-byte
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0block
> - * @mtd: =A0 =A0 =A0 MTD block structure
> =A0* @buf: =A0 =A0 =A0 input buffer with raw data
> + * @eccsize: =A0 data bytes per ecc step (256 or 512)
> =A0* @code: =A0 =A0 =A0output buffer with ECC
> =A0*/
> -int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
> +void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *code)
> =A0{
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0const uint32_t *bp =3D (uint32_t *)buf;
> =A0 =A0 =A0 =A0/* 256 or 512 bytes/ecc =A0*/
> - =A0 =A0 =A0 const uint32_t eccsize_mult =3D
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((struct nand_chip *)mtd->=
priv)->ecc.size) >> 8;
> + =A0 =A0 =A0 const uint32_t eccsize_mult =3D eccsize >> 8;
> =A0 =A0 =A0 =A0uint32_t cur; =A0 =A0 =A0 =A0 =A0 /* current value in buff=
er */
> =A0 =A0 =A0 =A0/* rp0..rp15..rp17 are the various accumulated parities (p=
er byte) */
> =A0 =A0 =A0 =A0uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
> @@ -412,6 +411,22 @@ int nand_calculate_ecc(struct mtd_info *mtd, const u=
nsigned char *buf,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(invparity[par & 0x55] << 2) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(invparity[rp17] << 1) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(invparity[rp16] << 0);
> +}
> +EXPORT_SYMBOL(__nand_calculate_ecc);
> +
> +/**
> + * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/51=
2-byte
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0block
> + * @mtd: =A0 =A0 =A0 MTD block structure
> + * @buf: =A0 =A0 =A0 input buffer with raw data
> + * @code: =A0 =A0 =A0output buffer with ECC
> + */
> +int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned char *code)
> +{
> + =A0 =A0 =A0 __nand_calculate_ecc(buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((struct nand_chip *)mtd->p=
riv)->ecc.size, code);
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
> =A0EXPORT_SYMBOL(nand_calculate_ecc);
> diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
> index 052ea8c..9cb10ff 100644
> --- a/include/linux/mtd/nand_ecc.h
> +++ b/include/linux/mtd/nand_ecc.h
> @@ -16,6 +16,12 @@
> =A0struct mtd_info;
>
> =A0/*
> + * Calculate 3 byte ECC code for eccsize byte block
> + */
> +void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u_char *ecc=
_code);
> +
> +/*
> =A0* Calculate 3 byte ECC code for 256 byte block
> =A0*/
Could you please correct above comment too?

--=20
Regards,
Vimal Singh


> =A0int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char=
 *ecc_code);
> --
> 1.5.4.3
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
