Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SBVvc-00017A-GW
 for linux-mtd@lists.infradead.org; Sat, 24 Mar 2012 18:43:05 +0000
Received: by vcbf13 with SMTP id f13so4846218vcb.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Mar 2012 11:43:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120324103830.GA17632@Fedora16>
References: <20120324103830.GA17632@Fedora16>
Date: Sat, 24 Mar 2012 19:43:02 +0100
Message-ID: <CACW_hTYnXs8iuYPNYsk1RgbhvLsAW+Tx_Hb_pSTjh84dQ63bGg@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand/nand_ecc.c: replace bitsperbyte table by a
 simple operation
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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

Dear Zhaoxiu

Thanks for contributing this patch.
However, I think it has some issues and should not be applied. See my
remarks below

2012/3/24 Zhaoxiu Zeng <zengzhaoxiu@163.com>:
>
> Signed-off-by: Zhaoxiu Zeng <zengzhaoxiu@163.com>
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

Not sure how efficient this is; on some systems shifting by N takes N
clock cycles so this could be relatively expensive.
(and the systems where it takes more clock cycles have a higher chance
on not having hw crc correction).

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

Have you benchmarked this?

And while it might be an optimisation, it is not mentioned in the
commit message.

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

I'm not sure if this is a win. It *looks* like an optimisation since
you factor out some common code. Then again within the if you need to
add to byte_addr.
For a naive compiler this is probably more expensive. For a good
compiler this probably makes no difference at all.

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

This is not the same as the code you replace!!!

take as example b0 =3D 1; b1 =3D0, b2 =3D 0;
The original if statement will return true:
bitsperbyte[b0] in that case is 1
bitsperbyte[b1] =3D 0
bitsperbyte[b2] =3D 0
so (bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) equals 1 and
((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) =3D=3D 1)  yields 1 =
so true

However if I take your code
tmp =3D  ((uint32_t)b2 << 16) | ((uint32_t)b1 << 8) | b0;
taking the example values from above this results in tmp being 1;
tmp & (tmp - 1)  becomes 1 & 0 which effectively results in 0.

So in my original code  b0 =3D 1; b1 =3D0, b2 =3D 0; results in 1 being
returned whereas your code will result in a log entry "incorrectable
error" and a return of -1.

Given this, I'd say this patch is to be rejected.

BTW: optimisations in this part of code are not too important. This is
only called when ecc errors are to be corrected and that is not very
likely.
So perhaps it is not worth the time to improve it.
(and yes, it might be possible to save some bytes by eliminating the
array; then again the code and logic is not really trivial so good
testing is needed)

See also Documentation/mtd/nand_ecc.txt
near the end there is a small section on correcting.


> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1; =A0 =A0 =A0 /* error in ECC data=
; no action needed */
>
> =A0 =A0 =A0 =A0printk(KERN_ERR "uncorrectable error : ");
> --
> 1.7.7.6
>
>

Best regards, Frans.
