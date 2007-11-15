Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iseik-0006OK-Hp
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 08:25:32 -0500
Date: Thu, 15 Nov 2007 14:20:27 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
Message-ID: <20071115132027.GC10165@lazybastard.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<Pine.LNX.4.64.0711151241140.30407@pentafluge.infradead.org>
	<Pine.LNX.4.64.0711151250550.30407@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0711151250550.30407@pentafluge.infradead.org>
Cc: Roman.borisov@intel.com, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 15 November 2007 12:55:07 +0000, Alexey Korolev wrote:
>=20
> Oh I've completely forgot to say that the issue take place on NOR only.
> We think that we can;t reproduce the problem on NAND - because of ECC
> correction which usually corrupts whole page in case of partial write.
> (It could be incorrect just an idea).=20

Could be a writebuffer thing.  Maybe a testcase like this will force it
on NAND.

# mount
head -c3960 /dev/urandom > wbuf_preload
echo 12345 > foo
# wait long enough for write to finish, but not long enough for wbuf to
# get flushed, hit reset button

The size of the preload should be carefully crafted.  3960 bytes plus
node header of 68 bytes leaves exactly another 68 bytes for the next
node header.  So the wbuf gets filled and written right after the second
node's header, but before its data.  Works with wbuf sizes of 512, 1024,
2048 and 4096.

J=C3=B6rn

--=20
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFHPEebfbqVtkXfjukRAs69AJwIShrCNg7uDi6Vy1uAefiqagSQAACgjSG2
+mtUhObCO1EyERvgN87vfWw=
=nRe7
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
