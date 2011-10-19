Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGXHa-0005X9-MH
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 14:38:15 +0000
Received: by wwe32 with SMTP id 32so5111295wwe.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 07:38:12 -0700 (PDT)
Subject: Re: Understanding page size in jffs2- and kernel-source
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Freise, Bjoern-Achim" <bjoern-achim.freise@techem.de>
Date: Wed, 19 Oct 2011 17:37:44 +0300
In-Reply-To: <CC01CB1DD69AA74C86C6E8D4EAF42403081C7203@mx-be-2.eu.techem.corp>
References: <CC01CB1DD69AA74C86C6E8D4EAF42403081C7203@mx-be-2.eu.techem.corp>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ta4gZ33OIGyl4IutYEQ0"
Message-ID: <1319035071.25389.91.camel@sauron>
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


--=-ta4gZ33OIGyl4IutYEQ0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 10:52 +0200, Freise, Bjoern-Achim wrote:
> Hello,
> =20
> we are using Kernel 2.6.28 with mtd-utils 1.0.1 on an ARM at91sam9260
> with a NAND flash with 512 byte pages an 16k erase size. And now I'm
> trying to understand a few things:
> =20
> 1) In the kernel source it has PAGE_SIZE and PAGE_CACHE_SIZE with
> 4096. These defines are used in the jffs2 implementation. Is that
> correct when using 512 byte pages in a NAND device?

Kernel macros are about RAM page size, which is 4KiB in most arm
systems. This is not NAND page size.

AFAIR, PAGE_SIZE is the RAM page size, but PAGE_CACHE_SIZE is the page
cache page size, which is in practice is always the same as PAGE_SIZE.
=20
> 2) In our build-environment our image is created with "mkfs.jffs2 ....
> --page-size=3D512.... ". I guess this doesn't match with the above?

This is NAND page size, so looks right.

> 3) What should I use for a good performance (page_size and/or with/out
> compression) when using a large (~ 16MB) sqlite-file?

I do not think you have any choice, unless you are ready to hack
MTD/JFFS2 - use 512.

--=20
Best Regards,
Artem Bityutskiy

--=-ta4gZ33OIGyl4IutYEQ0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOnuC4AAoJEJtuLFy+q7feZVgH/2j+65CRQBtKo37x1hUloopi
vgMIV/uVBWhCZDTKXUOc4yLzaDaEZLRhfodtKcogdgWa27O5qnvSbZr/wyjPHdHg
Kba8K1eAkAeg+8pHQ/taizc9u53uhdTjuRalvp/YXi2YwLW25pxd1PH21bA4GyD9
nSI5Jyj3fysEt76Ge7+7DnfR09wBPkmVcTaLy1h0Px+9/xi6bn3IIHP39CruvCB2
7KBdRIJvVLUzpUff9dasz4p9Qb67DPoSs0CV+ml8VnruBJJ+lmipLDbWr7wATQzx
RNMRzVu+LSPKi16pzXevPdml7IoqKjgjCWf66Bxd5GXZRCHMvTZ7mB+pithYOug=
=siTJ
-----END PGP SIGNATURE-----

--=-ta4gZ33OIGyl4IutYEQ0--
