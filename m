Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0t21-0003tX-91
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 08:28:30 +0000
Received: by fxm28 with SMTP id 28so9167272fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Oct 2009 01:28:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256198013-10003-1-git-send-email-akinobu.mita@gmail.com>
References: <1256198013-10003-1-git-send-email-akinobu.mita@gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 22 Oct 2009 13:57:59 +0530
Message-ID: <ce9ab5790910220127g5f2efc95l6a5a8e4cb9888cce@mail.gmail.com>
Subject: Re: [PATCH -v4 1/2] MTD: Add __nand_calculate_ecc() to NAND ECC
	functions
To: Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please add my ack:
Acked-by: Vimal Singh <vimalsingh@ti.com>

-vimal

On Thu, Oct 22, 2009 at 1:23 PM, Akinobu Mita <akinobu.mita@gmail.com> wrot=
e:
> Add __nand_calculate_ecc() which does not take struct mtd_info.
> The built-in 256/512 software ECC calculation and correction tester
> will use it.
>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: vimal singh <vimal.newwork@gmail.com>
> ---
> =A0drivers/mtd/nand/nand_ecc.c =A0| =A0 25 ++++++++++++++++++++-----
> =A0include/linux/mtd/nand_ecc.h | =A0 10 ++++++++--
> =A02 files changed, 28 insertions(+), 7 deletions(-)
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
> index 052ea8c..41bc013 100644
> --- a/include/linux/mtd/nand_ecc.h
> +++ b/include/linux/mtd/nand_ecc.h
> @@ -16,7 +16,13 @@
> =A0struct mtd_info;
>
> =A0/*
> - * Calculate 3 byte ECC code for 256 byte block
> + * Calculate 3 byte ECC code for eccsize byte block
> + */
> +void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u_char *ecc=
_code);
> +
> +/*
> + * Calculate 3 byte ECC code for 256/512 byte block
> =A0*/
> =A0int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char=
 *ecc_code);
>
> @@ -27,7 +33,7 @@ int __nand_correct_data(u_char *dat, u_char *read_ecc, =
u_char *calc_ecc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int eccsize);
>
> =A0/*
> - * Detect and correct a 1 bit error for 256 byte block
> + * Detect and correct a 1 bit error for 256/512 byte block
> =A0*/
> =A0int nand_correct_data(struct mtd_info *mtd, u_char *dat, u_char *read_=
ecc, u_char *calc_ecc);
>
> --
> 1.5.4.3
>
>
