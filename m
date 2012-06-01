Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaW97-0002ZQ-Nu
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 18:00:22 +0000
Message-ID: <4FC90330.4050804@nod.at>
Date: Fri, 01 Jun 2012 20:00:16 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI: Fastmap updates (v7+)
References: <1338563804-85990-1-git-send-email-richard@nod.at>
 <1338573027.2053.9.camel@koala>
In-Reply-To: <1338573027.2053.9.camel@koala>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig31E3115C9E7C01AADB87CE41"
Cc: adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig31E3115C9E7C01AADB87CE41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 01.06.2012 19:50, schrieb Artem Bityutskiy:
> On Fri, 2012-06-01 at 17:16 +0200, Richard Weinberger wrote:
>> All patches have been tested with ubi-tests.
>=20
> While this is being reviewed, you could enable the bit-flips emulation
> in UBI (there is a debugfs switch for this) and test how this handles
> bit-flips.

Of course I've tested fastmap already with bit-flips emulation. :-)

Thanks,
//richard


--------------enig31E3115C9E7C01AADB87CE41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPyQMxAAoJEN9758yqZn9evikH/1QMfXbNR89A5ohWljNqgiIY
U6LhyDZSw5SNqkVBLNP1/2C0Za8CW/ksbkSq6+0e4DOMjVn9+N5Imgl9JajeF700
7UAlCIhpblbOxGRfw2UzBCmRH0bj7KnEhdM2xr4igWg5YsAwNR7cW2gvXitxGFim
iTtO9u4Pka8uL9VLOy+Iih46A9A7Flfo3mRoiIc9fMxOecaTuvx7YyiHanZ2sQMe
BJRVyI37TzlSD6B9A6MqupPjaqp3odDE6bmlyzqWyriTLfxZOth8WgmL15fCG00j
WEr7fjZlFFiaEz2WfXANmIqlL4+o7oC0EHvAb3VFR8M0UT+tZVGw2m9n36DQshI=
=ubuc
-----END PGP SIGNATURE-----

--------------enig31E3115C9E7C01AADB87CE41--
