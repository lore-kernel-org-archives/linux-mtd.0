Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTXQC-00088C-Jn
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 08:43:38 +0000
Received: by qyk6 with SMTP id 6so31178qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 01:43:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090722.002013.165864270.anemo@mba.ocn.ne.jp>
References: <20090720.001426.102579925.anemo@mba.ocn.ne.jp>
	<bc64b4640907190908m209572e8od16ac648f19503e@mail.gmail.com>
	<ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
	<20090722.002013.165864270.anemo@mba.ocn.ne.jp>
Date: Wed, 22 Jul 2009 14:13:30 +0530
Message-ID: <ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: vimal singh <vimal.newwork@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2009 at 8:50 PM, Atsushi Nemoto<anemo@mba.ocn.ne.jp> wrote:
> On Mon, 20 Jul 2009 10:45:20 +0530, vimal singh <vimal.newwork@gmail.com>=
 wrote:
>> Seems like this driver may be reading 512 bytes at a times, but still
>> calculates 256-byte sector ECC. (1-bit error correction for each 256
>> bytes of data).
>> In that case, nand_correct_data() should be called twice, once for
>> each 256 byte data.
>
> But unfortunately nand_correct_data() cannot be used as is because it
> depends on chip->ecc.size (which is 512 for tmio_nand driver).
>
>> This can be handled by overriding 'chip->ecc.correct' in driver. You
>> may reuse 'nand_correct_data()' code in the driver of 256 byte sector
>> ECC.
>
> Yes, the driver can reuse nand_ecc code to implement its own
> nand_correct rountine.
>
> Or how about adding support for 6byte-ecc/512byte-data to nand_ecc.c
> to avoid code duplication?
>
> I mean something like this. =A0If it looks acceptable, I will prepare a
> patch including similer change to nand_calculate_ecc.

I personally do not like any HW specific implementation going into the
generic part
of the code. This particular issue is specific to your HW, so better
handle it in the
driver only.


>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index c0cb87d..77e13c8 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -425,14 +425,12 @@ EXPORT_SYMBOL(nand_calculate_ecc);
> =A0*
> =A0* Detect and correct a 1 bit error for 256/512 byte block
> =A0*/
> -int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *read_ecc, unsign=
ed char *calc_ecc)
> +static int nand_correct_data_sub(unsigned char *buf,
> + =A0 =A0 =A0 unsigned char *read_ecc, unsigned char *calc_ecc,
> + =A0 =A0 =A0 const uint32_t eccsize_mult)
> =A0{
> =A0 =A0 =A0 =A0unsigned char b0, b1, b2, bit_addr;
> =A0 =A0 =A0 =A0unsigned int byte_addr;
> - =A0 =A0 =A0 /* 256 or 512 bytes/ecc =A0*/
> - =A0 =A0 =A0 const uint32_t eccsize_mult =3D
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((struct nand_chip *)mtd->=
priv)->ecc.size) >> 8;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * b0 to b2 indicate which bit is faulty (if any)
> @@ -495,6 +493,26 @@ int nand_correct_data(struct mtd_info *mtd, unsigned=
 char *buf,
> =A0 =A0 =A0 =A0printk(KERN_ERR "uncorrectable error : ");
> =A0 =A0 =A0 =A0return -1;
> =A0}
> +int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *read_ecc, unsign=
ed char *calc_ecc)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> + =A0 =A0 =A0 /* 256 or 512 bytes/ecc =A0*/
> + =A0 =A0 =A0 const uint32_t eccsize_mult =3D (chip->ecc.size) >> 8;
> + =A0 =A0 =A0 int r0, r1;
> +
> + =A0 =A0 =A0 if (eccsize_mult =3D=3D 2 && chip->ecc.bytes =3D=3D 6) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r0 =3D nand_correct_data_sub(buf, read_ecc,=
 calc_ecc, 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r0 < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return r0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r1 =3D nand_correct_data_sub(buf + 256,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0read_ecc + 3, calc_ecc + 3, 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r1 < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return r1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return r0 | r1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return nand_correct_data_sub(buf, read_ecc, calc_ecc, eccsi=
ze_mult);
> +}
> =A0EXPORT_SYMBOL(nand_correct_data);
>
> =A0MODULE_LICENSE("GPL");
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
