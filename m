Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5cT-00063M-Hu
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:34:14 +0000
Message-ID: <4F11A06A.3040703@nod.at>
Date: Sat, 14 Jan 2012 16:34:02 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] ubi: Use UBI_LAYOUT_VOLUME_{TYPE, ALIGN}
References: <1326214623-15938-1-git-send-email-richard@nod.at>
 <1326553866.14299.0.camel@sauron.fi.intel.com>
In-Reply-To: <1326553866.14299.0.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE781820EAD50F4F34660D366"
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE781820EAD50F4F34660D366
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 14.01.2012 16:11, schrieb Artem Bityutskiy:
> On Tue, 2012-01-10 at 17:57 +0100, Richard Weinberger wrote:
>> UBI_LAYOUT_VOLUME_TYPE and UBI_LAYOUT_VOLUME_ALIGN are currently
>> defined but not used.
>> Use them at least once. 8-)
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>=20
> Hi Richard,
>=20
> This will break backward compatibility - older and current kernels whic=
h
> do not have this patch will error out when the find a volume without a
> name. The right way to do this would be to change the UBI format
> version, but you would need a really strong reason for this.
>=20

Sorry, this comment makes absolutely no sense.

Did you mean my other patch?
But still, the other patch also does *not* allow volumes without names.

Confused,
//richard


--------------enigE781820EAD50F4F34660D366
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPEaBuAAoJEN9758yqZn9eH4UH/ju+IQ8oBuYVmcBrWB15D5Qa
a6PSDdrFLY9l88ZHEu6MaEaPslltY+uiVniCpYCfu9YhHUsfNbMUqBWmDeyVZoFm
Lr3NasTsp5e7A74QstLeWaKYgK+Amjje/mbf4LA04QxwtBcOxdM48vB+eYs8H4mw
T3R8HPdQpfnDnndJbxCAq0HU+3cPZyotpZa2Hiv2ZueWU0qvumWoepGlXaLXcBpO
rNHRtoZqvK2KRn9gkb0tSlSM4p6xjpF0vbgBXT2KMtCdIxw1L+2VSZDaCR0yswce
PPrZZ7W4gNf6ODHdnGGLhIST+zMjfoFe1/fUud15U9pJf/AKSaHTLUCu23w/dnQ=
=7HuU
-----END PGP SIGNATURE-----

--------------enigE781820EAD50F4F34660D366--
