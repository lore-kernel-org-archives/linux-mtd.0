Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SBRaO-0004Ub-3t
 for linux-mtd@lists.infradead.org; Sat, 24 Mar 2012 14:04:53 +0000
Received: by lbol5 with SMTP id l5so3682810lbo.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Mar 2012 07:04:47 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.gortmaker@gmail.com
In-Reply-To: <20120324103830.GA17632@Fedora16>
References: <20120324103830.GA17632@Fedora16>
Date: Sat, 24 Mar 2012 10:04:47 -0400
Message-ID: <CAP=VYLqL_cKj_d8fT1Q1V=Da+2EY8uBhCKkd2f67VvRZuvT_tQ@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand/nand_ecc.c: replace bitsperbyte table by a
 simple operation
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Zhaoxiu Zeng <zengzhaoxiu@163.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 24, 2012 at 6:38 AM, Zhaoxiu Zeng <zengzhaoxiu@163.com> wrote:
>
> Signed-off-by: Zhaoxiu Zeng <zengzhaoxiu@163.com>

In two different instances, the code you delete says that using
the lookup table is a performance win, yet you don't write a commit
log saying anything about this (or the rest of the changes) at all?

Paul.
--

>
> ---
> =A0drivers/mtd/nand/nand_ecc.c | =A0 50 +++++++++------------------------=
---------
> =A01 files changed, 11 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index b7cfe0d..e05a0fd 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -85,30 +85,6 @@ static const char invparity[256] =3D {
> =A0};
>
> =A0/*
> - * bitsperbyte contains the number of bits per byte
> - * this is only used for testing and repairing parity
> - * (a precalculated value slightly improves performance)
> - */
> -static const char bitsperbyte[256] =3D {
> - =A0 =A0 =A0 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
> - =A0 =A0 =A0 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
> - =A0 =A0 =A0 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
> - =A0 =A0 =A0 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
> - =A0 =A0 =A0 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
> - =A0 =A0 =A0 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
> - =A0 =A0 =A0 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
> - =A0 =A0 =A0 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8,
> -};
> -
> -/*
> =A0* addressbits is a lookup table to filter out the bits from the xor-ed
> =A0* ECC data that identify the faulty location.
> =A0* this is only used for repairing parity
> @@ -448,12 +424,14 @@ int __nand_correct_data(unsigned char *buf,
> =A0 =A0 =A0 =A0unsigned int byte_addr;
> =A0 =A0 =A0 =A0/* 256 or 512 bytes/ecc =A0*/
> =A0 =A0 =A0 =A0const uint32_t eccsize_mult =3D eccsize >> 8;
> + =A0 =A0 =A0 const uint32_t check_mask =3D eccsize_mult =3D=3D 2 ? 0x555=
555 : 0x545555;
> + =A0 =A0 =A0 uint32_t tmp;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * b0 to b2 indicate which bit is faulty (if any)
> =A0 =A0 =A0 =A0 * we might need the xor result =A0more than once,
> =A0 =A0 =A0 =A0 * so keep them in a local var
> - =A0 =A0 =A0 */
> + =A0 =A0 =A0 =A0*/
> =A0#ifdef CONFIG_MTD_NAND_ECC_SMC
> =A0 =A0 =A0 =A0b0 =3D read_ecc[0] ^ calc_ecc[0];
> =A0 =A0 =A0 =A0b1 =3D read_ecc[1] ^ calc_ecc[1];
> @@ -467,14 +445,11 @@ int __nand_correct_data(unsigned char *buf,
>
> =A0 =A0 =A0 =A0/* repeated if statements are slightly more efficient than=
 switch ... */
> =A0 =A0 =A0 =A0/* ordered in order of likelihood */
> -
> - =A0 =A0 =A0 if ((b0 | b1 | b2) =3D=3D 0)
> + =A0 =A0 =A0 tmp =3D ((uint32_t)b2 << 16) | ((uint32_t)b1 << 8) | b0;
> + =A0 =A0 =A0 if (tmp =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0; =A0 =A0 =A0 /* no error */
>
> - =A0 =A0 =A0 if ((((b0 ^ (b0 >> 1)) & 0x55) =3D=3D 0x55) &&
> - =A0 =A0 =A0 =A0 =A0 (((b1 ^ (b1 >> 1)) & 0x55) =3D=3D 0x55) &&
> - =A0 =A0 =A0 =A0 =A0 ((eccsize_mult =3D=3D 1 && ((b2 ^ (b2 >> 1)) & 0x54=
) =3D=3D 0x54) ||
> - =A0 =A0 =A0 =A0 =A0 =A0(eccsize_mult =3D=3D 2 && ((b2 ^ (b2 >> 1)) & 0x=
55) =3D=3D 0x55))) {
> + =A0 =A0 =A0 if (((tmp ^ (tmp >> 1)) & check_mask) =3D=3D check_mask) {
> =A0 =A0 =A0 =A0/* single bit error */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * rp17/rp15/13/11/9/7/5/3/1 indicate whic=
h byte is the faulty
> @@ -492,19 +467,16 @@ int __nand_correct_data(unsigned char *buf,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * We could also do addressbits[b2] >> 1 b=
ut for the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * performance it does not make any differ=
ence
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (eccsize_mult =3D=3D 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte_addr =3D (addressbits[=
b1] << 4) + addressbits[b0];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte_addr =3D (addressbits[=
b2 & 0x3] << 8) +
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (ad=
dressbits[b1] << 4) + addressbits[b0];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte_addr =3D (addressbits[b1] << 4) + addr=
essbits[b0];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (eccsize_mult =3D=3D 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte_addr +=3D (addressbits=
[b2 & 0x3] << 8);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bit_addr =3D addressbits[b2 >> 2];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* flip the bit */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf[byte_addr] ^=3D (1 << bit_addr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> -
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 /* count nr of bits; use table lookup, faster than calculat=
ing it */
> - =A0 =A0 =A0 if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) =
=3D=3D 1)
> +
> + =A0 =A0 =A0 if (!(tmp & (tmp - 1)))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1; =A0 =A0 =A0 /* error in ECC data=
; no action needed */
>
> =A0 =A0 =A0 =A0printk(KERN_ERR "uncorrectable error : ");
> --
> 1.7.7.6
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
