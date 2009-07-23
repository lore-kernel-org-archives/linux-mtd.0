Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTsM8-0000ya-Li
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 07:04:49 +0000
Received: by qyk6 with SMTP id 6so1024179qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jul 2009 00:04:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090723.001338.27942898.anemo@mba.ocn.ne.jp>
References: <ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
	<20090722.002013.165864270.anemo@mba.ocn.ne.jp>
	<ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
	<20090723.001338.27942898.anemo@mba.ocn.ne.jp>
Date: Thu, 23 Jul 2009 12:34:43 +0530
Message-ID: <ce9ab5790907230004g103af356s1b44cda2d64bbc55@mail.gmail.com>
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

On Wed, Jul 22, 2009 at 8:43 PM, Atsushi Nemoto<anemo@mba.ocn.ne.jp> wrote:
> On Wed, 22 Jul 2009 14:13:30 +0530, vimal singh <vimal.newwork@gmail.com>=
 wrote:
>> >> This can be handled by overriding 'chip->ecc.correct' in driver. You
>> >> may reuse 'nand_correct_data()' code in the driver of 256 byte sector
>> >> ECC.
>> >
>> > Yes, the driver can reuse nand_ecc code to implement its own
>> > nand_correct rountine.
>> >
>> > Or how about adding support for 6byte-ecc/512byte-data to nand_ecc.c
>> > to avoid code duplication?
>> >
>> > I mean something like this. =A0If it looks acceptable, I will prepare =
a
>> > patch including similer change to nand_calculate_ecc.
>>
>> I personally do not like any HW specific implementation going into the
>> generic part
>> of the code. This particular issue is specific to your HW, so better
>> handle it in the
>> driver only.
>
> OK, but I still feel duplicating nand_ecc code is not so good. =A0How
> about splitting nand_correct_data into two parts? =A0A pure calculation
> function and a wrapper for mtd interface. =A0Like this:

But I do not see any thing extra, which you achieve from this
wrapper...  Is this a prototype, and you want to handle above scenario
in this wrapper (calling 'nand_correct_data' multiple times based on
something, probably 'ecc.bytes')?

>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index c0cb87d..3920896 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -425,14 +425,14 @@ EXPORT_SYMBOL(nand_calculate_ecc);
> =A0*
> =A0* Detect and correct a 1 bit error for 256/512 byte block
> =A0*/
> -int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *read_ecc, unsign=
ed char *calc_ecc)
> +int __nand_correct_data(unsigned char *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *read_ecc, un=
signed char *calc_ecc,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int eccsize)
> =A0{
> =A0 =A0 =A0 =A0unsigned char b0, b1, b2, bit_addr;
> =A0 =A0 =A0 =A0unsigned int byte_addr;
> =A0 =A0 =A0 =A0/* 256 or 512 bytes/ecc =A0*/
> - =A0 =A0 =A0 const uint32_t eccsize_mult =3D
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((struct nand_chip *)mtd->=
priv)->ecc.size) >> 8;
> + =A0 =A0 =A0 const uint32_t eccsize_mult =3D eccsize >> 8;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * b0 to b2 indicate which bit is faulty (if any)
> @@ -495,6 +495,16 @@ int nand_correct_data(struct mtd_info *mtd, unsigned=
 char *buf,
> =A0 =A0 =A0 =A0printk(KERN_ERR "uncorrectable error : ");
> =A0 =A0 =A0 =A0return -1;
> =A0}
> +EXPORT_SYMBOL(__nand_correct_data);
> +
> +int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned char *read_ecc, unsign=
ed char *calc_ecc)
> +{
> + =A0 =A0 =A0 const uint32_t eccsize_mult =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((struct nand_chip *)mtd->=
priv)->ecc.size) >> 8;
> + =A0 =A0 =A0 return __nand_correct_data(buf, read_ecc, calc_ecc,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((st=
ruct nand_chip *)mtd->priv)->ecc.size);
> +}
> =A0EXPORT_SYMBOL(nand_correct_data);
>
> =A0MODULE_LICENSE("GPL");
>
>
> There is a little bonus: the STANDALONE macro in nand_ecc.c can be
> more useful with this change ;)
>
> ---
> Atsushi Nemoto
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
