Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sbu92-0006q4-Q7
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 13:50:01 +0000
Message-ID: <4FCE0E81.9000705@nod.at>
Date: Tue, 05 Jun 2012 15:49:53 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: ubi: fastmap: v7: ubi_update_fastmap failure
References: <20120605164142.02d9e235@pixies.home.jungo.com>
In-Reply-To: <20120605164142.02d9e235@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE8C457C223B99018518D69BC"
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE8C457C223B99018518D69BC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 05.06.2012 15:41, schrieb Shmulik Ladkani:
> Hi Richard,
>=20
> I got the below UBI error when working with fastmap v7 (linux-ubi.git,
> branch fastmap, HEAD at bd8313d).
>=20
> Had no time to investigate (could be fixed by your v7+ patches); please=

> take a look if you can.
>=20
> Setup:
> - Beagle with SLC NAND.
> - ubi.mtd=3D4 root=3Dubi0:beagleboard-rootfs rootfstype=3Dubifs
> - A single volume on the ubi0 device (the ubifs rootfs).
>=20
> The board booted several times succesfully with fastmap-v7.
> Then I got the error below, when ubifs was mounted (note UBI attach was=

> successful).
>=20
> Switched to non-fastmap kernel, board booted successfully (with ubifs
> mounted succesfully).
>=20
> Regards,
> Shmulik
>=20
> [    3.222808] UBIFS: recovery needed
> [    3.281646] UBI error: __ubi_wl_get_peb: no free eraseblocks
> [    3.287750] UBI error: ubi_wl_get_fm_peb: no free eraseblocks
> [    3.294952] UBI error: ubi_update_fastmap: Erase counter overflow!

Please use v7+.
It looks like you need:
[PATCH 01/23] UBI: Fastmap: Fix EC overflow calculation

If fastmap does not get a free PEB with a pnum < 64, it tries to reuse th=
e old one.
In this code branch it erases the PEB and checks for a EC overflow.
This check is wrong in v7 (didn't use be64_to_cpu(), sorry!).

Thanks,
//richard


--------------enigE8C457C223B99018518D69BC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPzg6BAAoJEN9758yqZn9e5sUIAJs0zfeqKg5ecLSwZn170YL5
5K+5Re2LTjQETw8CSt6gAzql4OjBb2lg4RQr5gETq4Jke0wfXL/CR+8/7jKBjRZj
8EUVCarcu3dy4HgZlW4Xh18z7/SMwtuhLYcSJa8hB+/kN/CepWxBhncbWnC+E035
Y1B55OgN3qBa6y3tpVimziWzEDQrEpWFpdrmTbyuSMxBm3MiN1xk4YypV83tBCS0
yJaR26dOMymGtw24nEQ+YLczAA9WIXO3wf0lLGd+dQ06iDF/NFYpJbxm9pFiteCj
GcdCYA04VQ943ziQ7WZ3SbwuU1K9Y2KljJQS6TrqyE3vJ7LY4S2gQiAPLT8tcU4=
=mPHH
-----END PGP SIGNATURE-----

--------------enigE8C457C223B99018518D69BC--
