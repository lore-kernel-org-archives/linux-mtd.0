Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ise10-0003SH-PY
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 07:40:20 -0500
Date: Thu, 15 Nov 2007 13:20:42 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
Message-ID: <20071115122042.GA10165@lazybastard.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <1195071456.2533.45.camel@shinybook.infradead.org>
Cc: Roman.borisov@intel.com, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 14 November 2007 15:17:36 -0500, David Woodhouse wrote:
>=20
> That shouldn't happen. When one node obsoletes an earlier node covering
> the same range, we _should_ be checking the data CRC. I reimplemented
> this part of the code only recently.

Doesn't that fail for newly created files or for previously sparse
blocks of files?  Alexey's testcase creates a new file, so you should be
able to create such images yourself.  This testcase should be a bit more
reliable to hit the problem:

for i in `seq -w 1000000`; do echo 12345 > $i; done &
# wait half a sec
# hit reset button
cat `ls | sort | tail -1`

Completely untested, as always.

J=C3=B6rn

--=20
All models are wrong. Some models are useful.
-- George Box

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFHPDmafbqVtkXfjukRApeEAJkBsq9C/io4+8MorpydIvhSwk0pJgCeIZCX
3IioF/7WhIprj9Ls2BeVsRk=
=lD1M
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
