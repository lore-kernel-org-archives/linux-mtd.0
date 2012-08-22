Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4AoW-0005h2-KT
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 13:17:41 +0000
Message-ID: <1345641716.2848.188.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption after software upgrade
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Date: Wed, 22 Aug 2012 16:21:56 +0300
In-Reply-To: <501923A9.7030002@cincinnatitechnologies.com>
References: <500F0D81.8050902@cincinnatitechnologies.com>
 <501923A9.7030002@cincinnatitechnologies.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DnMHwimi34FYk000B8ru"
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


--=-DnMHwimi34FYk000B8ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-01 at 08:40 -0400, Russell Zuck wrote:
> On 7/24/2012 5:02 PM, Russell Zuck wrote:
> > I have not yet attempted to reproduce this issue using nandsim nor do I
> > have a simple reproducer for the problem yet.  Please provide some idea=
s
> > about how to simulate the reboot using nandsim as I think the reboot
> > portion of this scenario will be critical to reproducing the issue.
>=20
> Can anyone direct me to some information that might help me simulate a=
=20
> reboot using nandsim to attempt to reproduce my UBIFS corruption issue?
>=20
> Additionally, I would really appreciate any suggestions, tips, tricks,=
=20
> criticisms of the upgrade process I outlined previously, or "Have you=20
> considered this" type questions.  I've read everything I could find that=
=20
> even remotely pertains to my scenario but nothing is clicking for me=20
> yet.  I'm desperately trying to resolve my issue.  Any guidance would be=
=20
> welcome.

I'd first forget about your update scheme and just stress-tested UBIFS.
Mount it, try testing it using the integck test - does it work? E.g.,
run 'integck -n0' and let it run for hours or overnight. If that is ok,
try to power-cut the device while integck is working. Does it mount
after reboot? Can you remove the integck working files and re-run it?
Does it work? Try to repeat power cut several times.

--=20
Best Regards,
Artem Bityutskiy

--=-DnMHwimi34FYk000B8ru
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNNz0AAoJECmIfjd9wqK0rdAP/0bSYrHrifEQoomeac8XATBj
tNGme3ZhpJkaNtks0oaK+zLy3noVpMjf3XpeWKa1hVW/sqOt6cDV0qOV/xrt63PK
2XfOuYZNXYm7gUETrmWiFTdNy0xDcDOLgdVyARGaJtNxxtErzTYrfc58uNIJyaDM
M04T/pbCt0R1mgGy2UcOGPj3ljIU088Ki6z8EiAifcXzc4SqSyhSRtsQ2asHrwUy
PLdVwqZ76uDDGeRsYPKZaRsfI9pGXoFIpxC0knete/HhextZQMTrTq8OG66Jdkvs
AnRhyIAuVv0Q8fqc651nlpBzgBq16wYNzQclyr2LtXvFonuzqoXmkx2sU39tiz6L
DLWTAVFPpV/cECcjxv5y3HXuGKCuZs4mP3Td4Bb0f5q0huCsfS46NW3cdpiReijt
bRbpC10XMXU09HSL26j9HqGdKGJw4WTf72rO82By6iCRJSnKbdvZbjwYVcE9g0Uo
3Qr12dcSgAodzNRN5tya7IzT+9de5tJPotFjFlaiLUQ0Tnmf8A18dtUcQMcV5IJ6
HVZiYK8K3SJ4ngARCbD3FR2M+S3uldPhRkhqgRYCmzdfUxMlIpJGt68pFDJ0Ylef
1MSZhpP0kt2vQYHeT0e40fSTUwG9cFab4RmA/Uvx+tSO77s/m12r3WrBtt+zig9K
8GlBFoXhrsMO8jHGQZ80
=aUgQ
-----END PGP SIGNATURE-----

--=-DnMHwimi34FYk000B8ru--
