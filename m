Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACNox-00070A-Fu
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 19:34:59 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1066847305.6281.170.camel@tubarao>
Mime-Version: 1.0
Date: 22 Oct 2003 12:28:26 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-joZSd5cANk+UY3ws0epm"
Subject: Huge cfi_cmdset_0002 changes
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-joZSd5cANk+UY3ws0epm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I just committed some major changes to cfi_cmdset_0002:

* removed *_onesize() functions - they didnt optimize that much
  and only increased code size and maintenance overhead.

* added lock/unlock functions - these likely only work on a very
  narrow set of chips, but it gives a place to start.

* made more similar to cfi_cmdset_0001 - helps cross-maintenance
  and understanding.

* do_write_oneword() checks for a NOP before writing - *huge*
  speedup and avoids some buggy chip behavior.

* revised some comments for better readability and understanding.

* likely some other subtle changes.

I'd like to request that those with buffered writes and
erase-suspend/write applications give this a try and see if I've
horribly broken anything.

Thanks for your patience and bug reports.

PS.  I think by now I have all of the submitted patches *finally* rolled
in.  If you have a patch that isn't in the latest version then let me
know!

--=20
Thayne Harbaugh
Linux Networx

--=-joZSd5cANk+UY3ws0epm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/lsxJfsBPTKE6HMkRAsE3AJ9IYJ3KpGI5ZeG3sAlzn8lhUZ323QCcDR19
BzszNnlhWjU9AKkE2t1htJE=
=grEn
-----END PGP SIGNATURE-----

--=-joZSd5cANk+UY3ws0epm--
