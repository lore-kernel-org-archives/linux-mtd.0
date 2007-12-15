Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J3Vto-0000sK-Lc
	for linux-mtd@lists.infradead.org; Sat, 15 Dec 2007 12:13:51 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Sat, 15 Dec 2007 14:13:15 +0200
Message-Id: <1197720795.25999.57.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-12-13 at 18:15 +0000, Alexey Korolev wrote:
> Hi=20
>=20
> Here is a patch providing partial page read functionality for NAND
> devices.=20
>=20
> In many cases it gives performacne boost. I've added this feature
> enabling under chip->options flag.=20
> Setting NAND_PART_READ option in board driver will enable this feature.
>=20
> This is example how partial page read could affect stat time perfromance.=
=20

Hi, this stuff looks nice and useful for me. Few suggestions:

1. Please, use -p option when you generate patches.

2. We already have notion of subpage in nand_base.c. We already can
write subpages. Your patch is about reading subpages, so I suggest you
to do something like s/partial/subpage/. E.g., UBI utilizes sub-page
writes.

3. Run nand-tests to make sure you did not brake anything:
git://git.infradead.org/~ahunter/nand-tests.git

Question: what was the flash you tested this on? Judging from the
comments it was a 512-byte page NAND, right?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Also, an separate idea I'd suggest you too look at, but after you have
your patch in:

Glance in how nand_base.c does sub-page write. It writes whole NAND page
anyway, but fills the subpages which it does not want to write with
0xFFs. I am not sure, but I suspect it could be smarter and write only
the requested subpage. If this is true, and you will do this, then the
notion of subpage could go away.

Indeed, you could declare mtd->writesize =3D subpage size then, not NAND
page size. Then, for example, for 512-page-byte NANDs you'd have
256-byte mtd->writesize, and JFFS2 would have 256-byte write-buffer, and
you'd speed up jffs2 writes, because it would write less space when it
synchronizes the write-buffer, and it would waste less space, which
means less Garbage-collection.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

I did not really check the code, but few notes after a quick look:

>  /**
> + * nand_read_partial - [REPLACABLE] software ecc based partial page read=
 function
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @dataofs	offset of requested data within the page=20
> + * @readlen	data length=20
> + * @buf:	buffer to store read data
> + */
> +static int nand_read_partial(struct mtd_info * mtd,struct nand_chip *chi=
p, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
> +{
> +	int start_step, end_step, num_steps;
> +	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> +	uint8_t *p;
> +	int data_col_addr, i;
> +	int datafrag_len, eccfrag_len;
> +=09
> +	/* Column address wihin the page aligned to ECC size (256bytes). */
Why this comment says about 256 bytes. AFAIU, this will be 512 bytes in
case of 2048-byte NAND page.

> +	start_step =3D data_offs / chip->ecc.size;
> +	end_step =3D (data_offs + readlen - 1) / chip->ecc.size;
> +	num_steps =3D end_step - start_step + 1;
> +
> +	/* Data size aligned to ECC ecc.size*/
> +	datafrag_len =3D num_steps * chip->ecc.size;
> +	eccfrag_len =3D num_steps * chip->ecc.bytes;
> +
> +	data_col_addr =3D start_step * chip->ecc.size;
> +	/* If we read not a page aligned data */
> +	if (data_col_addr !=3D 0) {
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
> +	}
Redundant curly brackets

> +
> +	p =3D bufpoi + data_col_addr;
> +	chip->read_buf(mtd, p, datafrag_len);
> +
> +	/* Calculate  ECC */
> +	for (i =3D 0; i<eccfrag_len ; i +=3D chip->ecc.bytes, p +=3D chip->ecc.=
size)
> +		chip->ecc.calculate(mtd, p, &chip->buffers->ecccalc[i]);
> +
> +	/* The performance will be improved more if to position offsets=20
> +	 * according to ecc.pos. But in this case we may face issues=20
> +	 * on chips with gaps in ecc positions. So it is disabled yet*/
> +	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	for (i =3D 0; i < eccfrag_len; i++)
> +		chip->buffers->ecccode[i] =3D chip->oob_poi[eccpos[i + start_step * ch=
ip->ecc.bytes]];
This double array indexing is rather unreadable.
> +
> +	p =3D bufpoi + data_col_addr;
> +	for (i =3D 0; i<eccfrag_len ; i +=3D chip->ecc.bytes, p +=3D chip->ecc.=
size) {
> +		int stat;

...

>  /* Options valid for Samsung large page devices */
>  #define NAND_SAMSUNG_LP_OPTIONS \
> @@ -183,6 +185,8 @@
>  #define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
>  #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
>  #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
> +#define NAND_CANPARTREAD(chip) ((chip->options & NAND_PART_READ) &&\
> +				(chip->ecc.mode =3D=3D NAND_ECC_SOFT))

Why chip->ecc.mode =3D=3D NAND_ECC_SOFT?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
