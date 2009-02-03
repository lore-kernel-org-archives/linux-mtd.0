Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LU9SR-0006i6-Sc
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 00:48:22 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] sh: maple: Add support for VMU devices (v2) [1/3]
Date: Mon, 2 Feb 2009 19:48:01 -0500
References: <1233619569.13918.12.camel@localhost.localdomain>
	<1233620263.13918.31.camel@localhost.localdomain>
In-Reply-To: <1233620263.13918.31.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3028677.rxxFT817vE";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200902021948.04031.vapier@gentoo.org>
Cc: linux-sh <linux-sh@vger.kernel.org>, greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3028677.rxxFT817vE
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 02 February 2009 19:17:43 Adrian McMenamin wrote:
> +	if (src_ofs >=3D ((card->parts)[partition]).numblocks * card->blocklen)
> +	if (num > ((card->parts)[partition]).numblocks)
> +	pcache =3D (card->parts[partition]).pcache;

ive only quoted some, but the use of parenthesis here is pointless and imo=
=20
makes the code harder to read.  it's like trying to parse lisp ;).

> +	vblock =3D kmalloc(sizeof(struct vmu_block), GFP_KERNEL);

sizeof(*vblock) ?

> +static int __init vmu_flash_map_init(void)
> +{
> +	maple_driver_register(&vmu_flash_driver);
> +	return 0;
> +}

shouldnt this be:
	return maple_driver_register(&vmu_flash_driver);
=2Dmike

--nextPart3028677.rxxFT817vE
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJh5RDAAoJEEFjO5/oN/WBRykP/iv7lqy/HPvyJ6uGn9lnDJTQ
U/SP1CdoPdRekhY4cn0dmjmHhVk6NXtSy5Pm+TXJ3c024WEdU5MSu0h4ZVvJ77cF
v44SU7rSBwvaGruUhMEpRzMdmBvaqrun4G7NhHcK5KT6Qkc9mKuC1vPVfJ8n9Na1
4dTQv3dScf1y7RmETJwdUcfrleIE3bDODXOhI3MXoRKVpI96KRWJUp/bNGwxUEzB
Gq6+lObXsCWD2rIhgMkRVC6dstb1A/RRkseH12DGyY51ke6mLMsnDuhAMJ0fhn/r
jbwIrI//G+Hj00uWrmoBLz3idom9kgW2sTJRtjrnVg0++mqLpl+X9MMUdBHb1gsK
Nz+JD6CVwdeZIfzEAJCBO6xa4U7v22cS9abxnpZd2Y7AsCyYgGCikymFoNlXMwr8
39voMlruHucFzXABa0OTldRsUYjnO2GbmGtj3ARcBLIW1Vfpsn95TgPjMj4m6KlH
gXHkFXFr6NpHOe98RgNBD9zrf+rPcOorWyGRAIpmwyzVoli3IEswgJhbbyeD15aE
hxy8dmcmd689i/rMCc0Wr43zpW5WH22ugHwP1+kwDIJZeT+ATJ8L1WW1xvVKdLcp
PTOZFij5W4laVhUGIsZMrNf13v5AJpRL4ouTbFiX02fIyROE5lcA86C+aehyEx2k
ULxC3loEadAwU/58cap4
=Iz4Y
-----END PGP SIGNATURE-----

--nextPart3028677.rxxFT817vE--
