Received: from moutng.kundenserver.de ([212.227.126.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8gbN-0003Oa-W7
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 14:07:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH Take 3] MTD driver for alauda chips
Date: Wed, 11 Jul 2007 20:05:43 +0200
References: <20070709223704.GC18501@lazybastard.org>
	<20070711164628.GB27628@lazybastard.org>
	<20070711172617.GC27628@lazybastard.org>
In-Reply-To: <20070711172617.GC27628@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707112005.44089.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 11 July 2007, J=C3=B6rn Engel wrote:
> A driver for the Olympus MAUSB-10 and Fujifilm DPC-R1 card readers.
> Unlike most stuff on the market the chip inside these two allows raw
> flash access and doesn't implement and FTL, leaving that functionality
> to the device driver.
>
> Raw flash access in a cheap USB cardreader!  An MTD test device one can
> attach to a PC!  What a deal!

Cool stuff! just a few details I noticed:

> +/* Address shifting */
> +#define PBA_LO(pba) ((pba & 0xF) << 5)
> +#define PBA_HI(pba) (pba >> 3)
> +#define PBA_ZONE(pba) (pba >> 11)

What is PBA?

> +static struct usb_driver alauda_driver;

The forward declaration is use nowhere, you can kill it.

> +	struct alauda *al =3D mtd->priv;
> +	u32 pba =3D from >> al->card->blockshift;
> +	u32 page =3D (from >> al->card->pageshift) & al->pagemask;
> +	u8 command[] =3D {
> +		ALAUDA_BULK_CMD, ALAUDA_BULK_READ_PAGE, PBA_HI(pba),
> +		PBA_ZONE(pba), 0, PBA_LO(pba) + page, 1, 0,
> +		ALAUDA_PORT_XD
> +	};

It would be nice to have support for both ports, not hardcoding xD.
At least I only have SmartMedia cards, so I can't test the code
the way it is ;-)

> +	err =3D usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
> +	if (err < 0)
> +		return -EIO;
> +
> +	err =3D usb_bulk_msg(al->dev, al->bulk_in, buf, mtd->writesize, NULL, H=
Z);
> +	if (err < 0)
> +		return -EIO;
> +
> +	err =3D usb_bulk_msg(al->dev, al->bulk_in, oob, 16, NULL, HZ);
> +	if (err < 0)
> +		return -EIO;
> +	return 0;
> +}

Not sure how much difference it makes, but it should be more efficient
to queue all three commands first, and then wait for their completion
once, instead of doing them all synchronously.

> +	err =3D usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
> +	if (err < 0)
> +		return -EIO;
> +
> +	err =3D usb_bulk_msg(al->dev, al->write_out, buf, mtd->writesize, NULL,
> +			HZ);
> +	if (err < 0)
> +		return -EIO;
> +
> +	err =3D usb_bulk_msg(al->dev, al->write_out, oob, 16, NULL, HZ);
> +	if (err < 0)
> +		return -EIO;
> +	return 0;
> +}

Same here, obviously.

> +static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
> +		size_t *retlen, u_char *buf)
> +{
> +	struct alauda *al =3D mtd->priv;
> +	int err, corrected=3D0, uncorrected=3D0;
> +
> +	if ((from & al->bytemask) || (len & al->bytemask))
> +		return -EINVAL;
> +
> +	*retlen =3D len;
> +	while (len) {
> +		u8 oob[16];
> +
> +		err =3D alauda_read_page(mtd, from, buf, oob);
> +		if (err)
> +			return err;
> +

and you could gain more if you have multiple pages outstanding I/O.

> +	while (len) {
> +		u32 page =3D (to >> al->card->pageshift) & al->pagemask;
> +		u8 oob[16] =3D {	'h', 'e', 'l', 'l', 'o', 0xff, 0xff, 0xff,
> +				0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

Are you planning to keep this string?

	Armd <><
