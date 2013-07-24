Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1pFI-0007RQ-GE
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 02:56:09 +0000
Message-ID: <1374634527.5581.14.camel@deadeye.wl.decadent.org.uk>
Subject: Re: Add "UBIFS: fix a horrid bug" to 3.2 branch?
From: Ben Hutchings <ben@decadent.org.uk>
To: Christoph Fritz <chf.fritz@googlemail.com>
Date: Wed, 24 Jul 2013 03:55:27 +0100
In-Reply-To: <1373274954.4186.38.camel@mars>
References: <1373274954.4186.38.camel@mars>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pCBeYmrLoqb0Ldskm4JM"
Mime-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pCBeYmrLoqb0Ldskm4JM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-07-08 at 11:15 +0200, Christoph Fritz wrote:
> Hi Ben,
>=20
>  I can't find an incarnation of commit "UBIFS: fix a horrid
> bug" (605c912) in current stable branch 3.2 but 3.0, 3.4, 3.9 and
> current.
>=20
> Are there any concerns adding these commits:
>=20
>     UBIFS: prepare to fix a horrid bug
>     UBIFS: fix a horrid bug

I've just gone through all the commits tagged for stable up to
v3.11-rc1.  These are now in my patch queue for the next 3.2 update.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-pCBeYmrLoqb0Ldskm4JM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUe9CH+e/yOyVhhEJAQqLQg//UTVcF4nN59CVBCRfnBcA5Qi5rKqvnIER
HiyDiC2It3QpB555Z/SW0Jlg0DJQJDs7hVrvb89ZsTlVISgQdcds9HNUb5+wzgyq
6t2zbDjjIPUMpLYnm/WpR2E92qSMwp6hQgLp7oNDszU3cnB0P/UOjWTyLc73pBUL
cGJ5sp9zJGVhCT7E7rXkc9Jeo9o5Rjc2pWipigdzG4uhYfHld9EIDF0QHIWSb+xJ
/+qhKrJe7VB6gPmI96avSeH87YBZzbAsknw/5pISI6Usb18+1vvjy+/LC+5fH4AQ
rNyqUYj5qGHTeh6Bs+YUcpkj7gSyWLQNdgJdGjFBsFoCk6TTFXMuAKlfe9GkahDd
5DjmIWONK4CQTr8BfpLSyVCpRwN/k1VInLNEb9jpxOLW6rdBg4hdYffXZ9IWE+eM
RLPipvTQC54UQ3d63QRf3rw1F2VPhpLcVaOMFmqLk0A33i9q2VnLNd/qcvn8f6C7
KSoyGR3Fq62DDxYBNErMzSMe0J8GemFZ0v2x6mJRadsx2cR19SrUutYdeh6YOZ+i
+K/DRDlvNTUjMpfn7OhDDFlSDRoHQsymafsiLGRT3bUy0v2OvSrCLqSsACEdlcRZ
0h+Mcp1LSWUk1u5PcqwLEJJ+SGUE9t/4qYslmnvXEIur2QS6gzTRU0wS8RN7F2cY
89WqaJ8Sv+0=
=NSSQ
-----END PGP SIGNATURE-----

--=-pCBeYmrLoqb0Ldskm4JM--
