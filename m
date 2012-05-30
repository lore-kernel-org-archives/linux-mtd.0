Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SZfzA-0005Ty-Nj
 for linux-mtd@lists.infradead.org; Wed, 30 May 2012 10:18:37 +0000
Message-ID: <4FC5F3DC.7050201@nod.at>
Date: Wed, 30 May 2012 12:18:04 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] ubi: fastmap: harmonize medium erase-counter seek
 algorithm
References: <20120529164811.5e86b190@pixies.home.jungo.com>
In-Reply-To: <20120529164811.5e86b190@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1840CD128365A5951FC0A09D"
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1840CD128365A5951FC0A09D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 29.05.2012 15:48, schrieb Shmulik Ladkani:
> Currently, there are two different locations where a wear-leveling entr=
y
> with a medium erase counter is looked-for, with the same search algorit=
hm
> duplicated.
>=20
> Harmonize this by introducing a common function 'find_mean_wl_entry'.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Applied!

Thanks,
//richard


--------------enig1840CD128365A5951FC0A09D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPxfPgAAoJEN9758yqZn9evwUH/32OThfN0W2XfZVaigCLg1Gy
+7Y5WINVicSuLt9C5XPZ3w/aoUwsDET0c5JF6AM/D15mNcH9KRckCTA/5JcrKUmA
rmsD5u7qiXeGIKLMQ1wVv2DZ/93Sbty61hzYWzpNnyapzXZ3y1IAnVVjRPfDmcSj
Zy9rOvTavFE/A75tpUIeyBjSfki4aLPK5JQWHuDthxWPOtM3DHISXHGQOgqth2P+
NbmMzxC3BORUGPR/B/+mbXWbb4FsvSWQiJ9OBKIBHl70e2uDIy+v6bkRQazbE71x
9tPy20Dabp4utWNIMs5no+HtVXd9ucDP3VMVqqEbyzL/Dferx6kZswQ3AYQQ1Kk=
=cnfs
-----END PGP SIGNATURE-----

--------------enig1840CD128365A5951FC0A09D--
