Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l6t-00082i-7V
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:31:28 +0000
Message-ID: <4F67B3B8.7090909@nod.at>
Date: Mon, 19 Mar 2012 23:31:20 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: add documentation about locking context of MTD API
References: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigCEE90BF65A83B822C57C0896"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCEE90BF65A83B822C57C0896
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 19.03.2012 23:26, schrieb Robert Jarzmik:
> Add a comment to mtd header for MTD drivers writters, so that they
> know that each function in the MTD API, ie. in the mtd_info
> structure, is called in a sleeping context.
>=20

Why do we need this comment?
"sleeping" context isn't special, it's the default.
atomic would be...

Thanks,
//richard



--------------enigCEE90BF65A83B822C57C0896
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPZ7O4AAoJEN9758yqZn9efg8H/iWQXiVPPDbtQCE/FEaDZgOw
OYNgzGZ9lTIkud1eusuVshXr1uNYfeSO+/D+rPOhCj8a4cXtXR3v4i5IL3qw1AUK
Tp6F36Nq4TTHuj7qjYA5KS9Puv6tQAgpHWAVpuCdOyeaHVU986r0EP1e6LJCErMn
Gx9YRa5J5Zg6RhPbcge0xMc5ODJdAWjH+pzGxXWMNYcgS/E5g65/Rk8suAUx7HIw
rpzfUXPWFXQxXCQW9/Uck8c0a9tPdlA1dLTl7DkQowkl4ePzKwctgGZGDJTsEumZ
d6usXShOZqXZwgPT7v07n/w6Av2v8C+DAT9lrwfy5wSWglkRglxWvsIg+9GCPts=
=fQx5
-----END PGP SIGNATURE-----

--------------enigCEE90BF65A83B822C57C0896--
