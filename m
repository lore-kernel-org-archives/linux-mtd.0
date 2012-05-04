Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQCgb-0002gE-Dx
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 07:12:18 +0000
Message-ID: <1336115737.30168.20.camel@sauron.fi.intel.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 04 May 2012 10:15:37 +0300
In-Reply-To: <20120503211334.17c91b31@halley>
References: <jnrm65$im4$1@dough.gmane.org>
 <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
 <20120503211334.17c91b31@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MZjcdopy2GEaNg9HQ9YY"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Grant Edwards <grant.b.edwards@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MZjcdopy2GEaNg9HQ9YY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-03 at 21:13 +0300, Shmulik Ladkani wrote:
> Hi Ricard,
> =09
> On Thu, 3 May 2012 09:35:14 +0200 (CEST) Ricard Wanderlof <ricard.wanderl=
of@axis.com> wrote:
> >=20
> > On Wed, 2 May 2012, Grant Edwards wrote:
> >=20
> > > The NAND flash I'm using has to be written in 4K blocks -- isn't that
> > > the "page size"?
> >=20
> > The smallest writable unit in a NAND flash is called a 'page', but AFAI=
K=20
> > this is not what the -s option in mkfs.jffs2 is for. Instead, it is=20
> > related for the kernel memory managament page size, which is 4k for mos=
t=20
> > architectures.
>=20
> According to MKFS.JFFS2(1),
>=20
> 	-s, --pagesize=3DSIZE
> 		Use page size SIZE.  The default is 4 KiB.  This size is
> 		the maximum size of a data node.
>=20
> And according to http://linux-mtd.infradead.org/~dwmw2/jffs2.pdf
>=20
> 	In order to facilitate rapid decompression of
> 	data upon readpage() requests, nodes contain
> 	no more than a single page of data, according to
> 	the hardware page size on the target platform.
>=20
> Wow.
> I always assumed I had to set it according to NAND's page size, not
> according to target system's mm page size.

Shmulik, I can give some info about this. First of all because of
compression and very different node sizes (UBIFS and JFFS2) and because
JFFS2 was designed for NOR flash originally - NAND page size is not
something which affects the design of file-systems, or their on-flash
layout. We use write-buffers on I/O level to make it appear like the
eraseblock is byte-writable.

The RAM page size comes from the general linux design - the VFS writes
in RAM page size units, and it is much simpler to make max node size =3D
PAGE_CACHE_SIZE rather than trying to split it when the PAGE_CACHE_SIZE
is something like 16KiB. This is where this -s stuff comes from. I think
it was a mistake to introduce this parameter because it is very unlikely
JFFS2 is/was used on systems with a different PAGE_CACHE_SIZE.

--=20
Best Regards,
Artem Bityutskiy

--=-MZjcdopy2GEaNg9HQ9YY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPo4IZAAoJECmIfjd9wqK0R3MQAKPFKg19LxGibebvcwuRAL3l
mqITKYyZiwDPQmDH981ge32/EG1y9XZARfYoce/LSl7hnIet5ERDGHjqtmNflBe8
6CHZ4ZT9AHOoU6I+HZUFC2gLtkiyPthGEsUW0XtJ8nxK3f8h6h2kt1dy8KjWcMYr
yGut5TeJE0V0CBsGZGxElsuMRTCOLIwJqo6aSh25ZhHseHf4qD8qwBxU91rtMtyb
W47MTWK9quGeL7a6NbBFxCzkk56gzmOwQJGwoTrI2InmfwvW5+opYlByoFwHeTDN
ss1RG4gVNEW3nXt8eSDd7frQKfpYEk3+oaEh9g52rKRWOy3fqBArouhpwozXBHf+
D+sSP1TU3/UgbIJFQ6T65Fg34yErCvwM0c6YCNZu+3LIEF1kKnkje+sdoBF03DFC
VsNik+hRHNDuV1QqJcMfbuwzV3h3BRxK8BjJn4X2SsYjY+k2h8lXp9R/y7sGR3WF
FM75qRY72i4rDz9HtrjkqT5URtBXX+6FFh0L7lRkO1LkOpSIEWerQI9DY5WVy6Bz
YMkdj49GVUWjuLa3DVcTQMPSPyU0jsFkBmppU/rdhAIhERJXiIg/U0i7ifnKX0mA
OFkxblnxrxVaYBIA9ZA7yCbULifXOlj3592NKL5iehGmzJUbLWIuFCl01ID1TC1C
zL/0fPHD+T0rCGAlGiOr
=uoHL
-----END PGP SIGNATURE-----

--=-MZjcdopy2GEaNg9HQ9YY--
