Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si8us-0004vB-4l
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 18:49:11 +0000
Message-ID: <4FE4BE22.3010709@nod.at>
Date: Fri, 22 Jun 2012 20:49:06 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Subject: Re: ubi_update_fastmap: could not find an early PEB
References: <201206222005.02308@blacky.localdomain>
 <201206222126.12515@blacky.localdomain> <4FE4AD74.1040907@nod.at>
 <201206222246.23389@blacky.localdomain>
In-Reply-To: <201206222246.23389@blacky.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE6F981223FD5C7B9DCE32C69"
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE6F981223FD5C7B9DCE32C69
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 22.06.2012 20:46, schrieb Nikita V. Youshchenko:
> Tried code from there, plus patch you've sent, and still getting
>=20
> # ubidetach /dev/ubi_ctrl -m 2
> UBI error: ubi_update_fastmap: could not find an anchor PEB
> UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=3D-28=

> UBI: mtd2 is detached from ubi0

As I said, the posted patch may or may not help.
Most likely the freshly created anchor PEBs got consumed by one
of the pools.
Anyway, I'll present a proper solution within the next few days.

Thanks,
//richard


--------------enigE6F981223FD5C7B9DCE32C69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP5L4iAAoJEN9758yqZn9eZrcH/jtqWG39xEnn7D+5WUhLW7wC
qZ6pL2+YOb6NDteqCIkpNY3ikzagrwgyJwH00lGfyq8B8BXqr6+g3u7TMnnot3sN
Ur/XZg8P7v8Y9vhgmLZYa8VzvgqY3xZ5EeMuMGCktyado+k0OMsensKg6t1lIbvy
n7+MyklskJi/b+xKFlE9kN+CEd/m23++R5KpoEZ7Ti5x2LcEKSKTXR6/tF5+6Zt3
xvVxLFwIru3NY4xdVl59N0eW9rAesQTmNgyY2T2NNNk728d5WCb2kwb1PcEyPUJm
MnmMfcyviDbTyDvVBj8dG9xUQ1nWLSgUm/GlrC7EYLipwjmFSquL4mNI8aUoZwQ=
=4TlZ
-----END PGP SIGNATURE-----

--------------enigE6F981223FD5C7B9DCE32C69--
