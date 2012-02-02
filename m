Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rss7S-0002gf-HX
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 08:34:15 +0000
Received: by pbdx9 with SMTP id x9so2164700pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 00:34:12 -0800 (PST)
Message-ID: <1328171771.28171.137.camel@sauron.fi.intel.com>
Subject: Re: ubifs - scrubbing failed due to ecc error on new eraseblock?
 (2.6.39)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brad Parker <brad@heeltoe.com>
Date: Thu, 02 Feb 2012 10:36:11 +0200
In-Reply-To: <20120124153052.9a4f1a4b2a45238f732670fb1ee2460e.355e0f7a6b.wbe@email16.secureserver.net>
References: <20120124153052.9a4f1a4b2a45238f732670fb1ee2460e.355e0f7a6b.wbe@email16.secureserver.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6NTKx7+7fwx02VwyH2yi"
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


--=-6NTKx7+7fwx02VwyH2yi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-24 at 15:30 -0700, Brad Parker wrote:
> I saw this panic on 2.6.39; is this an example of an ecc error on a new=
=20
> block during scrubbing?
>=20
> ...
> File Edit Options Buffers Tools Help
> UBI: scrubbed PEB 3762 (LEB 0:1548), data moved to PEB 3684
> UBI error: ubi_io_read: error -74 (ECC error) while reading 65 bytes=20
> from PEB 3684:64864, read 65 bytes
> UBIFS error (pid 912): ubifs_read_node: bad node type (0 but expected 2)
> UBIFS error (pid 912): ubifs_read_node: bad node at LEB 1548:56952, LEB=
=20
> mapping status 1
> Not a node, first 24 bytes:
> 00000000: 68 02 00 00 00 00 00 00 c6 4a 39 4c 00 00 00 00 b6 02 01 00 00

Hmm... Can you please start with validating your flash using the mtd
tests: http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--=20
Best Regards,
Artem Bityutskiy

--=-6NTKx7+7fwx02VwyH2yi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKkr7AAoJECmIfjd9wqK0w6cP+gPWQpBxE3xvThLg/79ovQRf
s7A0bX+DpvbTdewZLpPXtzdvAlZyIC4xnnKiZe15DEepsoaRGUP7R6YOMk6UYnMc
Mxc47KDu/RiIHOKSMTTigXbysx+YeZk1lp7dSnM/iVI6eP+x53p5wLy+eptgGZW1
n/BJTa9DaWyCguvTM+hmSXWDY2Bk7Uo18YzY6QiKciv1HraWhsJw4VxRBwSnR1kE
SwniaraUeQ/w6DO1W/J4Q8dEiJaowUxOfchgPxdoMxoK6T4rQnkiejTFeOupwvTG
iU9HW5/yKSci+F3Uo/TynhOt8eGZtIDxmC4PaDM9fZHcpOnBunkfZhmLB3iXZNZj
Xd+78xr8PgjVFGuxDlIxUxJRDjPWfHl4biBMJbMZZ9ad7prJ/QaQjzM3e/t3h1Ed
36ae5xtLv2znTHiOABwdpDdajATcNvtgz6/7VlBAsgANcnZ/uy0EDn3r4mfuohw6
tSXAnV6ymnTEBpl/MFppyBLAaJI5okmEuJ/+DdX/kVQNEH8wQfUe+1avOjP9pUsG
Keqn/wIgqp3r2H5iAc6bazBXH56cCKiQEa0yg5F1QGZ2TYY3sbDgwtau8Fig/DVL
qv+JlCGVxe+ygiPF9d4Qql5Cf28PZh0Ck4eYnQ7nr3Q2YswkbOAacBmOlzyDpQtZ
SzZVOlLHjZqbg7NsbmrP
=mSl1
-----END PGP SIGNATURE-----

--=-6NTKx7+7fwx02VwyH2yi--
