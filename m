Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Sny-0004O0-CI
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 09:18:50 +0000
Message-ID: <1346664222.3061.21.camel@sauron.fi.intel.com>
Subject: Re: UBI on SPI NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Date: Mon, 03 Sep 2012 12:23:42 +0300
In-Reply-To: <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
 <1345811483.2848.310.camel@sauron.fi.intel.com>
 <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Gg7vhBaJuJttK86+q9ds"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Gg7vhBaJuJttK86+q9ds
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-27 at 18:15 +0200, Jan L=C3=BCbbe wrote:
> > Another problem I know with SPI flashes is that UBIFS uses vmalloc'd
> > memory for I/O, which is not suitable for DMA-ing on ARM platforms
> and
> > may cause subtle bugs and curruptions. Can you try to disable DMA
> and
> > see if the issues go away?
>=20
> It works if I disable DMA in drivers/spi/spi-omap2-mcspi.c (simply
> comment out the DMA branch in omap2_mcspi_work). I can use UBI&UBIFS
> without problems for far. When rebooting to a kernel with DMA enabled
> I
> can no longer attach the previously working volume. Moving back to the
> PIO-Kernel, it works again.
>=20
> Where should this be fixed? Should UBI use kmalloc'ed memory?

Yes, the best way to fix this is to teach UBI and UBIFS stop using
vmalloc(). It is not straight-forward, but doable. As I said several
times, I can assist by giving ideas and directions, but someone who
needs this should probably allocate a couple of men-months for this
project.

> Why does this work for NAND controllers using DMA? :)=20

I am not sure, you should investigate. I think some drivers just check
if this is vmalloced memory, and avoid DMA for that. Some (e.g.,
onenand) use various hacks which appear to work.

--=20
Best Regards,
Artem Bityutskiy

--=-Gg7vhBaJuJttK86+q9ds
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRHceAAoJECmIfjd9wqK0k/cP/iPbQZd/ccs9V7sds2KAxjh/
FA/d26yaaV2GPeeZOZYqUpXGnTYzWnawynaGpTP9pZWa6hDBPiXhKr0i7eiCgFXF
mylBQeJv2qbdhMKltKDlo74TSAo/sODRp8t+w+CxrvAjBYtl/4BTYGZl3vvS7U0b
5RtLWQpHabvkrCvKwbamQ6a+HTwd4m48+MZOuMXJwUsyyCnzfM8nyaG+ufg6rN/4
+/8FeQfsEr4AL+wwtBGhupj3nuLK8G2mCP37kn/2NDfJO7xR0+pX9udB6A005L1d
9IH8hgcXyhl7/tfNyfFFFVm2VLoVfKhlxwWJVSr0N2JF3YWmvMDiEtq7eELX+Ase
w/24hwCXylyRkAcRNmazmQ0oOrXnTS6Kl14ahp2jXc4t0jsAdVwaeHGdigdi6AEK
U8wRhWl9882saWnwx2tuWjcvgOvONSmtJzxzVvD/4CUIc3IpqMdeLqUK3bBmtt6r
FyPeD+vYSrmPOW5qGuDWILlHxl+T/fYEjy3xBLz/fHvVPb+NYMwhtOxwk94ezaGw
a9KO+Zpaw4MEki5qbjijw3PZWUon695bSq9IggMQC0zQj8vzJsTL3wy/LpYByHEQ
XyicBSckpXJ293+W59NeTFxYICmLOkT19JFUqEuWeNB/yIQhvVdTNW8h0+drv+qF
9YC4qV88xPbRLKhBsxL3
=kCdK
-----END PGP SIGNATURE-----

--=-Gg7vhBaJuJttK86+q9ds--
